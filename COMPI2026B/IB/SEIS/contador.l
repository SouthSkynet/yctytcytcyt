%option noyywrap noinput nounput nodefault

%{
#include <stdio.h>

static size_t mayusculas;
static size_t minusculas;
static size_t digitos;
static size_t blancos;
%}

%%
[A-Z]+          { mayusculas += yyleng; }
[a-z]+          { minusculas += yyleng; }
[0-9]+          { digitos += yyleng; }
[ \t\r\n\v\f]+  { blancos += yyleng; }
.               { /* Los demás caracteres no se cuentan. */ }
%%

int main(void)
{
    yylex();
    printf("Mayusculas: %zu\n", mayusculas);
    printf("Minusculas: %zu\n", minusculas);
    printf("Digitos: %zu\n", digitos);
    printf("Espacios en blanco: %zu\n", blancos);
    return 0;
}
