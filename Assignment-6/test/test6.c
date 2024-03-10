int printStr(char* s);
int readInt(int* eP);
int printInt(int n);

int main()
{
  printStr("TEST FILE 6: [LOOPS AND RELATIONAL OPERATORS]\n");
  int MAXN = 1000;
  int i = 0;
  int sum = 0;
  int prime[1000];
  prime[0] = 0;
  prime[1] = 0;
  for (i = 2; i < MAXN; i++)
  {
    prime[i] = 1;
  }
  for (i = 2; i < MAXN; i++)
  {
    if (prime[i] == 1)
    {
      int j = i * i;
      while (j < MAXN)
      {
        prime[j] = 0;
        j = j + i;
      }
    }
  }
  printStr("Number of primes less than 1000: ");
  int count = 0;
  i = 0;
  do
  {
    if (prime[i] == 1)
    {
      count = count + 1;
    }
    i = i + 1;
  } while (i < MAXN);
  printInt(count);
  printStr("\n");
  printStr("Sum of primes less than 1000: ");
  i = 0;
  do
  {
    if (prime[i] == 1)
    {
      sum = sum + i;
    }
    i = i + 1;
  } while (i < MAXN);
  printInt(sum);
  printStr("\n");

  int n1, n2;

  n1 = 5, n2 = 5;
  printStr("\nTesting == operator: ");
  if (n1 == n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n2 = 6;
  printStr("\nTesting != operator: ");
  if (n1 != n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n1 = -1, n2 = 3;
  printStr("\nTesting < operator (strictly less): ");
  if (n1 < n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n2 = -1;
  printStr("\nTesting < operator (equality): ");
  if (n1 < n2)
  {
    printStr("Failed");
  }
  else
  {
    printStr("Passed");
  }
  printStr("\nTesting <= operator (equality): ");
  if (n1 <= n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n1 = -2;
  printStr("\nTesting <= operator (strictly less): ");
  if (n1 <= n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n1 = 7;
  printStr("\nTesting > operator (strictly greater): ");
  if (n1 > n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n2 = 7;
  printStr("\nTesting > operator (equality): ");
  if (n1 > n2)
  {
    printStr("Failed");
  }
  else
  {
    printStr("Passed");
  }
  printStr("\nTesting >= operator (equality): ");
  if (n1 >= n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  n1 = 8;
  printStr("\nTesting >= operator (strictly greater): ");
  if (n1 >= n2)
  {
    printStr("Passed");
  }
  else
  {
    printStr("Failed");
  }

  printStr("\n\n");
  return 0;
}