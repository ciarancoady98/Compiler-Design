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
int decimal = 0;

int lookupTable(int numeral){
    switch(numeral)
    {
        case(I):
                return 1;
        case(V):
                return 5;
        case(X):
                return 10;
        case(L):
                return 50;
        case(C):
                return 100;
        case(D):
                return 500;
        case(M):
                return 1000;
        default: 
                return -1;
    }
}

int clacValue(int numeral){
    if(last = 0){
        last = lookupTable(numeral);
        current = last;
        return current;
    }
    else if(numeral > last){
        //subtractive notation
        current = (current + lookupTable(numeral)) - last;
        return current;
    }
    else {
        last = lookupTable(numeral);
        current = current + last;
        return current;
    }
}
%}

/* declare tokens */
%token I V X L C D M
%token EOL
%%

decimal: /* nothing */
 | decimal numeral EOL { printf("= %d\n> ", $2); }
 ; 

numeral: I {$$ = clacValue($1);}
        |V {$$ = clacValue($1);}
        |X {$$ = clacValue($1);}
        |L {$$ = clacValue($1);}
        |C {$$ = clacValue($1);}
        |D {$$ = clacValue($1);}
        |M {$$ = clacValue($1);}

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







