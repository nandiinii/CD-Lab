%{
	#include<stdio.h>
	#include "y.tab.h"
%}
%%
for {return FOR;}
[(] {return LPAREN;}
int|double|float {return TYPE;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[=] {return EQ;}
[0-9]+ {return NUMBER;}
[;] {return COMMA;}
[<>] {return COMP;}
[<>][=] {return COMP;}
[)] {return RPAREN;}
[+][+] {return UPD;}
[-][-] {return UPD;}
[ ] {}
[\n] {return 0;}
%%
int yywrap()
{	
	return 1;
}