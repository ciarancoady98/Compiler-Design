/*
    Filename: roman.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
# include "roman.tab.h"
void yyerror(char *s);
%}

%%
"I"     {yylval = 1;return I;}
"V"     {yylval = 5;return V;}
"X"     {yylval = 10;return X;}
"L"     {yylval = 50;return L;}
"C"     {yylval = 100;return C;}
"D"     {yylval = 500;return D;}
"M"     {yylval = 1000;return M;}
\n      {return EOL;}
.	    {yyerror("syntax error\n")return;}

%%
/*
int main()
{
  yylex();
  return 0;
}
*/