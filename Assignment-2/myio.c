#include "myio.h"
#define BUFF_SIZE 100

/**
 * @brief prints string of characters in STDOUT
 *
 * @param __nptr null-terminated string of characters
 * @return int - number of characters printed
 */
int printStr(char* __nptr)
{
  char buff[BUFF_SIZE];
  int len = 0;

  while (__nptr[len] != '\0')
  {
    buff[len++] = __nptr[len];
  }

  // display the string to output
  __asm__ __volatile__(
      "movl $1, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(buff), "d"(len));

  return len;  // returns number of characters printed
}

/**
 * @brief reads signed integer from STDIN
 *
 * @param __iptr pointer to integer to be read
 * @return int - OK on success, ERR on failure
 */
int readInt(int* __iptr)
{
  char buff[BUFF_SIZE];
  long int n = 0;
  int is_negative = 0, idx = 0;

  __asm__ __volatile__(
      "movl $0, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(buff), "d"(sizeof(buff)));

  if (buff[0] == '+')
  {
    idx++;
  }

  if (buff[0] == '-')
  {
    is_negative = 1;
    idx++;
  }

  while (buff[idx] != ' ' && buff[idx] != '\t' && buff[idx] != '\n')
  {
    if ((buff[idx] < '0') || (buff[idx] > '9'))
    {
      return ERR;
    }
    n = 10 * n + (int)(buff[idx] - '0');
    idx++;
  }

  if (is_negative)
  {
    n = -n;
  }

  *__iptr = n;
  return OK;
}

/**
 * @brief prints signed integer in STDOUT
 *
 * @param __n integer to be printed
 * @return int - if success, number of characters printed, else ERR
 */
int printInt(int __n)
{
  char buff[BUFF_SIZE];
  long int n = __n;
  int len = 0, is_negative = 0;

  if (!n)
    buff[len++] = '0';

  else
  {
    if (n < 0)
    {
      is_negative = 1;
      n *= -1;
    }

    while (n)
    {
      buff[len++] = (char)(n % 10 + '0');
      n /= 10;
    }
    if (is_negative)
    {
      buff[len++] = '-';
    }
    int left = 0, right = len - 1;
    while (left < right)
    {
      char temp = buff[left];
      buff[left++] = buff[right];
      buff[right--] = temp;
    }
  }

  __asm__ __volatile__(
      "movl $1, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(buff), "d"(len));

  return len;
}

/**
 * @brief reads a floating point number from STDIN
 *
 * @param __fptr pointer to floating point number to be read
 * @return int - OK on success, ERR on failure
 */
int readFlt(float* __fptr)
{
  char buff[BUFF_SIZE];
  float f = 0, deci = 1;
  int deci_occurred = 0, is_negative = 0, idx = 0;

  __asm__ __volatile__(
      "movl $0, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(buff), "d"(sizeof(buff)));

  if (buff[0] == '+')
  {
    idx++;
  }

  if (buff[0] == '-')
  {
    is_negative = 1;
    idx++;
  }

  while (buff[idx] != ' ' && buff[idx] != '\t' && buff[idx] != '\n')
  {
    if (((buff[idx] < '0') || (buff[idx] > '9')) && (buff[idx] != '.' || deci_occurred == 1))
    {
      return ERR;
    }

    if (buff[idx] == '.')
    {
      deci_occurred = 1;
      idx++;
      continue;
    }

    if (deci_occurred == 0)
    {
      f = 10 * f + (int)(buff[idx] - '0');
    }

    else
    {
      deci *= 10;
      f += ((float)(buff[idx] - '0')) / deci;
    }
    idx++;
  }

  if (is_negative)
  {
    f = -f;
  }

  *__fptr = f;
  return OK;
}

/**
 * @brief prints floating point number in STDOUT
 *
 * @param f floating point number to be printed
 * @return int - if success, number of characters printed, else ERR
 */
int printFlt(float f)
{
  char buff[BUFF_SIZE];
  int len = 0, is_negative = 0;

  if (!f)
  {
    buff[len++] = '0';
    buff[len++] = '.';
    buff[len++] = '0';
  }

  else
  {
    if (f < 0)
    {
      is_negative = 1;
      f *= -1;
    }

    int deci = 0;
    while ((int)f != f)
    {
      f *= 10;
      deci++;
    }

    if (deci == 0)
    {
      buff[len++] = '0';
      buff[len++] = '.';
    }

    int n = f;
    while (n)
    {
      if (len == deci)
        buff[len++] = '.';
      buff[len++] = (char)(n % 10 + '0');
      n /= 10;
    }
    if (len == deci)
    {
      buff[len++] = '.';
      buff[len++] = '0';
    }
    if (is_negative)
    {
      buff[len++] = '-';
    }

    int left = 0, right = len - 1;
    while (left < right)
    {
      char temp = buff[left];
      buff[left++] = buff[right];
      buff[right--] = temp;
    }
  }

  __asm__ __volatile__(
      "movl $1, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(buff), "d"(len));

  return len;
}
