//yacc prog 

%{
#include <stdio.h>
int yylex(void);
#include <ctype.h>
void yyerror(char *);
%}

%union{
float fval;
}

%token <fval> num
%token VAR '='
%left '+' '-'
%type <fval> E

%%

P: P E  {printf("%f\n",$2);}
 |
 ;
 
E: E '+' E {$$=$1+$3;}
 | E '-' E {$$=$1-$3;}
  | VAR '=' E {$$= $3;}
 | num {$$=$1;}
 ;

%%

int main(){ 
yyparse(); 
}

void yyerror(char *s){
printf("invalid");
}
