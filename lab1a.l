%{
#include<stdio.h>
int identifiers=0, operators=0, braces=0, alpha=0, space=0;
%}
%%
[a-zA-Z] {alpha++;printf("\nAlphabet:");ECHO;}
[0-9]* {identifiers++;printf("\nIdentifier:");ECHO;}
[*|+] {operators++;printf("\nOperator:");ECHO;}
"(" {braces++;}
")" {braces--;}
[ ] {space++;}
.|\n {;}
%%
void main()
{
printf("enter the expresssion:");
yylex();
if((braces==0)&&(operators==identifiers-1)&&alpha==0&&space==0)
{
printf("\n valid expression");
printf("\n number of operator:%d",operators);
printf("\n number of identifiers:%d",identifiers);
}
else
printf("\n invalid expression");
printf("\n");
}
