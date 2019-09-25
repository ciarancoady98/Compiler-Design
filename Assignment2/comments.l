/*
    Filename: comments.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{


%}

%%

\*\*+.*\n             {printf("\n");}
\{[.\n]*\}         {printf("\n");}
\{.*[^\\}]\n          {printf("syntax error\n"); return 0;}
[^\\{].*\}\n          {printf("syntax error\n"); return 0;}
\"(\\.|[^\\"])*\"\n   {printf(yytext);}
\n                    {printf("\n");}
.                     {printf(yytext  );}

%%

int main()
{
  yylex();
  return 0;
}