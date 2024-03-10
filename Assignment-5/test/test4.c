// testing procedure calls
int func1(int a, int b, int c)
{
  int temp = a;
  a = b;
  b = c;
  c = temp;
  return a + b + c;
}

int func2(char* str)
{
  int i = 0;
  while (str[i])
  {
    i++;
  }
  return i;
}

int func3(int a[], int n)
{
  int i = 0;
  int sum = 0;
  while (i < n)
  {
    sum += a[i];
    i++;
  }
  return sum;
}

int main()
{
  int a = 1, b = 2, c = 3;
  int d = func1(a, b, c);
  char* str = "namaste world";
  int e = func2(str);
  int arr[10];
  int i = 0;
  while (i < 10)
  {
    arr[i] = i;
    i++;
  }
  int f = func3(arr, 10);
  return 0;
}
