programa {
	inclua biblioteca Matematica
   funcao inicio() {
		cadeia usuario
		cadeia senha	
		
		escreva ("############LOGIN DO SISTEMA###########\n")
		escreva ("Informe o Usuário: ")
		leia (usuario)
		escreva ("Informe a Senha: ")
		leia (senha)

		limpa() 

		se (usuario == "operador" e senha == "123abc") {

			inteiro opcoes

			escreva ("#######  BEM VINDO AO SISTEMA  #####\n")
			escreva ("##### MENU DE OPÇÕES #######\n")
			escreva ("\n[1] Nova venda\n[2] Sair do sistema\n")
			leia (opcoes) 

			limpa() 

			escolha (opcoes) {
				caso 1: 
					escreva("####### VENDA EM ANDAMENTO ######\n") 
					 
					inteiro produto
					real total_produto = 0
					real qtd_produtos = 0
					cadeia resposta = "s"
					real deve
					real troco
					real valor_pago 
		
					
					faca {
					escreva("Informe o valor do produto : R$ ")
					leia(produto)

          limpa()

					total_produto = total_produto + produto
					qtd_produtos++

					escreva("Deseja informar outro produto? \n")
					escreva("[s] sim\n")
					escreva("[n] não\n")
					leia(resposta)

				
					limpa()

					} enquanto (resposta == "s") 

          
					
					escreva ("############# RESUMO DA VENDA ##############")
					escreva ("\nQuantidade de Produtos: " ,qtd_produtos)
					escreva ("\nValor total a ser pago: R$ " ,total_produto)
					escreva ("\nInforme o valor Pago pelo cliente: R$ ")
					leia(valor_pago)

          limpa()

					se (valor_pago < total_produto) {
						deve = total_produto - valor_pago
						escreva ("\nO cliente ainda deve: R$ " , Matematica.arredondar(deve, 2) )
						
					} senao se (valor_pago > total_produto) {
						troco = valor_pago - total_produto
						escreva ("\nO Troco do Cliente é: R$ " , Matematica.arredondar(troco, 2 ))
					} senao {
						escreva ("\nValor suficiente para finalizar a venda. Venda finalizada\n")
					}

					
					 
					pare

				caso 2 : 
					escreva ("Saindo do sistema....") 

					pare 

				caso contrario:
					escreva("Opção inserida inválida!")
			}
			
		} senao{
			escreva ("Usuário ou Senha Inválidos\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1713; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */