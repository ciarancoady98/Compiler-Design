/*
    Filename: SampleExamMichaelmasTerm2019_QB3.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

j[^A-Z]Q	{  printf("Accept %s\n", yytext); }
\n {}
. { printf("Reject %s\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}