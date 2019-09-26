/*
    Filename: comments.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

%%

\*\*(.*)        {;}
\{[^}]*         {printf("%s", "syntax error\n"); return 0;}
\}              {printf("%s", "syntax error\n"); return 0;}
\{[^}]*\}       {;}
\"[^"]*\"       {printf("%s", yytext);}
.               {printf("%s", yytext);}


%%

int main()
{
  yylex();
  return 0;
}