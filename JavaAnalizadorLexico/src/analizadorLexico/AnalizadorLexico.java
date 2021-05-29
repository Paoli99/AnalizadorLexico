/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorLexico;

import java.io.File;

public class AnalizadorLexico {
    public static void main(String[] args)
    {
        // cambiar la direccion para probar 
        String lexer = "E:/Compilacion/AnalizadorLexico/JavaAnalizadorLexico/src/analizadorLexico/Lexer.flex";
       Lexer(lexer); 
    }
    
    public static void Lexer(String lexer)
    {
        File file = new File(lexer); 
        JFlex.Main.generate(file);
    }
}
