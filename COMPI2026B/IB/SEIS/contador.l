

%{
#include <stdio.h>

int mayusculas = 0;
int minusculas = 0;
int digitos = 0;
int blancos = 0;
%}

%%
[A-Z]+          { mayusculas += yyleng; }
[a-z]+          { minusculas += yyleng; }
[0-9]+          { digitos += yyleng; }
[ \t\r\n]+      { blancos += yyleng; }
.               { /* Los demás caracteres no se cuentan. */ }
%%

int main(void)
{
    yylex();
    printf("Mayusculas: %d\n", mayusculas);
    printf("Minusculas: %d\n", minusculas);
    printf("Digitos: %d\n", digitos);
    printf("Espacios en blanco: %d\n", blancos);
    return 0;
}
