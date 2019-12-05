/*
    Filename: SampleExamTrinityTerm2019_QA2.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

q[A-Z]Y	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}