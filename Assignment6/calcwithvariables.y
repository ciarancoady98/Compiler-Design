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
%token PLUS MINUS MUL DIV ASSIGNMENT SEMICOLON
%token EOL 
%token ERROR
%%

decimal: /* nothing */
 | decimal expression EOL { printNumeral($2);
                            previous = 0;}
 ; 

 expression: factor 
 | expression PLUS factor { $$ = $1 + $3; }
 | expression MINUS factor { $$ = $1 - $3; }
 ;

factor: numtodec 
 | factor MUL numtodec { $$ = $1 * $3; }
 | factor DIV numtodec { $$ = $1 / $3; }
 ;

numtodec: numtodec numeral {
                            if(previous < $2){
                                $$ = ($1 + $2) - (previous * 2);
                                previous = $2;
                            }
                            else {
                                $$ = $1 + $2;
                                previous = $2;
                            }
                            }
            | OB expression CB {$$ = $2;}
            | OB expression {yyerror("syntax error\n");}
            | numeral {previous = $1;$$ = $1;}

numeral: I {$$ = $1;}
        |V {$$ = $1;}
        |X {$$ = $1;}
        |L {$$ = $1;}
        |C {$$ = $1;}
        |D {$$ = $1;}
        |M {$$ = $1;}
        |ERROR {yyerror("syntax error\n"); return 0;}



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







