%{
int even = 0;
%}
%%
[0-9]*[02468]+	{ even++; }
[0-9]+ {}
\n {}
.  {}
%%	
int main()
	{
    yylex();
    printf("%d\n", even);
    return 0;
	}