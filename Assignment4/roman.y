/*
    Filename: roman.y
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
#  include <stdio.h>
#  include <stdlib.h>
int yylex();
void yyerror(char *s);
int previous = 0;
%}

/* declare tokens */
%token I V X L C D M
%token EOL 
%token ERROR
%%

decimal: /* nothing */
 | decimal numtodec EOL { printf("%d\n", $2); previous = 0;}
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







