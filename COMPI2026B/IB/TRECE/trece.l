%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
0[xX][0-9a-fA-F]+   {
                        long decimal = strtol(yytext, NULL, 16);
                        printf("Hexadecimal: %s -> Decimal: %ld\n", yytext, decimal);
                    }
[ \t\n]+            ; /* Ignora espacios, tabulaciones y saltos de linea */
.                   ; /* Ignora cualquier otro caracter que no sea hexadecimal */
%%

int main() {
    yylex();
    return 0;
}
