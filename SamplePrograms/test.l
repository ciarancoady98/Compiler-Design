/*
    Filename: plates.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
  
%}

%%

"I"                                                 {printf("One");}
"V"                                                 {printf("Five");}
"X"                                                 {printf("Ten");}
"L"                                                 {printf("Fifty");}
"C"                                                 {printf("One Hundred");}
"D"                                                 {printf("Five Hundred");}
"M"                                                 {printf("One Thousand");}
\n				                                    {}
.                                                   {printf("INVALID\n");}


%%

int main()
{
  yylex();
  return 0;
}