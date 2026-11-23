%option noyywrap noinput nounput nodefault

%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"|"int"  { printf("RESERVADA: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*    { printf("IDENTIFICADOR: %s\n", yytext); }
[0-9]+                    { printf("ENTERO: %s\n", yytext); }
[ \t\r\n\v\f]+            { /* Los blancos separan tokens. */ }
.                         { printf("NO_RECONOCIDO: %s\n", yytext); }
%%

int main(void)
{
    yylex();
    return 0;
}
