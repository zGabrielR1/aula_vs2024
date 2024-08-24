programa {
	inclua biblioteca Matematica
		funcao inicio() {

		cadeia usuario
		escreva ("######### LOGIN DO SISTEMA ######### \n")
		escreva ("Informe o usuário: ")
		leia (usuario)

		cadeia senha
		escreva ("Informe a senha: ")
		leia (senha)

		inteiro opcao 
		real valor_prod 
		cadeia inclusao

		inteiro contador = 1
		real valor_total = 0.0
		real valor_pago 
		real valor_faltante
		real saldo
		
		limpa()
		
		se (usuario == "operador" e senha == "123abc") {
			escreva ("######## BEM VINDO AO SISTEMA ######### \n")
			escreva ("######## MENU DE OPÇÕES ######### \n")
			escreva (" [1] NOVA VENDA \n")
			escreva (" [2] SAIR DO SISTEMA \n")
			leia (opcao)	
			
			limpa()

		escolha (opcao){
			caso 1:
				escreva ("######### VENDA EM ANDAMENTO #########\n")
				escreva ("Informe o valor do produto: R$ ")
				leia (valor_prod)
				limpa()
				escreva ("######### DESEJA INCLUIR MAIS UM PRODUTO NA VENDA?) #########\n")
				escreva (" [S] Sim\n")
				escreva (" [N] Não\n")
				leia (inclusao)
				limpa()

				valor_total = valor_prod

				limpa ()

			se (inclusao == "N") {
				escreva("######### RESUMO DA VENDA #########\n") 
				escreva("Quantidade de Produtos: ", contador , "\n")
				escreva("Valor Total a ser Pago: R$", valor_total)
				escreva("\nInforme o valor Pago pelo Cliente: ") 
				leia (valor_pago)
				limpa ()
				valor_faltante = valor_total - valor_pago

			se (valor_total > valor_pago){
				escreva ("O cliente ainda deve pagar: R$ " , Matematica.arredondar(valor_faltante, 2))
				} senao se (valor_total > valor_pago) {
				saldo = valor_pago - valor_total
				escreva ("O troco do cliente é: R$ " , Matematica.arredondar(saldo, 2))
				} senao se (valor_pago == valor_total){
				escreva ("Valor suficiente para finalizar venda. Venda finalizada.")
				} senao {
			}
			}

			enquanto (inclusao == "S") {
				escreva ("######### VENDA EM ANDAMENTO #########\n")
				escreva ("Informe o valor do produto: R$ ")
				leia (valor_prod)
				limpa()
				escreva ("######### DESEJA INCLUIR MAIS UM PRODUTO NA VENDA? #########\n")
				escreva (" [S] Sim\n")
				escreva (" [N] Não\n")
				leia (inclusao)
				limpa()

				contador++
				valor_total = valor_total + valor_prod



			se (inclusao == "N") {
				escreva ("######### RESUMO DA VENDA #########\n")
				escreva ("Quantidade de produtos: " , contador)
				escreva ("\nValor total a ser pago: " , valor_total)
				escreva ("\nInforme o valor pago pelo cliente: ")
				leia (valor_pago)
				limpa()

				se (valor_total > valor_pago){
					 valor_faltante = valor_total - valor_pago
					escreva ("O cliente ainda deve pagar: R$ " , Matematica.arredondar(valor_faltante, 2))
				} senao se (valor_pago > valor_total) {
					saldo = valor_pago - valor_total
					escreva ("O troco do cliente é: R$ " , Matematica.arredondar(saldo, 2))
				} senao {
					escreva ("Valor suficiente para finalizar venda. Venda finalizada.")
				} 
					
				}
				
			}

			
			pare
			caso 2: 
			escreva ("Saindo do sistema...")

			pare

			caso contrario:
			escreva ("Opção inválida!")

		}
		} senao {
			escreva ("Usuário ou senha inválidos!")
			
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2738; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valor_prod, 15, 7, 10}-{contador, 18, 10, 8}-{valor_total, 19, 7, 11}-{valor_pago, 20, 7, 10}-{valor_faltante, 21, 7, 14}-{saldo, 22, 7, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */