/*
    Filename: even.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
int token = 0;
int even = 0;
%}

%%

[0-9]+	{ token=atoi(yytext); 
          if(token%2==0)  
            even++; }

%%

int main()
{
  yylex();
  printf("%d\n", even);
  return 0;
}