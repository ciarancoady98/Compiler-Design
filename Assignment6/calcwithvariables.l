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
":="    {return ASSIGNMENT;}
";"     {return SEMICOLON;}
"print" {return PRINT;}
[a-z]{1} {yylval = yytext[0] - '0'; return VARIABLE;}
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
\n      {}
[ \t]   {}
.	    {yyerror("syntax error\n");}

%%