/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package heranca;

/**
 *
 * @author Professor
 */
public class Heranca {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Instância de um objeto da classe Pessoa Física
        Cliente_Pessoa_Fisica pf1 = new Cliente_Pessoa_Fisica();
        //Povoa Objeto com dados
        pf1.setIdentificacao("Senai");
        pf1.setSaldo(150);
        pf1.setData_cadastro("01/10/2024");
        pf1.setSituacao("Ativo");
        pf1.setCpf("254.445.465-82");
        pf1.setData_nascimento("01/01/1990");

        System.out.println(pf1.getSituacao());
        System.out.println(pf1.getSaldo());

        pf1.alteraStatus();
        pf1.zerarSaldo();

        System.out.println(pf1.getSituacao());
        System.out.println(pf1.getSaldo());

        /*Exercício 01
//Crie um comportameno na classe Pessoa Física;
//Crie um objeto cliente Pessoa Juridica, povoe seus campos. 
//Imprima os valores do mesmo, zere o saldo e altere o status deste objeto,
//Imprima seus atributos novamente, logo após, chame o comportamento 
//que criou na classe Pessoa Física
//Imprima os dados para ver o funcionamento disso
         */
        
        //Cria objeto do tipo PJ
        Cliente_Pessoa_Juridica pjaux = new Cliente_Pessoa_Juridica();
        
        //Povoa Objeto
        pjaux.setIdentificacao("Senai Concórdia");
        pjaux.setCnpj("0451254.0001/75");
        pjaux.setData_cadastro("01/01/2024");
        pjaux.setSaldo(120.0);
        pjaux.setSituacao("Ativo");
        pjaux.setCnae_principal("0124.65898-7.00012");
        //Imprime o saldo e status para saber que está no objeto
        System.out.println("Saldo: " + pjaux.getSaldo() + "Status: " + pjaux.getSituacao());
        //Chama os comportamentos criados na classe cliente
        pjaux.zerarSaldo();
        pjaux.alteraStatus();
        
//Imprime saldo e status para confirmar que está sendo alterado
        System.out.println("Saldo: " + pjaux.getSaldo() + "Status: " + pjaux.getSituacao());

        //Cria um cliente PF e define a data de nascimento
        Cliente_Pessoa_Fisica pfaux = new Cliente_Pessoa_Fisica();
        pfaux.setData_nascimento("01/01/2024");
        //Imrpime a data para confirmar o valor
        System.out.println(pfaux.getData_nascimento());
        //Chama o comportamento que está na classe Pesso física e que não pode ser usada pela pessoa jurídica
        pfaux.pedirNovaDataNascimento();
        //Imprime os valores para conferir se a data foi a informada pelo usuário
        System.out.println(pfaux.getData_nascimento());

    }

}
