%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token NUM ENTER
%left '+''-'
%left '/''*'
%%
E: exp ENTER{printf("Result is %d\n", $$); exit(0);}
exp:exp'+'exp {$$=$1+$3;}
|exp'-'exp {$$=$1-$3;}
|'(' exp ')' {$$=$2;}
|'-' exp {$$=-$2;}
|exp'*'exp {$$=$1*$3;}
|exp'/'exp{if($3==0)
	{printf("error");exit(0);}
	else {$$=$1/$3;}}
|NUM { $$=$1;}
;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
}
int yyerror()
{
printf("Invalid Expression\n");
exit(0);
}
