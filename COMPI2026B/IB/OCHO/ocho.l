%{
#include <stdio.h>
%}
%%
"+"|"-"|"*"|"/"                 printf("Operador aritmetico: %s\n", yytext);
"<="|">="|"=="|"!="|"<"|">"     printf("Operador relacional: %s\n", yytext);
.|\n                            ;
%%
int main()
{
yylex();
return 0;
}
