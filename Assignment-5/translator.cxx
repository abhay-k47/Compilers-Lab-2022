#include "translator.h"

// Global Variables
vector<Quad*> quadArray;  // Quad Array
SymbolTable *currentTable, *globalTable, *parentTable;  // Symbol Tables
Symbol* currentSymbol;  // Current Symbol
SymbolType::typeEnum currentType;  // Current Type
int tblCnt, temVarCnt;  // Counts of number of tables and number of temporary variables generated

/**
 * @brief Construct a new SymbolType object
 *
 * @param type Type of the symbol
 * @param arrayType Pointer to the array type
 * @param width Width of the symbol
 */
SymbolType::SymbolType(typeEnum type, SymbolType* arrayType, int width)
    : type(type)
    , width(width)
    , arrayType(arrayType)
{
}

/**
 * @brief size of the type
 *
 * @return int
 */
int SymbolType::getSize()
{
  switch (type)
  {
    case CHAR:
      return 1;
    case INT:
      return 4;
    case FLOAT:
      return 8;
    case POINTER:
      return 4;
    case ARRAY:
      return width * (arrayType->getSize());
    default:
      return 0;
  }
}

/**
 * @brief string representation of the type
 *
 * @return string
 */
string SymbolType::toString()
{
  switch (type)
  {
    case SymbolType::VOID:
      return "void";
    case SymbolType::CHAR:
      return "char";
    case SymbolType::INT:
      return "int";
    case SymbolType::FLOAT:
      return "float";
    case SymbolType::POINTER:
      return "ptr(" + arrayType->toString() + ")";
    case SymbolType::FUNCTION:
      return "function";
    case SymbolType::ARRAY:
      return "array(" + to_string(width) + ", " + arrayType->toString() + ")";
    case SymbolType::BLOCK:
      return "block";
  }
  return "unknown";
}

/**
 * @brief Construct a new SymbolTable object
 *
 * @param name Name of the symbol
 * @param parent Pointer to the parent table
 */
SymbolTable::SymbolTable(string name, SymbolTable* parent)
    : name(name)
    , parent(parent)
{
}

/**
 * @brief insert symbol in the symbol table and return the pointer to the symbol
 *
 * @param name name of symbol
 * @return Symbol*
 */
Symbol* SymbolTable::lookup(string name)
{

  // If the symbol is present in the current table, return it
  auto it = symbols.find(name);
  if (it != symbols.end())
    return &(it->second);
  // // If the symbol is not present in the current table, check the parent table
  Symbol* ret_ptr = nullptr;
  if (parent != NULL)
    ret_ptr = parent->lookup(name);

  // if the symbol is not present in the parent table, insert it in the current table and return
  if (this == currentTable && !ret_ptr)
  {
    symbols.insert({name, *(new Symbol(name))});
    return &(symbols.find(name)->second);
  }
  return ret_ptr;
}

/**
 * @brief Update the symbol table and its children with offsets
 *
 */
void SymbolTable::update()
{
  vector<SymbolTable*> visited;  // children tables to visit
  int offset;
  for (auto& map_entry : symbols)
  {
    if (map_entry.first == symbols.begin()->first)
    {
      map_entry.second.offset = 0;
      offset = map_entry.second.size;
    }
    else
    {
      map_entry.second.offset = offset;
      offset += map_entry.second.size;
    }
    if (map_entry.second.nestedTable)
    {
      visited.push_back(map_entry.second.nestedTable);
    }
  }
  for (auto& table : visited)
  {
    table->update();
  }
}

void SymbolTable::print()
{
  cout << "Symbol Table Name: " << name << "\t\t Parent Symbol Table Name: " << ((parent) ? parent->name : "NULL")
       << endl;
  cout << string(150, '-') << endl;
  cout << setw(20) << "Symbol Name" << setw(50) << "Symbol Type" << setw(20) << "Initial Value" << setw(20) << "Size"
       << setw(20) << "Offset" << setw(20) << "Nested Table Name" << endl;
  cout << string(150, '-') << endl;
  vector<SymbolTable*> tableQueue;

  // print all the symbols in the table
  for (auto& map_entry : symbols)
  {
    cout << setw(20) << map_entry.first;
    fflush(stdout);
    cout << setw(50) << (map_entry.second.isFunction ? "function" : map_entry.second.type->toString());
    cout << setw(20) << map_entry.second.initialValue;
    cout << setw(20) << map_entry.second.size;
    cout << setw(20) << map_entry.second.offset;
    cout << setw(20) << (map_entry.second.nestedTable ? map_entry.second.nestedTable->name : "NULL") << endl;

    if (map_entry.second.nestedTable)
    {
      tableQueue.push_back(map_entry.second.nestedTable);
    }
  }
  cout << string(150, '_') << endl;
  cout << "\n" << endl;

  // print nested tables
  for (auto& table : tableQueue)
  {
    table->print();
  }
}

