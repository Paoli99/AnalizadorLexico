/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorLexico;

/**
 *
 * 
 */
public enum Tokens {
    Reservada_if,
    Reservada_else,
    Reservada_for,
    Reservada_while,
    Reservada_int,
    Reservada_string,
    Reservada_boolean,
    igual,
    suma,
    resta,
    multiplicacion,
    division,
    comillas,
    Op_logico,
    Logico_true,
    Logico_false,
    Parentesis_a,
    Parentesis_b,
    Llave_a,
    Llave_b,
    Main,
    Identificador,
    Numero,
    SaltoLinea,
    fin_de_linea,
    Op_relacional,
    ERROR
    
}
