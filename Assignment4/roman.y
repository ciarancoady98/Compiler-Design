/*
    Filename: roman.y
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
#  include <stdio.h>
int yylex();
void yyerror(char *s);
int last = 0;
%}

/* declare tokens */
%token I V X L C D M
%token EOL
%%
decimal: /* nothing */
 | decimal EOL { printf("= %d\n> ", $2); }
 ; 


%%
int main()
{
  printf("> "); 
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}







