#include "translator.h"

string inputFileName, assemblyFileName;
ActivationRecord* currentAR;  // points to the activation record of the current function
ofstream assemblyFile;

map<int, string> retSizeRegMap = {{1, "al"}, {4, "eax"}, {8, "rax"}};
map<int, string> arg1SizeRegMap = {{1, "dil"}, {4, "edi"}, {8, "rdi"}};
map<int, string> arg2SizeRegMap = {{1, "sil"}, {4, "esi"}, {8, "rsi"}};
map<int, string> arg3SizeRegMap = {{1, "dl"}, {4, "edx"}, {8, "rdx"}};
map<int, string> arg4SizeRegMap = {{1, "cl"}, {4, "ecx"}, {8, "rcx"}};
map<int, map<int, string>> argNum2RegMap = {{1, arg1SizeRegMap},
                                            {2, arg2SizeRegMap},
                                            {3, arg3SizeRegMap},
                                            {4, arg4SizeRegMap}};

map<char, int> escapeCharactersAsciiValues =
    {{'n', 10}, {'t', 9}, {'r', 13}, {'b', 8}, {'f', 12}, {'v', 11}, {'a', 7}, {'0', 0}};

int getAsciiValue(string charConst)
{
  /*
      Returns the ascii value of the character constant
  */
  if (charConst.length() == 3)
    return (int)charConst[1];
  else if (escapeCharactersAsciiValues.find(charConst[2]) != escapeCharactersAsciiValues.end())
    return escapeCharactersAsciiValues[charConst[2]];
  else
    return (int)charConst[2];
}

string getReg(string paramName, int paramNum, int size)
{
  /*
      Returns the register in which the parameter is stored
  */
  string reg = argNum2RegMap[paramNum][size];
  return "%" + reg;
}

string getStackLoc(string paramName)
{
  /*
      Returns the stack location of the parameter
  */
  if (currentAR->displacement.count(paramName))
    return toString(currentAR->displacement[paramName]) + "(%rbp)";
  else
    return paramName;
}

void loadParam(string paramName, int paramNum)
{
  /*
      Loads the parameter from the register to the stack
  */
  Symbol* symbol = currentTable->lookup(paramName);
  int size = symbol->size;
  SymbolType::typeEnum type = symbol->type->type;
  string movIns = "";
  if (type == SymbolType::ARRAY)
  {
    movIns = "movq";
    size = 8;
  }
  else if (size == 1)
  {
    movIns = "movb";
  }
  else if (size == 4)
  {
    movIns = "movl";
  }
  else if (size == 8)
  {
    movIns = "movq";
  }
  string reg = getReg(paramName, paramNum, size);
  assemblyFile << "\t" << setw(8) << movIns << reg << ", " << getStackLoc(paramName) << endl;
}

void storeParam(string paramName, int paramNum)
{
  /*
      Stores the parameter from the stack to the register
  */
  Symbol* symbol = currentTable->lookup(paramName);
  int size = symbol->size;
  SymbolType::typeEnum type = symbol->type->type;
  string movIns = "";
  if (type == SymbolType::ARRAY)
  {
    movIns = "leaq";
    size = 8;
  }
  else if (size == 1)
  {
    movIns = "movb";
  }
  else if (size == 4)
  {
    movIns = "movl";
  }
  else if (size == 8)
  {
    movIns = "movq";
  }
  string reg = getReg(paramName, paramNum, size);
  assemblyFile << "\t" << setw(8) << movIns << getStackLoc(paramName) << ", " << reg << endl;
}

