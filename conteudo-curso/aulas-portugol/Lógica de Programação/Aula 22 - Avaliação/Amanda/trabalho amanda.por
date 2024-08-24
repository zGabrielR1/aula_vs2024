programa
{ inclua biblioteca Matematica
	
	funcao inicio ( ) { 
      escreva ( " Login de sistema " )
    inteiro tentativas = 3
    enquanto (tentativas > 0) {
    	cadeia usuario 
    	cadeia senha
   
 
          escreva("\n Digite o seu usuário: ")
           leia(usuario)
           escreva("Digite a senha: ")
       
           escreva("Digite a senha: ")
          leia(senha) 

              se  (usuario == "operador" e senha == "123abc") {
          	    escreva ( " BEM VINDO AO SISTEMA " )
          	    escreva ( " \n MENU DE OPÇÕES " ) 
          	     
          	    real  total_pago
                   inteiro quantidade_produtos
                   real divida
                   real troco
                   real valor_do_produto 
                   real saldo_devedor

   				 escreva("\nRESUMO DA VENDA\n")
   				 escreva("Quantidade de produtos comprados:  \n")
   				 leia (quantidade_produtos)
   				 escreva("Valor unitario dos produtos comprados: R$  \n")
   				 leia (valor_do_produto)
   				 divida = quantidade_produtos*valor_do_produto
   				 escreva ("Cliente deve R$",divida, "\n")
   				 escreva("Informe o valor pago pelo cliente: R$")
   				 leia(total_pago) 
   				 troco =   total_pago- divida
   				 saldo_devedor =  divida - total_pago
   				 
   				 
  				se (divida  > total_pago ){
        			escreva("Valor insuficiente. Deve: R$",Matematica.arredondar( saldo_devedor,2), "\n")
 				 }senao se (total_pago > divida ) {
       				 escreva("Troco: R$", Matematica.arredondar ( troco,2), "\n")
 					 } senao {
        					escreva("Valor suficiente. Venda finalizada.\n")
					  }
          	
          			}
          senao {
            escreva("Usuário ou senha incorretos. Tentativas restantes: ", tentativas - 1, "\n")
            tentativas = tentativas - 1
        
    } 
    
   

    }
	}



	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1101; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */