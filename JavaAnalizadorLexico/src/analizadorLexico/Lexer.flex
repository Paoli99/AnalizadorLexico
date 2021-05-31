package analizadorLexico;
import static analizadorLexico.Tokens.*;
%%
%class Lexer
%line
%type Tokens
L=[a-zA-Z_]+
D=("+"|"-")?[0-9]+
R=("+"|"-")?[0-9]+"."[0-9]+
espacio=[ ,\r]+
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
"\t"  {lexeme=yytext(); return Tabulacion;}
"\n" {lexeme=yytext(); return SaltoLinea;}
"=" {lexeme=yytext(); return igual;}
"+" {lexeme=yytext(); return suma;}
"-" {lexeme=yytext(); return resta;}
"*" {lexeme=yytext(); return multiplicacion;}
"/" {lexeme=yytext(); return division;}
"#" {lexeme=yytext(); return fin_de_linea;}
 "\""  {lexeme=yytext(); return comillas;}
 "&&" | "||"  {lexeme=yytext(); return Op_logico;}
 "maggiore" | "inferiore" | "uguale" | "diverso" | "maggiore=" | "inferiore=" {lexeme = yytext(); return Op_relacional;}
"vero" {lexeme = yytext(); return Logico_true;}
"falso" {lexeme = yytext(); return Logico_false;}
 "("  {lexeme=yytext(); return Parentesis_abrir;}
 ")"  {lexeme=yytext(); return Parentesis_cerrar;}
 "{"  {lexeme=yytext(); return Llave_abrir;}
 "}"  {lexeme=yytext(); return Llave_cerrar;}
 "principale"  {lexeme=yytext(); return Main;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
("(-"{R}+")")|{R}+ {lexeme=yytext(); return NumeroReal;}
 . {return ERROR;}