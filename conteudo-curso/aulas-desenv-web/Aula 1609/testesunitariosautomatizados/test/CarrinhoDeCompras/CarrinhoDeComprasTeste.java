/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import.org.junit.Before;
import testesunitariosautomatizados.CarrinhodeCompras;
import testesunitariosautomatizados.Produto;
/**
 *
 * @author a
 */
public class CarrinhoDeComprasTest {
    
    public CarrinhoDeCompras abc;
    public Produto a;
    public Produto b;
    public produto c;
    @After
    public void IniciaTeste() {
        System.out.println("Teste iniciado");
    }
    @Before
    public void FinalizaTeste() {
        System.out.println("Teste finalizado");
    }
    @Before
    public void PreparaCarrinhoParaTeste() {
        abc = new CarrinhoDeCompras();
        a = new Produto("Mouse", 100.0);
        b = new Produto("Teclado", 200.0);
        c = new Produto("Monitor", -10);
        System.out.println("-- Novo teste inciado --");
    }
    @Test
    public void deveRemoverProduto(){
        assertEquals(0, abc.getQuantidade(), 0);
        abc.adicionarProduto(a);
        abc.adicionarProduto(b);
        assertEquals(2, abc.getQuantidade(), 0);
        abc.removerProduto(a);
        
        assertEquals(1, abc.getQuantidade(), 0);
        assertEquals(200.0, abc.calcularTotal(),0);
        }
    @Test
    public void limparCarrinhoTest() {
        abc.adicionarProduto(a);
        abc.adicionarProduto(b);
        assertEquals(2, abc.getQuantidadeProdutos(), 0);
        abc.limparCarrinho();
        assertEquals(0, abc.getQuantidadeProdutos(), 0);
    }
    @Test
    public void adicionaItemCarrinhoTest() {
        abc.adicionarProduto(a);
        abc.adicionarProduto(b);
        abc.adicionarProduto(c); // Como o valor dele é negativo ele    
        assertEquals(2, abc.getQuantidadeProdutos(), 0);
    }
    @Test
    public void CalculoValorCarrinhoTest() {
        abc.adicionarProduto(a);
        abc.adicionarProduto(b);
        assertEquals(300, abc.calcularTotal(), 0);
    }
    @Test
    public void AdicionaProdutoValorNegativo() {
        c = new Produto ("Monitor", -10);
        abc.adicionarProduto(c);
        assertEquals(0, abc.getQuantidadeProdutos(), 0);
    }
    @Test
    public void CalculoMedioTest() {
        d = new Produto("Blusa", 100);
        e = new Produto("Calca", 160);
        assertEquals(130, abc.getPrecoMedio, 10);
    }
}