void translate()
{
  /*
      Translates the input TAC to assembly code
  */
  assemblyFile.open(assemblyFileName);

  assemblyFile << left;
  assemblyFile << "\t.file\t\"" + inputFileName + "\"" << endl;

  assemblyFile << endl;
  assemblyFile << "#\t"
               << "Allocation of function variables and temporaries on the stack:\n"
               << endl;

  // Allocate space for the global variables
  for (auto& symbol : globalTable->symbols)
  {
    if (symbol.second.category == Symbol::FUNCTION)
    {
      assemblyFile << "#\t" << symbol.second.name << endl;
      for (auto& record : symbol.second.nestedTable->activationRecord->displacement)
      {
        assemblyFile << "#\t" << record.first << ": " << record.second << endl;
      }
    }
  }
  assemblyFile << endl;

  // string literals in the read only data section
  if (stringLiterals.size() > 0)
  {
    assemblyFile << "\t.section\t.rodata" << endl;
    int i = 0;
    for (auto& stringLiteral : stringLiterals)
    {
      assemblyFile << ".LC" << i++ << ":" << endl;
      assemblyFile << "\t.string\t" << stringLiteral << endl;
    }
  }

  // global variables (uninitialised)
  for (auto& symbol : globalTable->symbols)
  {
    if (symbol.second.initialValue.empty() && symbol.second.category == Symbol::GLOBAL)
    {
      assemblyFile << "\t.comm\t" << symbol.first << "," << symbol.second.size << "," << symbol.second.size << endl;
    }
  }

  // convert tac labels to assembly labels
  map<int, string> labelMap;
  int quadNum = 1, labelNum = 0;
  for (auto& quad : quadArray)
  {
    if (quad->op == "label")
    {
      labelMap[quadNum] = ".LFB" + toString(labelNum);
    }
    else if (quad->op == "labelend")
    {
      labelMap[quadNum] = ".LFE" + toString(labelNum);
      labelNum++;
    }
    quadNum++;
  }
  for (auto& quad : quadArray)
  {
    if (quad->op == "goto" or quad->op == "==" or quad->op == "!=" or quad->op == "<" or quad->op == ">" or
        quad->op == "<=" or quad->op == ">=")
    {
      int loc = stoi(quad->result);
      if (labelMap.find(loc) == labelMap.end())
      {
        labelMap[loc] = ".L" + toString(labelNum);
        labelNum++;
      }
    }
  }

  bool inTextSpace = false;
  string globalStringTemp;
  int globalIntTemp, globalCharTemp;
  string functionEndLabel;
  stack<string> params;  // stack to store the params for function calls
  quadNum = 1;
  for (auto& quad : quadArray)
  {
    if (quad->op == "label")
    {
      if (!inTextSpace)
      {
        assemblyFile << "\t.text" << endl;
        inTextSpace = true;
      }

      currentTable = globalTable->lookup(quad->result)->nestedTable;
      currentAR = currentTable->activationRecord;

      functionEndLabel = labelMap[quadNum];
      functionEndLabel[3] = 'E';

      // function prologue
      assemblyFile << "\t" << setw(8) << ".globl" << quad->result << endl;
      assemblyFile << "\t" << setw(8) << ".type" << quad->result << ", @function" << endl;
      assemblyFile << quad->result << ":" << endl;
      assemblyFile << labelMap[quadNum] << ":" << endl;
      assemblyFile << "\t"
                   << ".cfi_startproc" << endl;
      assemblyFile << "\t" << setw(8) << "pushq"
                   << "%rbp" << endl;
      assemblyFile << "\t.cfi_def_cfa_offset 16" << endl;
      assemblyFile << "\t.cfi_offset 6, -16" << endl;
      assemblyFile << "\t" << setw(8) << "movq"
                   << "%rsp, %rbp" << endl;
      assemblyFile << "\t.cfi_def_cfa_register 6" << endl;
      assemblyFile << "\t" << setw(8) << "subq"
                   << "$" << -currentAR->totalDisplacement << ", %rsp" << endl;

      int paramNum = 1;
      for (auto param : currentTable->parameters)
      {
        loadParam(param, paramNum);
        paramNum++;
      }
    }
    else if (quad->op == "labelend")
    {
      // function epilogue
      assemblyFile << labelMap[quadNum] << ":" << endl;
      assemblyFile << "\t" << setw(8) << "movq"
                   << "%rbp, %rsp" << endl;
      assemblyFile << "\t" << setw(8) << "popq"
                   << "%rbp" << endl;
      assemblyFile << "\t"
                   << ".cfi_def_cfa 7, 8" << endl;
      assemblyFile << "\t"
                   << "ret" << endl;
      assemblyFile << "\t"
                   << ".cfi_endproc" << endl;
      assemblyFile << "\t" << setw(8) << ".size" << quad->result << ", .-" << quad->result << endl;

      inTextSpace = false;
    }
    else
    {
      if (inTextSpace)
      {

        string op = quad->op;
        string result = quad->result;
        string arg1 = quad->arg1;
        string arg2 = quad->arg2;

        if (labelMap.count(quadNum))
        {
          assemblyFile << labelMap[quadNum] << ":" << endl;
        }

        if (op == "=")
        {
          // if arg1 is a constant
          if (isdigit(arg1[0]))
          {
            assemblyFile << "\t" << setw(8) << "movl"
                         << "$" << arg1 << ", " << getStackLoc(result) << endl;
          }
          else if (arg1[0] == '\'')
          {
            assemblyFile << "\t" << setw(8) << "movb"
                         << "$" << getAsciiValue(arg1) << ", " << getStackLoc(result) << endl;
          }
          else
          {
            // check the size of arg1 in the current table and apply the corresponding move from arg1 to result via the
            // appropriate register
            int sz = currentTable->lookup(arg1)->size;
            if (sz == 1)
            {
              assemblyFile << "\t" << setw(8) << "movb" << getStackLoc(arg1) << ", %al" << endl;
              assemblyFile << "\t" << setw(8) << "movb"
                           << "%al, " << getStackLoc(result) << endl;
            }
            else if (sz == 4)
            {
              assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", %eax" << endl;
              assemblyFile << "\t" << setw(8) << "movl"
                           << "%eax, " << getStackLoc(result) << endl;
            }
            else if (sz == 8)
            {
              assemblyFile << "\t" << setw(8) << "movq" << getStackLoc(arg1) << ", %rax" << endl;
              assemblyFile << "\t" << setw(8) << "movq"
                           << "%rax, " << getStackLoc(result) << endl;
            }
          }
        }
        else if (op == "=str")
        {
          assemblyFile << "\t" << setw(8) << "movq"
                       << "$.LC" << arg1 << ", " << getStackLoc(result) << endl;
        }
        else if (op == "param")
        {
          params.push(result);
        }
        else if (op == "call")
        {
          int paramCount = stoi(arg2);
          while (paramCount)
          {
            storeParam(params.top(), paramCount);
            params.pop();
            paramCount--;
          }

          assemblyFile << "\t" << setw(8) << "call" << arg1 << endl;
          // check the size of result in the current table and apply the corresponding move from appropriate return
          // register to result
          int sz = currentTable->lookup(result)->size;
          if (sz == 1)
          {
            assemblyFile << "\t" << setw(8) << "movb"
                         << "%al, " << getStackLoc(result) << endl;
          }
          else if (sz == 4)
          {
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%eax, " << getStackLoc(result) << endl;
          }
          else if (sz == 8)
          {
            assemblyFile << "\t" << setw(8) << "movq"
                         << "%rax, " << getStackLoc(result) << endl;
          }
        }
        else if (op == "return")
        {
          if (!result.empty())
          {
            // check the size of result in the current table and apply the corresponding move from result to return
            // register
            int sz = currentTable->lookup(result)->size;
            if (sz == 1)
            {
              assemblyFile << "\t" << setw(8) << "movb" << getStackLoc(result) << ", %al" << endl;
            }
            else if (sz == 4)
            {
              assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(result) << ", %eax" << endl;
            }
            else if (sz == 8)
            {
              assemblyFile << "\t" << setw(8) << "movq" << getStackLoc(result) << ", %rax" << endl;
            }
          }
          if (quadArray[quadNum]->op !=
              "labelend")  // if the next quad is not a labelend, then we need to jump to the function end
            assemblyFile << "\t" << setw(8) << "jmp" << functionEndLabel << endl;
        }
        else if (op == "goto")
        {
          assemblyFile << "\t" << setw(8) << "jmp" << labelMap[stoi(result)] << endl;
        }
        else if (op == "==" or op == "!=" or op == "<" or op == "<=" or op == ">" or op == ">=")
        {
          // if arg1 == arg2
          int sz = currentTable->lookup(arg1)->size;
          string movins, cmpins, movreg;
          if (sz == 1)
          {
            movins = "movb";
            cmpins = "cmpb";
            movreg = "%al";
          }
          else if (sz == 4)
          {
            movins = "movl";
            cmpins = "cmpl";
            movreg = "%eax";
          }
          else if (sz == 8)
          {
            movins = "movq";
            cmpins = "cmpq";
            movreg = "%rax";
          }
          assemblyFile << "\t" << setw(8) << movins << getStackLoc(arg2) << ", " << movreg << endl;
          assemblyFile << "\t" << setw(8) << cmpins << movreg << ", " << getStackLoc(arg1) << endl;
          if (op == "==")
          {
            assemblyFile << "\t" << setw(8) << "je" << labelMap[stoi(result)] << endl;
          }
          else if (op == "!=")
          {
            assemblyFile << "\t" << setw(8) << "jne" << labelMap[stoi(result)] << endl;
          }
          else if (op == "<")
          {
            assemblyFile << "\t" << setw(8) << "jl" << labelMap[stoi(result)] << endl;
          }
          else if (op == "<=")
          {
            assemblyFile << "\t" << setw(8) << "jle" << labelMap[stoi(result)] << endl;
          }
          else if (op == ">")
          {
            assemblyFile << "\t" << setw(8) << "jg" << labelMap[stoi(result)] << endl;
          }
          else if (op == ">=")
          {
            assemblyFile << "\t" << setw(8) << "jge" << labelMap[stoi(result)] << endl;
          }
        }
        else if (op == "+")
        {
          if (result == arg1)
          {
            // increment arg1
            assemblyFile << "\t" << setw(8) << "incl" << getStackLoc(arg1) << endl;
          }
          else
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "addl" << getStackLoc(arg2) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%eax"
                         << ", " << getStackLoc(result) << endl;
          }
        }
        else if (op == "-")
        {
          if (result == arg1)
          {
            // decrement arg1
            assemblyFile << "\t" << setw(8) << "decl" << getStackLoc(arg1) << endl;
          }
          else
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "subl" << getStackLoc(arg2) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%eax"
                         << ", " << getStackLoc(result) << endl;
          }
        }
        else if (op == "*")
        {
          assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                       << "%eax" << endl;
          if (isdigit(arg2[0]))
          {
            assemblyFile << "\t" << setw(8) << "imull"
                         << "$" + getStackLoc(arg2) << ", "
                         << "%eax" << endl;
          }
          else
          {
            assemblyFile << "\t" << setw(8) << "imull" << getStackLoc(arg2) << ", "
                         << "%eax" << endl;
          }
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%eax"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "/")
        {
          assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "cdq" << endl;
          assemblyFile << "\t" << setw(8) << "idivl" << getStackLoc(arg2) << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%eax"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "%")
        {
          assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "cdq" << endl;
          assemblyFile << "\t" << setw(8) << "idivl" << getStackLoc(arg2) << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%edx"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "=[]")
        {
          // result = arg1[arg2]
          Symbol* symbol = currentTable->lookup(arg1);
          if (symbol->category == Symbol::PARAMETER)
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg2) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "cltq" << endl;
            assemblyFile << "\t" << setw(8) << "addq" << getStackLoc(arg1) << ", "
                         << "%rax" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "(%rax)"
                         << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%eax"
                         << ", " << getStackLoc(result) << endl;
          }
          else
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg2) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "cltq" << endl;
            assemblyFile << "\t" << setw(8) << "movl" << currentAR->displacement[arg1] << "(%rbp, %rax, 1)"
                         << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%eax"
                         << ", " << getStackLoc(result) << endl;
          }
        }
        else if (op == "[]=")
        {
          // result[arg1] = arg2
          Symbol* symbol = currentTable->lookup(result);
          if (symbol->category == Symbol::PARAMETER)
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "cltq" << endl;
            assemblyFile << "\t" << setw(8) << "addq" << getStackLoc(result) << ", "
                         << "%rax" << endl;
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg2) << ", "
                         << "%ebx" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%ebx"
                         << ", "
                         << "(%rax)" << endl;
          }
          else
          {
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                         << "%eax" << endl;
            assemblyFile << "\t" << setw(8) << "cltq" << endl;
            assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg2) << ", "
                         << "%ebx" << endl;
            assemblyFile << "\t" << setw(8) << "movl"
                         << "%ebx"
                         << ", " << currentAR->displacement[result] << "(%rbp, %rax, 1)" << endl;
          }
        }
        else if (op == "=&")
        {
          // result = &arg1
          assemblyFile << "\t" << setw(8) << "leaq" << getStackLoc(arg1) << ", "
                       << "%rax" << endl;
          assemblyFile << "\t" << setw(8) << "movq"
                       << "%rax"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "=*")
        {
          // result = *arg1
          assemblyFile << "\t" << setw(8) << "movq" << getStackLoc(arg1) << ", "
                       << "%rax" << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "(%rax)"
                       << ", "
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%eax"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "=-")
        {
          // result = -arg1
          assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "negl"
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%eax"
                       << ", " << getStackLoc(result) << endl;
        }
        else if (op == "*=")
        {
          // *result = arg1
          assemblyFile << "\t" << setw(8) << "movl" << getStackLoc(arg1) << ", "
                       << "%eax" << endl;
          assemblyFile << "\t" << setw(8) << "movq" << getStackLoc(result) << ", "
                       << "%rbx" << endl;
          assemblyFile << "\t" << setw(8) << "movl"
                       << "%eax"
                       << ", "
                       << "(%rbx)" << endl;
        }
      }
      else
      {
        currentSymbol = globalTable->lookup(quad->result);
        // store the assignment value, removing the need of temporaries
        if (currentSymbol->category == Symbol::TEMPORARY)
        {
          if (currentSymbol->type->type == SymbolType::INT)
          {
            globalIntTemp = stoi(quad->arg1);
          }
          else if (currentSymbol->type->type == SymbolType::CHAR)
          {
            globalCharTemp = getAsciiValue(quad->arg1);
          }
          else if (currentSymbol->type->type == SymbolType::POINTER)
          {
            globalStringTemp = ".LC" + quad->arg1;
          }
        }
        else
        {
          if (currentSymbol->type->type == SymbolType::INT)
          {
            assemblyFile << "\t" << setw(8) << ".globl" << currentSymbol->name << endl;
            assemblyFile << "\t" << setw(8) << ".data" << endl;
            assemblyFile << "\t" << setw(8) << ".align" << 4 << endl;
            assemblyFile << "\t" << setw(8) << ".type" << currentSymbol->name << ", @object" << endl;
            assemblyFile << "\t" << setw(8) << ".size" << currentSymbol->name << ", 4" << endl;
            assemblyFile << currentSymbol->name << ":" << endl;
            assemblyFile << "\t" << setw(8) << ".long" << globalIntTemp << endl;
          }
          else if (currentSymbol->type->type == SymbolType::CHAR)
          {
            assemblyFile << "\t" << setw(8) << ".globl" << currentSymbol->name << endl;
            assemblyFile << "\t" << setw(8) << ".data" << endl;
            assemblyFile << "\t" << setw(8) << ".type" << currentSymbol->name << ", @object" << endl;
            assemblyFile << "\t" << setw(8) << ".size" << currentSymbol->name << ", 1" << endl;
            assemblyFile << currentSymbol->name << ":" << endl;
            assemblyFile << "\t" << setw(8) << ".byte" << globalCharTemp << endl;
          }
          else if (currentSymbol->type->type == SymbolType::POINTER)
          {
            assemblyFile << "\t"
                         << ".section	.data.rel.local" << endl;
            assemblyFile << "\t" << setw(8) << ".align" << 8 << endl;
            assemblyFile << "\t" << setw(8) << ".type" << currentSymbol->name << ", @object" << endl;
            assemblyFile << "\t" << setw(8) << ".size" << currentSymbol->name << ", 8" << endl;
            assemblyFile << currentSymbol->name << ":" << endl;
            assemblyFile << "\t" << setw(8) << ".quad" << globalStringTemp << endl;
          }
        }
      }
    }

    quadNum++;
  }

  assemblyFile.close();
}

int main(int argc, char const* argv[])
{
  inputFileName = string(argv[1]) + ".c";
  assemblyFileName = string(argv[1]) + ".s";

  tableCount = 0;
  temporaryCount = 0;
  globalTable = new SymbolTable("global");
  currentTable = globalTable;
  cout << left;

  yyin = fopen(inputFileName.c_str(), "r");
  yyparse();

  globalTable->update();

  globalTable->print();
  finalBackpatch();
  int ins = 1;
  for (auto it : quadArray)
  {
    cout << setw(4) << ins++ << ": ";
    it->print();
  }

  translate();

  return 0;
}
