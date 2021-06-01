package analizadorLexico;
import static analizadorLexico.Tokens.*;
%%
%class Lexer
%line
%type Tokens
L=[a-zA-Z_]+|[a-z]+
N=("+"|"-")?[0-9]+
R=("+"|"-")?[0-9]+"."[0-9]+
espacio=[ ,\r]+
%{
    public String lexeme;
%}
%%
si {lexeme=yytext(); return palabra_reservada_if;}
altro {lexeme=yytext(); return palabra_reservada_else;}
per {lexeme=yytext(); return palabra_reservada_for;}
mentre {lexeme=yytext(); return palabra_reservada_while;}
intero {lexeme=yytext(); return palabra_reservada_int;}
reale {lexeme=yytext(); return palabra_reservada_float;}
stringa {lexeme=yytext(); return palabra_reservada_string;}
bool {lexeme=yytext(); return palabra_reservada_boolean;}
{espacio} {/*Ignore*/}
"//".*|"/*".*"*/" {lexeme=yytext(); return comentario;}
"\"" .* "\"" {lexeme=yytext(); return cadena;}
"\t"  {lexeme=yytext(); return tabulacion;}
"\n" {lexeme=yytext(); return salto_de_linea;}
"=" {lexeme=yytext(); return igual;}
"+" {lexeme=yytext(); return suma;}
"-" {lexeme=yytext(); return resta;}
"*" {lexeme=yytext(); return multiplicacion;}
"/" {lexeme=yytext(); return division;}
"#" {lexeme=yytext(); return fin_de_linea;}
 "\""  {lexeme=yytext(); return comillas;}
 "&&" | "||"  {lexeme=yytext(); return op_logico;}
 "maggiore" | "inferiore" | "uguale" | "diverso" | "maggiore=" | "inferiore=" {lexeme = yytext(); return op_relacional;}
"vero" {lexeme = yytext(); return logico_true;}
"falso" {lexeme = yytext(); return logico_false;}
 "("  {lexeme=yytext(); return parentesis_abrir;}
 ")"  {lexeme=yytext(); return parentesis_cerrar;}
 "{"  {lexeme=yytext(); return llave_abrir;}
 "}"  {lexeme=yytext(); return llave_cerrar;}
 "principale"  {lexeme=yytext(); return main;}
{L}({L}|{N})*"="({L}({L}|{N})*|{N}|{R}) {lexeme=yytext(); return asignacion;}
{L}({L}|{N})* {lexeme=yytext(); return identificador;}
("(-"{N}+")")|{N}+ {lexeme=yytext(); return numero;}
("(-"{R}+")")|{R}+ {lexeme=yytext(); return numero_real;}
{N}"!" {lexeme=yytext(); return factorial;}
({N}|{R}){L}({N}|{R})* | "!"({L})* | ({L})*"!" | "!"({N}|{R})+ | . {lexeme=yytext(); return ERROR_LÉXICO;}