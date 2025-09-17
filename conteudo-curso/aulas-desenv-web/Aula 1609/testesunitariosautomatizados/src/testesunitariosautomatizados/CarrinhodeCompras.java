/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testesunitariosautomatizados;
   import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Professor
 */
public class CarrinhodeCompras {


    private List<Produto> produtos = new ArrayList<>();

    public void adicionarProduto(Produto aux) {
        if (aux == null || aux.getPreco() <= 0) {
            System.out.println("Produto inválido");
        } else {
            produtos.add(aux);
        }
        produtos.add(aux);
    }

    public void removerProduto(Produto aux) {
        produtos.remove(aux);
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

    public double getPrecoMedio() {
        double precomedio = this.calcularTotal() / this.getQuantidadeProdutos();
        return precomedio;
    }
}
