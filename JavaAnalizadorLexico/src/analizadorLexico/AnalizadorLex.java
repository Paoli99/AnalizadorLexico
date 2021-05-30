/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorLexico;

import java.io.IOException;
import java.io.StringReader;

/**
 *
 * @author Yoga
 */
public class AnalizadorLex {
    public String analize(String text) throws IOException
    {
        String output = "";
                
    // podemos manejar cada caracter de cada linea aqui
            Lexer lexer = new Lexer(new StringReader(text));
            while (true){
                Tokens token = lexer.yylex();
                if(token == null){
            break;
            }
            output+=lexer.lexeme + " -- " + token + "\n";
        }
     return output;       
    }
}
