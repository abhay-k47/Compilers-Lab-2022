int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

int main()
{
  printStr("TEST FILE 3: [1-D ARRAYS]\n");
  int a[10];
  int i = 0;
  int j = 0;
  int n = 10;
  int sum = 0;
  int eP = 0;
  int maxe = -1000000;
  int mine = 1000000;
  printStr("Enter 10 numbers: \n");
  while (i < n)
  {
    a[i] = readInt(&eP);
    i = i + 1;
  }
  printStr("The numbers are: \n");
  while (j < n)
  {
    printInt(a[j]);
    printStr(" ");
    j = j + 1;
  }
  printStr("\n");
  i = 0;
  while (i < n)
  {
    sum = sum + a[i];
    i = i + 1;
  }
  printStr("The sum of the numbers is: ");
  printInt(sum);
  printStr("\n");

  i = 0;
  while (i < n)
  {
    if (a[i] > maxe)
    {
      maxe = a[i];
    }
    i = i + 1;
  }
  printStr("The maximum element is: ");
  printInt(maxe);
  printStr("\n");

  i = 0;
  while (i < n)
  {
    if (a[i] < mine)
    {
      mine = a[i];
    }
    i = i + 1;
  }
  printStr("The minimum element is: ");
  printInt(mine);
  printStr("\n");

  return 0;
}