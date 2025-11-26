/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testes.unitarios.automatizados;
   import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Professor
 */
public class CarrinhodeCompras {


    private List<Produto> produtos = new ArrayList<>();

    public void adicionarProduto(Produto produto) {
        if (produto == null || produto.getPreco() <= 0) {
            throw new IllegalArgumentException("Produto inválido");
        }
        produtos.add(produto);
    }

    public void removerProduto(Produto produto) {
        produtos.remove(produto);
    }

    public double calcularTotal() {
        return produtos.stream().mapToDouble(Produto::getPreco).sum();
    }

    public void limparCarrinho() {
        produtos.clear();
    }

    public int getQuantidadeProdutos() {
        return produtos.size();
    }
 
}