/**
 * @brief Construct a new Symbol object
 *
 * @param name Name of the symbol
 * @param __type Type of the symbol
 * @param init Initial value of the symbol
 */
Symbol::Symbol(string name, SymbolType::typeEnum __type, string init)
    : name(name)
    , type(new SymbolType(__type))
    , offset(0)
    , nestedTable(NULL)
    , initialValue(init)
    , isFunction(false)
{
  size = type->getSize();
}

/**
 * @brief update type of the symbol
 *
 * @param __type
 * @return Symbol*
 */
Symbol* Symbol::update(SymbolType* __type)
{
  type = __type;
  size = type->getSize();
  return this;
}

/**
 * @brief convert the present symbol to different type, return old symbol if conversion not possible
 *
 * @param type_
 * @return Symbol*
 */
Symbol* Symbol::convert(SymbolType::typeEnum type_)
{

  if ((this->type)->type == SymbolType::typeEnum::FLOAT)
  {
    if (type_ == SymbolType::typeEnum::INT)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "Float_TO_Int(" + name + ")");
      return fin_;
    }
    else if (type_ == SymbolType::typeEnum::CHAR)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "Float_TO_Char(" + name + ")");
      return fin_;
    }
    return this;
  }
  else if ((this->type)->type == SymbolType::typeEnum::INT)
  {
    if (type_ == SymbolType::typeEnum::FLOAT)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "INT_TO_Float(" + name + ")");
      return fin_;
    }
    else if (type_ == SymbolType::typeEnum::CHAR)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "INT_TO_Char(" + name + ")");
      return fin_;
    }
    return this;
  }
  else if ((this->type)->type == SymbolType::typeEnum::CHAR)
  {
    if (type_ == SymbolType::typeEnum::INT)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "Char_TO_Int(" + name + ")");
      return fin_;
    }
    else if (type_ == SymbolType::typeEnum::FLOAT)
    {
      Symbol* fin_ = gentemp(type_);
      emit("=", fin_->name, "Char_TO_Float(" + name + ")");
      return fin_;
    }
    return this;
  }
  return this;
}

/**
 * @brief Construct a new Quad object
 *
 * @param result Name of the symbol which will store the result
 * @param arg1 Name of the first operand
 * @param op Operator
 * @param arg2 Name of the second operand
 */
Quad::Quad(string result, string arg1, string op, string arg2)
    : result(result)
    , op(op)
    , arg1(arg1)
    , arg2(arg2)
{
}

Quad::Quad(string result, int arg1, string op, string arg2)
    : result(result)
    , op(op)
    , arg1(toString(arg1))
    , arg2(arg2)
{
}

void Quad::print()
{
  auto binary_print = [this]()
  { cout << "\t" << this->result << " = " << this->arg1 << " " << this->op << " " << this->arg2 << endl; };
  auto relation_print = [this]()
  { cout << "\tif " << this->arg1 << " " << this->op << " " << this->arg2 << " goto " << this->result << endl; };
  auto shift_print = [this]()
  { cout << "\t" << this->result << " " << this->op[0] << " " << this->op[1] << this->arg1 << endl; };
  auto shift_print_ = [this](string tp) { cout << "\t" << this->result << " " << tp << " " << this->arg1 << endl; };
  if (op == "=")
  {
    cout << "\t" << result << " = " << arg1 << endl;
  }
  else if (op == "goto")
  {
    cout << "\tgoto " << result << endl;
  }
  else if (op == "return")
  {
    cout << "\treturn " << result << endl;
  }
  else if (op == "call")
  {
    cout << "\t" << result << " = call " << arg1 << ", " << arg2 << endl;
  }
  else if (op == "param")
  {
    cout << "\t"
         << "param " << result << endl;
  }
  else if (op == "label")
  {
    cout << result << ":" << endl;
  }
  else if (op == "=[]")
  {
    cout << "\t" << result << " = " << arg1 << "[" << arg2 << "]" << endl;
  }
  else if (op == "[]=")
  {
    cout << "\t" << result << "[" << arg1 << "] = " << arg2 << endl;
  }
  else if (op == "+" or op == "-" or op == "*" or op == "/" or op == "%" or op == "|" or op == "^" or op == "&" or
           op == "<<" or op == ">>")
  {
    binary_print();
  }
  else if (op == "==" or op == "!=" or op == "<" or op == ">" or op == "<=" or op == ">=")
  {
    relation_print();
  }
  else if (op == "=&" or op == "=*")
  {
    shift_print();
  }
  else if (op == "*=")
  {
    cout << "\t"
         << "*" << result << " = " << arg1 << endl;
  }
  else if (op == "=-")
  {
    shift_print_("= -");
  }
  else if (op == "~")
  {
    shift_print_("= ~");
  }
  else if (op == "!")
  {
    shift_print_("= !");
  }
  else
  {
    cout << op << arg1 << arg2 << result << endl;
    cout << "ERROR: invalid operator\n";
  }
}

