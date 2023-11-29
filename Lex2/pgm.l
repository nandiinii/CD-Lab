%{
#include<stdio.h>
#include<math.h>
FILE *file;
%}


%%
[a-zA-Z]*"nand"[a-zA-Z]*  {}
[a-zA-Z]* {printf("%s\n",yytext);}
%%
int main()
{
    file = fopen("input.txt", "r");
    if (!file)
    {
        printf("could not open the file");
        exit(0);
    }
    yyin = file;
    yylex();
    printf("\n");
    return (0);
}
int yywrap()
{
    return (1);
}