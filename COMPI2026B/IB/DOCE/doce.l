%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int numbin = 0;
%}
/* Definiciones Regulares */
BINARIO   [01]+
NUMERO    [0-9]+
PALABRA   [a-zA-Z_][a-zA-Z0-9_]*

%%
{BINARIO}   { long decimal = 0;
              for (int i = 0; yytext[i] != '\0'; i++)
                  decimal = decimal * 2 + (yytext[i] - '0');
              numbin++;
              printf("Binario: %-12s Decimal: %ld\n", yytext, decimal); }
{NUMERO}    { /* Ignora numeros */ }
{PALABRA}   { /* Ignora palabras */ }
.|\n        { /* Ignora caracteres y saltos de lineas */ }
%%

int main() {
    yylex();
    printf("\nTotal de numeros binarios: %d\n", numbin);
    return 0;
}
