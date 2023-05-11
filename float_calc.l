//lex program to accept floating point
%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%
[a-zA-Z_] {return VAR;}

[0-9]+[.][0-9]? {yylval.fval = atof(yytext); return num;}

[-+=] {return *yytext;}

%%
