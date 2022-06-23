%{
#include<stdio.h>
int keyword=0,id=0,op=0,digit=0;
extern FILE *yyin;
int yyerror();
int yylex();
%}


%token KEYWORD ID OP DIGIT 

%%
input:KEYWORD input{keyword++;}
|KEYWORD {keyword++;}
|ID input{id++;}
|ID {id++;}
|OP input{op++;}
|OP {op++;}
|DIGIT input{digit++;}
|DIGIT {digit++;}
;
%%

void main()
{
yyin=fopen("sample.txt","r");
yyparse();
printf("KEYWORD count is %d\n",keyword);
printf("ID count is %d\n",id);
printf("OP count is %d\n",op);
printf("DIGIT count is %d\n",digit);\
}
int yyerror()
{
printf("Invalid input");
return 0;
}

