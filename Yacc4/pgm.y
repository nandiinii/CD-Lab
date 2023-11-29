%{
	#include<stdio.h>
	int valid=1;
%}
%token FOR LPAREN TYPE ID EQ NUMBER COMMA COMP RPAREN UPD
%%
FORSTMT:FOR LPAREN TYPE ID EQ NUMBER COMMA ID COMP NUMBER COMMA ID UPD RPAREN
%%
int yyerror()
{
	printf("Not Valid For Syntax");
	valid=0;
	return 0;
}
int main()
{
	yyparse();
	if(valid)
	{
		printf("Valid Syntax");
	}
	return 0;
}