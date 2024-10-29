/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package heranca;

import javax.swing.JOptionPane;

/**
 *
 * @author Professor
 */
public class Cliente_Pessoa_Fisica extends Cliente{
    
    private String cpf;
    private String data_nascimento;

    public void pedirNovaDataNascimento(){
    this.setData_nascimento(JOptionPane.showInputDialog("Informe a data de nascimento"));
    }
    
    public Cliente_Pessoa_Fisica() {
    }

    
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    
}
