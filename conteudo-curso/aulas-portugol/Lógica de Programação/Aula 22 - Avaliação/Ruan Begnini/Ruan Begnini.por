programa{
	
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio(){

		cadeia login
		cadeia senha

		
		escreva ("############ LOGIN DO SISTEMA ###########\n")
		escreva ("\nInforme o Usuário: ")
		leia (login)
		escreva ("Informe a Senha: ")
		leia (senha) limpa()

		se (login == "operador" e senha == "123abc") {
			
			inteiro menu, qtd_produto = 0
			cadeia parar = "S"
			real valor_final = 0, valor_produto, valor_pgt = 0, deve_montante, troco
			

			escreva ("############# BEM VINDO AO SISTEMA ##############")
			escreva ("\n############# ESCOLHA A EMPRESA ##############")
			escreva ("\n[1] Nova Venda\n[2] Sair do sistema\n")
			leia (menu) limpa()

			
			escolha (menu) {
				caso 1: 
					faca {
						
						escreva ("############# VENDA EM ANDAMENTO ##############")
						escreva ("\nInforme o valor do produto:R$ ")
						leia (valor_produto)
				
						valor_final = valor_final + valor_produto
						qtd_produto++
						
						escreva ("\n####### Deseja incluir mais um produto da venda? ########")
						escreva ("\n[S] Sim")
						escreva ("\n[N] Não\n")
						leia (parar)

						parar = Texto.caixa_alta(parar)

					} enquanto (parar == "S")
		
					limpa()
					escreva ("############# RESUMO DA VENDA ##############")
					escreva ("\nQuantidade de Produtos: " ,qtd_produto)
					escreva ("\nValor total a ser pago: R$ " ,valor_final)
					escreva ("\nInforme o valor Pago pelo cliente: R$ ")
					leia(valor_pgt)
					limpa()
					
					se (valor_pgt < valor_final) {
						deve_montante = valor_final - valor_pgt
						escreva ("\nO cliente ainda deve: R$ " ,Matematica.arredondar(deve_montante, 2))
						
					} senao se (valor_pgt > valor_final) {
						troco = valor_pgt - valor_final
						escreva ("\nO Troco do Cliente é: R$ " ,Matematica.arredondar(troco, 2))
					} senao {
						escreva ("\nValor suficiente para finalizar a venda. Venda finalizada\n")
					}
								
					pare
		
				caso 2:
					escreva ("Saindo do sistema...")
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
 * @POSICAO-CURSOR = 1774; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valor_final, 22, 8, 11}-{valor_produto, 22, 25, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */