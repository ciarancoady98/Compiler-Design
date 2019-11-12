/*
    Filename: calcwithvariables.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
# include "calcwithvariables.tab.h"
void yyerror(char *s);
%}

%%
"+"     {return PLUS;}
"-"     {return MINUS;}
"/"     {return DIV;}
"*"     {return MUL;}
":-"    {return ASSIGNMENT;}
";"     {return SEMICOLON;}
\n      {return EOL;}
.	    {return ERROR;}

%%