/*
    Filename: SampleExamTrinityTerm2019_QA9.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

^[a-z]	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}