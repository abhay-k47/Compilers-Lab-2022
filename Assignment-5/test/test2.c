int main()
{
  // test if else statements
  int x = 751, y = 483;
  int z = 0;
  float f1 = 0.3, f2 = 42.21;

  // nested if else statements
  if (x > y)
  {
    if (x > 100 && x < 700)
    {
      z = 1;
    }
    else
    {
      z = 2;
    }
  }
  else if (x == y)
  {
    if (f1 > f2)
    {
      z = 1;
    }
    else if (f1 == 2)
    {
      z--;
    }
    else
    {
      z = 2;
    }
  }
  else
  {
    if (y > 100 && y < 500)
    {
      z = 3;
    }
    else
    {
      z = 4;
    }
  }
  return 0;
}
