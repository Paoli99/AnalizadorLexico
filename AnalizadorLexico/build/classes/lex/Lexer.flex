package lex;
import static lex.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
si {lexeme=yytext(); return Reservada_if;}
altro {lexeme=yytext(); return Reservada_else;}
per {lexeme=yytext(); return Reservada_for;}
mentre {lexeme=yytext(); return Reservada_while;}
intero {lexeme=yytext(); return Reservada_int;}
stringa {lexeme=yytext(); return Reservada_string;}
bool {lexeme=yytext(); return Reservada_boolean;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return SaltoLinea;}
"=" {lexeme=yytext(); return igual;}
"+" {lexeme=yytext(); return suma;}
"-" {lexeme=yytext(); return resta;}
"*" {lexeme=yytext(); return multiplicacion;}
"/" {lexeme=yytext(); return division;}
"@" {lexeme=yytext(); return fin_de_linea;}
 "\""  {lexeme=yytext(); return comillas;}
 "&&" | "||"  {lexeme=yytext(); return Op_logico;}
 "maggiore" | "inferiore" | "uguale" | "diverso" | "maggiore=" | "inferiore=" {lexeme = yytext(); return Op_relacional;}

"vero" {lexeme = yytext(); return Logico_true;}
"falso" {lexeme = yytext(); return Logico_false;}
 "("  {lexeme=yytext(); return Parentesis_a;}
 ")"  {lexeme=yytext(); return Parentesis_b;}
 "{"  {lexeme=yytext(); return Llave_a;}
 "}"  {lexeme=yytext(); return Llave_b;}
 "principale"  {lexeme=yytext(); return Main;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
