%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int numcorreos = 0;
%}

/* Definiciones Regulares */
USUARIO   [a-zA-Z0-9._+]+
DOMINIO   [a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*
EXTENSION \.[a-zA-Z]{2,6}

%%
{USUARIO}@{DOMINIO}{EXTENSION}   { numcorreos++; printf("CORREO VALIDO: %s\n", yytext); }
[^ \t\n]*@[^ \t\n]*               { printf("CORREO INVALIDO: %s\n", yytext); }
.|\n                             {/*Ignora los caracteres extranios y saltos de linea*/ }
%%

int main() {
    yylex();
    printf("\nTotal de correos validos: %d\n", numcorreos);
    return 0;
}

