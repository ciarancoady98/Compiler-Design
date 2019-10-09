/*
    Filename: comments.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

NUMBER [0-9]
COUNTY KK
YEAR [1]?[0-9][0-9]

%%

{YEAR}          {printf("%s", "you have found a magical year");}
{COUNTY}        {printf("%s", "youre from kilkenny mate");}
{NUMBER}        {printf("%s", "just a boring old number im afraid");}
.               {printf("%s", yytext);}


%%

int main()
{
  yylex();
  return 0;
}