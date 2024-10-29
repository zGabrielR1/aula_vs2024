/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package heranca;

/**
 *
 * @author gabriel_renostro
 */
//Classe de objeto Pai
public class Cliente {
    private String identificacao;
    private String situacao;
    private Double saldo;
    private String data_cadastro;

    public String getIdentificacao() {
        return identificacao;
    }

    public void setIdentificacao(String identificacao) {
        this.identificacao = identificacao;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }

    public String getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(String data_cadastro) {
        this.data_cadastro = data_cadastro;
    }

    public Cliente() {
    }
//Adicionando comportamento
    public void AlteraStatus() {
        if(this.getSituacao() == "Ativo") {
            this.setSituacao("Inativo");
        } else {
            this.setSituacao("Ativo");
        }
    }
    public void zerarSaldo(){
        this.setSaldo(0.0);
    }
    
    
}