void emit(string op, string result, string arg1, string arg2)
{
  Quad* q = new Quad(result, arg1, op, arg2);
  quadArray.push_back(q);
}

void emit(string op, string result, int arg1, string arg2)
{
  Quad* q = new Quad(result, arg1, op, arg2);
  quadArray.push_back(q);
}

void backpatch(list<int> list_, int addr)
{
  for (auto& i : list_)
  {
    quadArray[i - 1]->result = toString(addr);
  }
}

list<int> makeList(int base)
{
  return {base};
}

list<int> merge(list<int> first, list<int> second)
{
  list<int> ret = first;
  ret.merge(second);
  return ret;
}

void Expression::toInt()
{
  if (type == Expression::typeEnum::BOOLEAN)
  {
    symbol = gentemp(SymbolType::typeEnum::INT);
    backpatch(trueList, static_cast<int>(quadArray.size() + 1));  // update the true list
    emit("=", symbol->name, "true");  // emit the quad
    emit("goto", toString(static_cast<int>(quadArray.size() + 2)));  // emit the goto quad
    backpatch(falseList, static_cast<int>(quadArray.size() + 1));  // update the false list
    emit("=", symbol->name, "false");
  }
}

void Expression::toBool()
{
  if (type == Expression::typeEnum::NONBOOLEAN)
  {
    // generate symbol of new type and do backpatching and other required operations
    falseList = makeList(static_cast<int>(quadArray.size() + 1));  // update the falselist
    emit("==", "", symbol->name, "0");  // emit general goto statements
    trueList = makeList(static_cast<int>(quadArray.size() + 1));  // update the truelist
    emit("goto", "");
  }
}

// Implementation of other helper functions
int nextInstruction()
{
  return quadArray.size() + 1;
}

/**
 * @brief generates temporary of given type with given value s
 *
 * @param type
 * @param s
 * @return Symbol*
 */
Symbol* gentemp(SymbolType::typeEnum type, string s)
{
  Symbol* temp = new Symbol("t" + toString(temVarCnt++), type, s);
  currentTable->symbols.insert({temp->name, *temp});
  return temp;
}

/**
 * @brief change current table to specified table
 *
 * @param table
 */
void changeTable(SymbolTable* table)
{
  currentTable = table;
}

/**
 * @brief code to check if a and b are of the same type, promotes to the higher type if feasible and if that makes the
 * type of both the same
 *
 * @param a
 * @param b
 * @return true
 * @return false
 */
bool typeCheck(Symbol*& a, Symbol*& b)
{
  // lambda function to check if a and b are of the same type
  std::function<bool(SymbolType*, SymbolType*)> type_comp = [&](SymbolType* first, SymbolType* second) -> bool
  {
    if (!first and !second)
      return true;
    else if (!first or !second or first->type != second->type)
      return false;
    else
      return type_comp(first->arrayType, second->arrayType);
  };
  if (type_comp(a->type, b->type))
    return true;
  else if (a->type->type == SymbolType::FLOAT or b->type->type == SymbolType::FLOAT)
  {
    a = a->convert(SymbolType::FLOAT);
    b = b->convert(SymbolType::FLOAT);
    return true;
  }
  else if (a->type->type == SymbolType::INT or b->type->type == SymbolType::INT)
  {
    a = a->convert(SymbolType::INT);
    b = b->convert(SymbolType::INT);
    return true;
  }
  // return false if not possible to cast to same type
  else
  {
    return false;
  }
}

// Implementation of utility functions
string toString(int i)
{
  return to_string(i);
}

string toString(float f)
{
  return to_string(f);
}

string toString(char c)
{
  return string(1, c);
}

int main()
{
  // initialization of global variables
  tblCnt = 0;
  temVarCnt = 0;
  globalTable = new SymbolTable("global");
  currentTable = globalTable;
  cout << left;
  yyparse();
  globalTable->update();
  globalTable->print();
  int ins = 1;
  for (auto it : quadArray)
  {
    cout << setw(4) << ins++ << ": ";
    it->print();
  }
  return 0;
}
