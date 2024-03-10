/*
**    Compilers Laboratory, Autumn 2022
**    Assignment-3
**    Abhay Kumar Keshari: 20CS10001
**    Shivam Raj: 20CS10056
*/

#include <complex.h>
#include <stdio.h>
#define MAX_SIZE 100

extern int* func();
typedef long int li;

enum __enum
{
  MON,
  TUE,
  WED,
  THU,
  FRI,
  SAT,
  SUN
};

struct __struct
{
  enum __enum day;
  int size;
  _Bool flag;
  _Complex z;
};

union __union
{
  double d;
  unsigned int u;
};

inline void check_keywords(int n, ...)
{
  auto it = func();
  const int MOD = 1000000007;
  volatile int a;
  short int b;
  static int c = 1;
}

void f_optimize(int* a, int* b, int* restrict c)
{
  *a += *c;
  *b += *c;
}
signed int main()
{
  int i = 0;
  while (i < MAX_SIZE)
  {
    i *= i;
  }
  int n;
  do
  {
    scanf("%d", &n);
  } while (n != 0);

  int j = 1 << 3;
  for (int i = 0; i <= j; i++)
  {
    // arithmetic operations
    i += j;
    i -= j;
    i *= 5;
    // i = i/2
    i /= 2;
    i = i + j * j;
    i -= j ^ j;
    _Bool check = ~i & j;
    if (i % j == 0)
      printf("%d is divisible by %d", i, j);
    else
    {
      i = i * i - 5 + i ^ j / i;
      i--;
    }
  }
  char delim = '\n';
  char arr[] = "This is my assignment 3";
  char* str = (char*)malloc(sizeof(arr));
  char e = "";

  //  floating point declarations
  double d1 = 1.;
  double d2 = .00;
  const float f1 = .12;
  float f2 = .6022E-9;
  float f3 = 0.123e+2;
  float f4 = 1.2345e09;
  unsigned long l = 100000000;

  int k;
  scanf("%d", &k);
  switch (k)
  {
    case 0:
      n++;
      break;
    case 1:
      n--;
      break;
    default:
      break;
  }

  if (k & 1)
    goto print;
print:
  k = k * 10 + 20;

  // register keyword
  int ri = 10;
  register int* r = &i;
  printf("%d\n", *r);

  // restrict keyword
  int rst_1 = 5, rst_2 = 6, rst_3 = 7;
  f_optimize(&rst_1, &rst_2, &rst_3);
  printf("%d %d %d\n", rst_1, rst_2, rst_3);

  return 0;
}
