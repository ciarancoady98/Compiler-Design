/*
    Filename: SampleExamTrinityTerm2019_QA6.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

o[a-zA-Z]{1,2}hh	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}