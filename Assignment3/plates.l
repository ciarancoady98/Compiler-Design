/*
    Filename: plates.l
    Name: Ciaran Coady
    Student Number: 17326951
*/
%{
  int currentYear = 2019;

  void printAge(){
    char* text = yytext;
    int firstDig = (int)text[0] - 48;
    int secondDig = (int)text[1] - 48;
    int yearInt = (firstDig*10)+secondDig; 
    if(yearInt >= 87){
      printf("%i\n", currentYear-(1900+yearInt));
    }   
    else {
      printf("%i\n", currentYear-(2000+yearInt));
    }
  }
  
%}

NUMBER [0-9]+
CURRENTCOUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLDCOUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TS|TN|W|WD|WH|WX|WW
CURRENTYEAR [1][4-9][12]
AWKWARDYEAR [1][3][12]
OLDYEAR [0-9][0-9]

%%

({OLDYEAR}|{AWKWARDYEAR}){OLDCOUNTY}{NUMBER}    {printAge();} 
{CURRENTYEAR}{CURRENTCOUNTY}{NUMBER}            {printAge();}
.                                               {printf("%s", "INVALID\n");}


%%

int main()
{
  yylex();
  return 0;
}