/*
    Filename: calcwithvariables.y
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
#  include <stdio.h>
#  include <stdlib.h>
#  include <string.h>
int yylex();
void yyerror(char *s);
int variables[26];
%}

/* declare tokens */
%token PLUS MINUS MUL DIV ASSIGNMENT SEMICOLON PRINT
%token ERROR VARIABLE NUMBER
%%

input: 
 | input VARIABLE ASSIGNMENT exp SEMICOLON {printf("%d", $4);}
;

exp: factor 
 | exp PLUS factor { $$ = $1 + $3; }
 | exp MINUS factor { $$ = $1 - $3; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER
 | VARIABLE {$$ = variables[($1)-49];}
 | ERROR {yyerror("syntax error\n"); return 0;}
 ;



%%
int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  printf("%s", s);
  exit(0);
}







