programa
{
// Vinicius Borsatti
	inclua biblioteca Matematica --> m
	
	
	
	funcao inicio()
	{
		cadeia usuario
		cadeia senha 
		inteiro opcao , opcao1
		real valor_pago= 0.0 , troco = 0.0 , valor_produto = 0.0,  falta = 0.0 , valor_produto1 = 0.0
		real valor_total = 0.0 
		inteiro qtd = 1 


		escreva ("  BEM VINDO !  ")
		escreva("\n")

		escreva("Informe o usuario : ")
		leia(usuario )
		escreva("\n")

		escreva("Informe a senha   : ")
		leia(senha )
		escreva("\n")

		limpa  ()


		se (usuario == "operador" e senha == "123abc" ){


		escreva (" BEM VINDO AO SISTEMA  !  ")
		
		escreva("\n")
		
		faca{
		
		escreva( " MENU DE VENDAS     \n ")
		escreva("[1] Nova Venda  \n ")
		escreva("[2] Sair do sitema  \n ")
		leia (opcao)
		

		limpa ()

		escolha (opcao){
		caso 1: 
			
				escreva ("  Venda em Andamento   !  ")
				escreva("\n")
				
				escreva ("Informe o valor do produto : R$  ")
				leia(valor_produto)

				limpa()


		faca{
				escreva ("  Venda em Andamento   !  ")
				escreva("\n")
				escreva( " Deseja incluir mais um produto    \n ")
		          escreva("[1] Sim  \n ")
		          escreva("[2] Não  \n ")
		          leia (opcao1)
		          limpa()

		 se (opcao1 == 1 ){

			
		      
				 escreva ("  Venda em Andamento   !  ")
				 escreva("\n")
		           escreva ("Informe o valor do produto : R$  ")
				 leia(valor_produto1)

				 valor_total = valor_total + valor_produto + valor_produto1
				 
				 limpa()

				 qtd++
				     
		          	
			
	    } senao se ( opcao1 == 2 )  {
		          	
          //Biblioteca
		m.arredondar(valor_total, 2)

		escreva ("Venda Finalizada   !  ")
		escreva("\n")
	     escreva("RESUMO DA VENDA")
	     escreva("\n")
			
          escreva ("Quantidade de produtos:", qtd)
          escreva("\n")
        
          escreva ("Total a ser pago: R$", valor_total)
          escreva("\n")


        
         escreva("Digite o valor pago pelo cliente: R$  ")
         leia(valor_pago)


       se ( valor_pago < valor_total){


		falta =  valor_total - valor_pago
		
		 //Biblioteca
		m.arredondar(falta, 2)

          escreva("Valor insuficiente. Faltam R$", falta )
            
       }senao se ( valor_pago > valor_total){
        	
          troco = valor_pago - valor_total
          
           //Biblioteca
          m.arredondar(troco, 2)
            
          escreva("Troco: R$", troco)
            
        }senao{
            escreva("Pagamento efetuado com sucesso. Venda finalizada.")
        }

	   } } enquanto ( opcao1 == 1 ) 


				
		pare
				
		caso 2 :
		
		   escreva("Finalizando o Programa.......")
				
		caso contrario : 
				
		   escreva ("Opção invalida ")
		}
		

		} enquanto ( opcao == 1 )
				
		}senao {
					
		   escreva("Usuario ou senha invalido ")
					
					
		}

		 
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2560; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */