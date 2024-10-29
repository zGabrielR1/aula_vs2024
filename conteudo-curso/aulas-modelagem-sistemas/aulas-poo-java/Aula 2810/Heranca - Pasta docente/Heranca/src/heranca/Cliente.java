/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package heranca;

//Classe do Objeto Pai
public class Cliente {
    
    private String identificacao;
    private String situacao;
    private double saldo;
    private String data_cadastro;
    
    public Cliente() {
    }
    
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
    
    public double getSaldo() {
        return saldo;
    }
    
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
    
    public String getData_cadastro() {
        return data_cadastro;
    }
    
    public void setData_cadastro(String data_cadastro) {
        this.data_cadastro = data_cadastro;
    }
//Adicionando comportamento

    public void alteraStatus() {
        if (this.getSituacao() == "Ativo") {
            this.setSituacao("Inativo");
        } else {
            this.setSituacao("Ativo");
        }
        
    }
    public void zerarSaldo(){
    this.setSaldo(0.0);
    }
}
