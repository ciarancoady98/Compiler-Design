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
"I"     {return I;}
"V"     {return V;}
"X"     {return X;}
"L"     {return L;}
"C"     {return C;}
"D"     {return D;}
"M"     {return M;}
\n      {return EOL;}
[ \t]   {/* ignore white space */}
.	    {yyerror("syntax error\n");}

%%
/*
int main()
{
  yylex();
  return 0;
}
*/