#include "myio.h"

#define BUFFER 20
#define AFTERDECIMAL 6
#define INT_MAX __INT32_MAX__
#define INT_MIN (-INT_MAX - 1)

int printStr(char* s)
{
  int len = 0;
  while (s[len] != '\0')
    len++;

  __asm__ __volatile__(
      "movl $1, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(s), "d"(len));

  return len;
}

int readInt(int* eP)
{
  char buff[BUFFER];
  int len;

  __asm__ __volatile__(
      "movl $0, %%eax \n\t"
      "movq $0, %%rdi \n\t"
      "syscall \n\t"
      : "=a"(len)
      : "S"(buff), "d"(BUFFER));

  if (len < 0)
  {
    *eP = ERR;
    return 0;
  }

  int sign = 1, index = 0;
  long ret = 0;
  if (index < len)
  {
    if (buff[index] == '-')
    {
      sign = -1;
      index++;
    }
    else if (buff[index] == '+')
    {
      index++;
    }
  }

  while (index < len && buff[index] != '\n')
  {
    if (buff[index] < '0' || buff[index] > '9')
    {
      *eP = ERR;
      return 0;
    }
    int curr = (int)(buff[index] - '0');
    ret *= 10;
    ret += (sign * curr);
    if (ret > INT_MAX || ret < INT_MIN)
    {
      *eP = ERR;
      return 0;
    }
    index++;
  }

  *eP = OK;
  return (int)ret;
}

int printInt(int n)
{
  char out[BUFFER];
  int len = 0;
  long temp_num = n;
  if (temp_num < 0)
  {
    out[len++] = '-';
    temp_num = -temp_num;
  }
  while (temp_num)
  {
    out[len++] = (char)('0' + (temp_num % 10));
    temp_num /= 10;
  }
  if (len == 0)
    out[len++] = '0';

  int front = (out[0] == '-' ? 1 : 0);
  int back = len - 1;
  while (front < back)
  {
    char temp = out[front];
    out[front++] = out[back];
    out[back--] = temp;
  }

  __asm__ __volatile__(
      "movl $1, %%eax \n\t"
      "movq $1, %%rdi \n\t"
      "syscall \n\t"
      :
      : "S"(out), "d"(len));
  return len;
}
