%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token A B ENTER
%%
stmt:s ENTER{printf("valid grammar");exit(0);}
s: c B |B
c: A c |A
;
%%
void main()
{
printf("Enter the String\n");
yyparse();
}
int yyerror()
{
printf("Invalid Expression\n");
exit(0);
}

