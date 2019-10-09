/*
    Filename: plates.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
%}

NUMBER [0-9]+
CURRENTCOUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLDCOUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TS|TN|W|WD|WH|WX|WW
CURRENTYEAR [1][4-9][12]
AWKWARDYEAR [1][3][12]
OLDYEAR [0-9][0-9]

%%

({OLDYEAR}|{AWKWARDYEAR}){OLDCOUNTY}{NUMBER}    {printf("%s%s", yytext ,"\n");} 
{CURRENTYEAR}{CURRENTCOUNTY}{NUMBER}            {printf("%s%s", yytext, "\n");}
.*                                              {printf("%s", "INVALID\n");}


%%

int main()
{
  yylex();
  return 0;
}