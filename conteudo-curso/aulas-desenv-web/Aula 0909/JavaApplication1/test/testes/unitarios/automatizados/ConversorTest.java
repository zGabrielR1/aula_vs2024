/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package testes.unitarios.automatizados;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author a
 */
public class ConversorTest {
    
    public ConversorTest() {
    }
/*
        @Test
    public void testMetrosparaKilometros() {
        System.out.println("MetrosparaKilometros");
        float m = 0.0F;
        float km = 0.0F;
        Conversor instance = new Conversor();
        float expResult = 0.0F;
        float result = instance.MetrosparaKilometros(m, km);
        assertEquals(expResult, result, 0);
        fail("The test case is a prototype.");
    }
    */

    @Test
    public void testeConversor() {
        System.out.println("Metros para km");
        Conversor aux = new Conversor();
        float m = 2500;
        float gabarito = (float) 2.5;
        float resultado = aux.MetrosparaKilometros(m);
        assertEquals(gabarito, resultado, 2);
        System.out.println("Teste do conversor");
    }
};