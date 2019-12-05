/*
    Filename: SampleExamTrinityTerm2019_QA1.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

hhh	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}