/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package heranca;

/**
 *
 * @author gabriel_renostro
 */
public class Heranca {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
//Instância de um objeto da classe Pessoa Física
        Cliente_Pessoa_Fisica pf1 = new Cliente_Pessoa_Fisica();
        
//Povoa Objeto com dados        
pf1.setIdentificacao("Senai");
pf1.setSaldo(150.0);
pf1.setSituacao("Ativo");
pf1.setCpf("254.445.465-82");
pf1.setData_nascimento("01/01/1990");

        
        System.out.println(pf1.getSituacao());
        System.out.println(pf1.getSaldo());
        
        pf1.AlteraStatus();
        pf1.zerarSaldo();
        
        System.out.println(pf1.getSituacao());
        System.out.println(pf1.getSaldo());
    }   
}