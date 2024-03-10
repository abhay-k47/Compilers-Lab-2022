int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

void make(int* par, int n)
{
  int i = 0;
  while (i < n)
  {
    par[i] = i;
    i = i + 1;
  }
}
int find_par(int x, int* par)
{
  if (par[x] == x)
  {
    return x;
  }
  int p = find_par(par[x], par);
  par[x] = p;
  return p;
}

void _union(int x, int y, int* par)
{
  int px = find_par(x, par);
  int py = find_par(y, par);
  if (px != py)
  {
    par[px] = py;
  }
}

int main()
{
  printStr("TEST FILE 4: [Function calls and returns]\n");
  int par[10];
  make(par, 10);
  printStr("The parent array is: \n");
  int i = 0;
  while (i < 10)
  {
    printInt(par[i]);
    printStr(" ");
    i = i + 1;
  }
  printStr("\n");
  // make two unions
  // odd numbers are in one union and even numbers are in another union
  _union(1, 3, par);
  _union(3, 5, par);
  _union(5, 7, par);
  _union(7, 9, par);
  _union(2, 4, par);
  _union(4, 6, par);
  _union(6, 8, par);
  _union(8, 10, par);

  printStr("After union find The parent array is: \n");
  i = 0;
  while (i < 10)
  {
    printInt(i + 1);
    printStr(" -> ");
    printInt(par[i]);
    printStr("\n");
    i = i + 1;
  }
  printStr("\n");
  return 0;
}