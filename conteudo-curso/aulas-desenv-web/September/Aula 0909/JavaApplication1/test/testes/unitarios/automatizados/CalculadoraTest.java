/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package testes.unitarios.automatizados;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author a
 */
public class CalculadoraTest {
    
    public CalculadoraTest() {
    }
/*
    @Test
    public void testSoma() {
        System.out.println("Soma");
        float v1 = 0.0F;
        float v2 = 0.0F;
        Calculadora instance = new Calculadora();
        float expResult = 0.0F;
        float result = instance.Soma(v1, v2);
        assertEquals(expResult, result, 0);
        fail("The test case is a prototype.");
    }

    @Test
    public void testSubtrai() {
        System.out.println("Subtrai");
        float v1 = 0.0F;
        float v2 = 0.0F;
        Calculadora instance = new Calculadora();
        float expResult = 0.0F;
        float result = instance.Subtrai(v1, v2);
        assertEquals(expResult, result, 0);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDivide() {
        System.out.println("Divide");
        float v1 = 0.0F;
        float v2 = 0.0F;
        Calculadora instance = new Calculadora();
        float expResult = 0.0F;
        float result = instance.Divide(v1, v2);
        assertEquals(expResult, result, 0);
        fail("The test case is a prototype.");
    }

    @Test
    public void testMultiplica() {
        System.out.println("Multiplica");
        float v1 = 0.0F;
        float v2 = 0.0F;
        Calculadora instance = new Calculadora();
        float expResult = 0.0F;
        float result = instance.Multiplica(v1, v2);
        assertEquals(expResult, result, 0);
        fail("The test case is a prototype.");
    }
    */
    @Before
    public void InicializandoTestes() {
        System.out.println("Todos os testes foram inicializados!");
    }
    
    @Test
    public void Teste_Soma() {
        Calculadora aux = new Calculadora();
        float a = 10;
        float b = 20;
        float gabarito = 30;
        float resultado = aux.Soma(a,b);
        assertEquals(gabarito, resultado, 2);
        System.out.println("Teste soma");
    }
    @Test
    public void Teste_Multiplicacao() {
        Calculadora aux = new Calculadora();
        float a = 10;
        float b = 10;
        float gabarito = 100;
        float resultado = aux.Multiplica(a,b);
        assertEquals(gabarito, resultado, 2);
        System.out.println("Teste da mulriplicação");
    }
    @Test
    public void Teste_Subtrair() {
        Calculadora aux = new Calculadora();
        float a = 10;
        float b = 10;
        float gabarito = 0;
        float resultado = aux.Subtrai(a,b);
        assertEquals(gabarito, resultado, 2);
        System.out.println("Teste da subtração");
    }
    @Test
    public void Teste_Divisao() {
        Calculadora aux = new Calculadora();
        float a = 10;
        float b = 10;
        float gabarito = 1;
        float resultado = aux.Divide(a,b);
        assertEquals(gabarito, resultado, 2);
        System.out.println("Teste da divisão");
    }
    
    @After
    public void finalizarTudo() {
        System.out.println("Todos os testes foram concluídos");
    }
    
}
