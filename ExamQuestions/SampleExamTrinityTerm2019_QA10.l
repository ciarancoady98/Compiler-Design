/*
    Filename: SampleExamTrinityTerm2019_QA10.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

^(k|E|[A-Z]+)	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}