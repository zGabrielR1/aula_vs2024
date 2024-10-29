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

        
//        System.out.println(pf1.getSituacao());
//        System.out.println(pf1.getSaldo());
//        
//        pf1.AlteraStatus();
//        pf1.zerarSaldo();
//        
//        System.out.println(pf1.getSituacao());
//        System.out.println(pf1.getSaldo());
        
        
/*Exercício 01
  Crie um comportamento na Classe Pessoa Física.
  Crie um objeto cliente Pessoa Jurídica, povoe seus campos.
  Imprima os valores do mesmo, logo após, chame o comportamento
  que criou na classe Pessoa Física
  Imprima os dados para ver o funcionamento disso
*/
/*
Resolução:
public void setCPF() {

    }
*/
    Cliente_Pessoa_Fisica pf2 = new Cliente_Pessoa_Fisica();
    pf2.setIdentificacao("Senai");
    pf2.setSaldo(100.0);
    pf2.setSituacao("Inativo");
    pf2.setCpf("666.162.590-21");
    pf2.setData_nascimento("17/08/1994");
    System.out.println(pf2.getCpf());
    
    pf2.AlterarCPF("111.111.111-22");
    System.out.println(pf2.getCpf());
    
    
    Cliente_Pessoa_Juridica pjaux = new Cliente_Pessoa_Juridica();
    pjaux.setIdentificacao("SENAI");
    pjaux.setCnpj(cnpj);
    pjaux.setData_cadastro(data_cadastro);
    pjaux.setData_cadastro(data_cadastro);
    pjaux.setSaldo(Double.NaN);
    pjaux.setSituacao(situacao);
    pjaux.setCnae_principal(cnae_principal);
    
        System.out.println("Saldo: " + pjaux.getSaldo() + "Status: " + pjaux.getSituacao());
        
        pjaux.zerarSaldo();
        pjaux.AlteraStatus();
         
        
        Cliente_Pessoa_Fisica pfaux = new Cliente_Pessoa_Fisica();
        System.out.println("Saldo: " + pjaux.getSaldo() + "Status: " + pjaux.getSituacao());
        pfaux.setData_nascimento(data_nascimento);
        
        System.out.println("");
        System.out.println("");
        pfaux.setCpf(cpf);
        pfaux.setCpf(cpf);
        pfaux.setCpf(cpf);

    }   
}