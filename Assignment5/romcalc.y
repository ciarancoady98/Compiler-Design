/*
    Filename: roman.y
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
#  include <stdio.h>
#  include <stdlib.h>
#  include <string.h>
int yylex();
void yyerror(char *s);
int previous = 0;
char outputString[100];
char* numeralLookUpTable[] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
int decimalLookUpTable[] = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};
int lookUpTableSize = 13;
void getNumeral(int number){
    int currentNumber = number;
    while(currentNumber != 0 && currentNumber > 0){
        int indexOfCurrentToken = 0;
        for(int i = 0; i < lookUpTableSize; i++){
            if(number >= decimalLookUpTable[i]){
                indexOfCurrentToken = i;
            }
        }   
        currentNumber = currentNumber - decimalLookUpTable[indexOfCurrentToken];
        strcat(outputString, numeralLookUpTable[indexOfCurrentToken]);
    }
    printf(outputString);
}
%}

/* declare tokens */
%token I V X L C D M
%token PLUS MINUS MUL DIV
%token EOL 
%token ERROR
%%

decimal: /* nothing */
 | decimal expression EOL { printf("%d\n", $2); previous = 0;}
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







