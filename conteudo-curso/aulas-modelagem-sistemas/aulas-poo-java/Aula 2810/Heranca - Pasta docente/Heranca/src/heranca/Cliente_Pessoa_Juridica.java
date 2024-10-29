/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package heranca;

/**
 *
 * @author Professor
 */
public class Cliente_Pessoa_Juridica extends Cliente{
    private String cnpj;
    private String cnae_principal;

    public Cliente_Pessoa_Juridica() {
    }

    
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getCnae_principal() {
        return cnae_principal;
    }

    public void setCnae_principal(String cnae_principal) {
        this.cnae_principal = cnae_principal;
    }
    
    
    
}
