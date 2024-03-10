int main()
{
  // testing complex array declarations
  int a[10];
  int b[10][10];
  int c[10][a[0]][b[0][0]];
  float d[10][c[0][0][0]][100];
  int* ptr1 = &a[0];
  int* ptr2 = &b[0][0];
  int** ptr3 = &c[0][0];
  int*** ptr4 = &d[0][0];
  return 0;
}
