/*
    Filename: even.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
int even = 0;
%}

%%

[02468]+(\n|" "|\r)	{  even++; }
\n {}
. {}

%%

int main()
{
  yylex();
  printf("%d\n", even);
  return 0;
}