int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

int main()
{
  printStr("\nTEST FILE 2: IF ELSE STATEMENTS\n");
  int x = 751, y = 483;
  int z = 0;
  int n1 = x + y;
  printStr("\nx = ");
  printInt(x);
  printStr("\ny = ");
  printInt(y);
  printStr("\nz = ");
  printInt(z);
  printStr("\nn1 = ");
  printInt(n1);
  printStr("\n");
  // testing complex if else statements
  if (x > y)
  {
    if (x > 100 && x < 700)
    {
      printStr("x is greater than y and is between 100 and 700\n");
      z = 1;
    }
    else
    {
      printStr("x is greater than y and is not between 100 and 700\n");
      z = 2;
    }
  }
  else if (x == y)
  {
    if (n1 > 1000)
    {
      printStr("x is equal to y and n1 is greater than 1000\n");
      z = 1;
    }
    else if (n1 == 1000)
    {
      printStr("x is equal to y and n1 is equal to 1000\n");
      z--;
    }
    else
    {
      printStr("x is equal to y and n1 is less than 1000\n");
      z = 2;
    }
  }
  else
  {
    if (y > 100 && y < 500)
    {
      printStr("x is less than y and y is between 100 and 500\n");
      z = 3;
    }
    else
    {
      printStr("x is less than y and y is not between 100 and 500\n");
      z = 4;
    }
  }
  return 0;
}