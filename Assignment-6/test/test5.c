int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

const int MOD = 19;
char* success = "CODE EXECUTED SUCCESSFULLY\n";
int modulo_exponentiation(int x, int y)
{
  int res = 1;
  while (y > 0)
  {
    if (y & 1)
    {
      res = (res * x) % MOD;
    }
    y = y / 2;
    x = (x * x) % MOD;
  }
  return res;
}
int numGlobal = 200;
int* ptrGlobal;
int main()
{
  printStr("TEST FILE 5: [Global variables]\n");
  int x = 23;
  int y = 12;
  int z = modulo_exponentiation(x, y);
  printStr("\nx = ");
  printInt(x);
  printStr("\ny = ");
  printInt(y);
  printStr("\nx^y = z = ");
  printInt(z);
  printStr(" (MOD ");
  printInt(MOD);
  printStr(")\n");
  printStr("\n");

  char* college = "IIT Kharagpur";
  int year = 1951;
  int* ptr = &year;
  printStr("Local variables:\n");
  printStr("college = ");
  printStr(college);
  printStr("\nyear = ");
  printInt(year);
  printStr("\nptr = ");
  printInt(*ptr);
  printStr("\n");

  ptrGlobal = &numGlobal;
  printStr("Global variables:\n");
  printStr("numGlobal = ");
  printInt(numGlobal);
  printStr("\nptrGlobal = ");
  printInt(*ptrGlobal);
  printStr("\n");
  printStr("MOD = ");
  printInt(MOD);
  printStr("\n");

  year = numGlobal;
  printStr("year = numGlobal = ");
  printInt(year);
  printStr("\n");

  ptrGlobal = &year;
  printStr("ptrGlobal = &year = ");
  printInt(*ptrGlobal);
  printStr("\n");

  numGlobal = year * 5;
  printStr("numGlobal = year * 5 = ");
  printInt(numGlobal);
  printStr("\n");

  printStr(success);
  return 0;
}