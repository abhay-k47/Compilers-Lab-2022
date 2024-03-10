#include <stdio.h>
extern int yyparse();

int main()
{
  printf("Parsing Line 1\n\n");
  yyparse();
  return 0;
}
