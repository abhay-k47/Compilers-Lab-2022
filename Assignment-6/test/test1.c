int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

int main()
{
  printStr("\nTEST FILE 1: [ARITHMETIC OPERATIONS]\n");
  int x = 213;
  int y = 10;
  int z = 26;
  int b = z - y;
  int d = z / 2;
  int e = x % y;
  printStr("\nx = ");
  printInt(x);
  printStr("\ny = ");
  printInt(y);
  printStr("\nz = ");
  printInt(z);

  printStr("\n\nTesting binary operator expressions");
  printStr("\n\na = z + 2");
  int a = z + 2;
  printStr("\na = ");
  printInt(a);

  printStr("\n\nb = z - y");
  printStr("\nb = ");
  printInt(b);

  printStr("\n\nc = z * 2");
  float c = z * 2;
  printStr("\nc = ");
  printInt(c);

  printStr("\n\nd = z / 2");
  printStr("\nd = ");
  printInt(d);

  printStr("\n\ne = x % y");
  printStr("\ne = ");
  printInt(e);

  // testing unary operator expressions
  printStr("\n\nTesting unary operator expressions");
  printStr("\nx = ");
  printInt(x);
  int v = ++x;
  printStr("\n\nv = ++x");
  printStr("\nv = ");
  printInt(v);
  int w = --z;
  printStr("\nz = ");
  printInt(z);
  printStr("\n\nw = --z");
  printStr("\nw = ");
  printInt(w);
  int aa = y++;
  printStr("\n\naa = y++");
  printStr("\naa = ");
  printInt(aa);
  int bb = x--;
  printStr("\n\nbb = x--");
  printStr("\nbb = ");
  printInt(bb);
  int cc = +x;
  printStr("\n\ncc = +x");
  printStr("\ncc = ");
  printInt(cc);

  // complex expression with unary and binary operators
  printStr("\n\nTesting complex expression with unary and binary operators");
  int result = (x + y) / (b - 2) % 3 + e * 2 / (2 - x);
  printStr("\n\nresult = (x + y) / (b - 2) % 3 + e * 2 / ( 2 - x)");
  printStr("\nresult = ");
  printInt(result);

  return 0;
}