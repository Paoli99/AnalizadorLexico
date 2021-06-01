/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorLexico;

import java.io.IOException;
import java.io.StringReader;

public class AnalizadorLex {

    public String analize(String text) throws IOException {
        String result = "";

        // podemos manejar cada caracter de cada linea aqui
        Lexer lexer = new Lexer(new StringReader(text));
        while (true) {
            Tokens token = lexer.yylex();
            if (token == null) {
                break;
            }
            result += lexer.lexeme + " --> " + token + "\n";
        }
        return result;
    }
}
