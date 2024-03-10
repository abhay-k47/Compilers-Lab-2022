int func1(int a, const int b, static int c, extern int d, int e, int f)
{
  return a + b + c + d + e + f;
}
int main()
{
  // testing identifiers and keywords
  int num = 10;
  char ch = 'a';
  float pi = 3.14;
  enum days
  {
    mon,
    tue,
    wed,
    thu,
    fri,
    sat,
    sun
  };
  enum days day = mon;
  char str[] = "Hello World";
  char* str2 = "Hello India";
  unsigned int u_int = 10;
  signed int s_int = 10;
  short int sh_int = 10;
  long int l_int = 10;
  double double_const = 10.0;
  long double long_double_const = 10.0;
  _Bool bool_const = 1;
  double _Complex complex_const = 10.0;
  auto int auto_int = 10;
  register int reg_int = 10;
  static int stat_int = 10;
  const int const_int = 10;
  volatile int vol_int = 10;
  // testing typecasting
  int int_cast = (int)pi;
  char char_cast = (char)sh_int;
  float float_cast = (float)num;
  double double_cast = (double)pi;
  long double long_double_cast = (long double)stat_int;
  _Bool bool_cast = (_Bool)vol_int;
  double _Complex complex_cast = (double _Complex)auto_int;
  double _Imaginary imag_cast = (double _Imaginary)reg_int;
  // testing expressions
  int expr1 = 10 + 20;
  int expr2 = num * l_int / (sh_int + double_const * auto_int) % const_int;
  int expr3 = 10 << 2;
  int expr4 = 10 >> 2;
  int expr5 = 10 & 20;
  int expr6 = 10 | 20;
  int expr7 = 10 ^ 20;
  int expr8 = 10 && 20;
  int expr9 = 10 || 20;
  int expr10 = 10 == 20;
  int expr11 = 10 != 20;
  int expr12 = 10 < 20;
  int expr13 = 10 > 20;
  int expr14 = 10 <= 20;
  int expr15 = 10 >= 20;
  int expr16 = 10 ? 20 : 30;
  int expr17 = 10 + 20 - 30 * 40 / 50 % 60;
  // testing assignment operators
  int assign1 = 10;
  assign1 += 20;
  assign1 -= 20;
  assign1 *= 20;
  assign1 /= 20;
  assign1 %= 20;
  assign1 <<= 2;
  assign1 >>= 2;
  assign1 &= 20;
  assign1 |= 20;
  assign1 ^= 20;
  // testing declarations
  int decl1;
  int decl2 = 10;
  int decl3, decl4 = 10;
  // testing sizeof
  int size1 = sizeof(int);
  int size2 = sizeof(float);
  // testing type specifier
  int type1;
  char type2;
  float type3;
  double type4;
  long double type5;
  _Bool type6;
  double _Complex type7;
  double _Imaginary type8;
  enum days type9;
  volatile int type10;
  // testing statements
  if (num < 10)
  {
    num = 10;
  }
  else if (num > 15)
  {
    num = 20;
  }
  else
  {
    num = 30;
  }
  switch (num)
  {
    case 10:
      num = 10;
      break;
    case 20:
      num = 20;
      break;
    default:
      num = 30;
  }
  // testing loops
  while (num < 10)
  {
    num++;
  }
  do
  {
    num++;
  } while (num < 10);

  for (int i = 0; i < 10; i++)
  {
    num++;
  }
  // testing goto
  goto label;
label:
  num = 10;
  // testing function calls
  int func_call = func1(1, 2, 3, 4, 5, 6);
  // testing continue and break
  for (int i = 0; i < 10; i++)
  {
    if (i == 5)
    {
      continue;
    }
    num++;
  }
  for (int i = 0; i < 10; i++)
  {
    if (i == 5)
    {
      break;
    }
    num++;
  }
  // testing return
  return 0;
}
