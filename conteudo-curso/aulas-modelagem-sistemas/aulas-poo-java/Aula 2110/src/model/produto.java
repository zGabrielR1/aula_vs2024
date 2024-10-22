/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author gabriel_renostro
 * Classe que armazena os atributos e comportamentos do produto
 * Altura, profundidade e largura são armazenados em centímetros
 */
public class produto {
    private String descricao;
    private float valor;
    private float altura;
    private float profundidade;
    private float largura;

    
    // Utilizando o InsertCode, criamos um comportamento de 
    // os dados do produto em uma variável do tipo String
    @Override
    public String toString() {
        return "Dados do produto"
                + "Descricao" + descricao + "\n"
                + "Valor=" + valor + "\n"
                + "Altura=" + altura + "\n"
                + "Profundidade=" + profundidade + "\n" 
                + "Largura=" + largura;
    }
    
    

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }

    public float getProfundidade() {
        return profundidade;
    }

    public void setProfundidade(float profundidade) {
        this.profundidade = profundidade;
    }

    public float getLargura() {
        return largura;
    }

    public void setLargura(float largura) {
        this.largura = largura;
    }
    
    
}
