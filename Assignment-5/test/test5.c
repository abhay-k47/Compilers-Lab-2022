int main()
{
  int lo = 0;
  int hi = 100;
  int mark = 50;
  int ans = lo;
  while (lo < hi)
  {
    int mid = (lo + hi) / 2;
    if (mid >= mark)
    {
      ans = mid;
      hi = mid - 1;
    }
    else
    {
      lo = mid + 1;
    }
  }
  int MAXN = 1000;
  int prime[MAXN];
  int i;
  for (i = 0; i < MAXN; i++)
  {
    prime[i] = 1;
  }
  int j;
  for (i = 2; i * i < MAXN; i++)
  {
    if (prime[i] == 1)
    {
      for (j = i * i; j < MAXN; j += i)
      {
        prime[j] = 0;
      }
    }
  }
  int count = 0;
  i = 0;
  do
  {
    if (prime[i])
    {
      count++;
    }
    i++;
  } while (i < MAXN);

  return 0;
}
