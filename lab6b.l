%{
#include"y.tab.h"
#include<stdio.h>
int yylval;
%}

%%
int|float|printf|void {printf("keyword is %s\n",yytext);return KEYWORD;}
[a-z A-Z]* {printf("identifier is %s\n", yytext);return ID;}
[+\-\*\/] {printf("operator is %s\n", yytext);return OP;}
[0-9]+ {yylval=atoi(yytext);printf("number is %d\n",yylval);return DIGIT;}
. ;
%%
