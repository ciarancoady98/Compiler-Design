/*
    Filename: comments.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{


%}

%%

^\*\*+.*\n        {printf("This is a ** full line comment");}
\{{1}.*\}{1}\n    {printf("This is a { comment ");}
\n                {printf("matched a new line");}
.                 {printf("matched random Character");}

%%

int main()
{
  yylex();
  return 0;
}