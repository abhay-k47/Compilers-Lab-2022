#include "myio.h"
#define INT_MAX __INT32_MAX__
#define INT_MIN (-__INT32_MAX__ - 1)

int main()
{
  printStr("__________Custom Testing: printStr__________\n");
  char* test_string[2] = {"Sample string.", ""};
  for (int i = 0; i < 2; i++)
  {
    printStr("\"");
    int n = printStr(test_string[i]);
    printStr("\" \t #characters= ");
    printInt(n);
    printStr("\n");
  }
  printStr("\n");

  printStr("__________Custom Testing: printInt__________\n");
  int ints[10] = {0, 5, -8, 14, 9999, -1000, 54844, -245444, INT_MAX, INT_MIN};
  for (int i = 0; i < 10; i++)
  {
    int n = printInt(ints[i]);
    printStr("\t #characters= ");
    printInt(n);
    printStr("\n");
  }
  printStr("\n");

  printStr("__________Custom Testing: printFlt__________\n");
  float floats[6] = {0.0, -2.56, 47.86, -2.0, 0.9874, -147.4589};
  for (int i = 0; i < 6; i++)
  {
    int n = printFlt(floats[i]);
    printStr("\t #characters= ");
    printInt(n);
    printStr("\n");
  }
  printStr("\n");

  printStr("__________Custom Testing: readInt__________\n");
  int n;
  int i = 0;
  do
  {
    printStr("Enter an integer: ");
    if (readInt(&n) == ERR)
      printStr("ERROR: Not an integer. ");
    else
    {
      printStr("Successfuly read integer: ");
      printInt(n);
    }
    printStr("\nTo continue enter 1, otherwise -9: ");
    readInt(&i);
  } while (i != -9);
  printStr("\n");

  printStr("__________Custom Testing: readFlt__________\n");
  float f;
  i = 0;
  do
  {
    printStr("Enter a float: ");
    if (readFlt(&f) == ERR)
      printStr("ERROR: Not a floating point number. ");
    else
    {
      printStr("Successfuly read float: ");
      printFlt(f);
    }
    printStr("\nTo continue reading enter 1 otherwise -9: ");
    readInt(&i);
  } while (i != -9);
  printStr("\n");
  return 0;
}