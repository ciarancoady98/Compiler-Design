/*
    Filename: SampleExamTrinityTerm2019_QA8.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

..zZ.	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}