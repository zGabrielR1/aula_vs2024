package aula.pkg2110;

import model.produto;

/**
 *
 * @author gabriel_renostro
 */
public class FirstClassExample {
    public static void main(String[] args) {
        //Instânciar novo objeto da classe Produto
        produto aux = new produto();
        //Cria objeto com valores estáticos
        aux.setDescricao("Cadeira");
        aux.setAltura(85);
        aux.setLargura(60);
        aux.setProfundidade(60);
        /**
         * No caso da variável valor é necessário fazer
         * um cast para "forçar" a guardar o valor 56.20
         * como um float
         */
        aux.setValor((float) 56.20);
        aux.setPeso(55);

        produto paux = new produto();
        System.out.println(aux.toString());
 //Exibe valores pro usuário
//        System.out.println(" Dados do objeto");
//        System.out.println("O produto " + aux.getDescricao() + " tem altura de " + aux.getAltura() + "centímetros, largura de "
//                + aux.getLargura() + " centímetros, e profundidade de " + aux.getProfundidade() + " centímetros. O valor do produto é de "
//                + aux.getValor() + " reais.");
    }
}
