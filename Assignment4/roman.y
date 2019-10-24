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
int previous;
%}

/* declare tokens */
%token I V X L C D M
%token EOL
%%

decimal: /* nothing */
 | decimal numtodec EOL { printf("= %d\n> ", $2); }
 ; 

numtodec: numtodec numeral {if(previous < $2){
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







