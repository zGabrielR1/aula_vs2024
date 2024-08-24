programa
 {
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
funcao inicio()
 {
		cadeia login
		cadeia senha

		escreva ("####  LOGIN DO SISTEMA  ####\n")
		escreva ("Informe o Usuário: ")
		leia (login)
		escreva ("Informe a senha: ")
		leia (senha)

		limpa()

		se (login == "operador" e senha == "123abc") {
			inteiro contador = 1
			inteiro opcao
			real produto
			inteiro qtd_produtos = 0
			real total_produtos = 0

			escreva("\n#### BEM VINDO AO SISTEMA ####\n#### MENU DE OPÇÕES ####\n[1] Nova Venda\n[2] Sair do sistema\n")
			leia(opcao)

			escolha (opcao) {

			caso 1: 
		
			enquanto (contador <= 1) {
				limpa()
				escreva("####  VENDA EM ANDAMENTO  ####\nInforme o valor do produto\n")
				leia(produto)

				qtd_produtos++
				total_produtos = total_produtos + produto
			
				escreva("Deseja cadastrar um novo produto digite \n[1] Nova venda\n[2] Sair do sistema\n")
				leia(contador)
			} 
			
			se (contador != 1 e contador != 2) {
				limpa()
				escreva("\nOpção Inválida")
				escreva("\n####  RESUMO DE VENDA  #####\nQuantidade de produtos: ",qtd_produtos)
				escreva("\nValor total a ser pago: ",total_produtos)
				escreva("\nInforme o valor pago pelo cliente: ")
				real valor_pago
				leia(valor_pago)

				se (valor_pago == total_produtos) {
					limpa()
					escreva("\nValor suficiente para finalizar a venda.\nVenda Finalizada")
				} senao se (valor_pago < total_produtos) {
					limpa()
					escreva("\nO cliente ainda deve: R$ ",Matematica.arredondar(total_produtos - valor_pago, 2))
				} senao {
					limpa()
					escreva("\nO troco do cliente é: R$ ",Matematica.arredondar(valor_pago - total_produtos, 2))
				}
			} senao se (contador == 2 e qtd_produtos == 0) {
				limpa()
				escreva("\nSaindo do sistema")
			} senao {
				limpa()
				escreva("\n####  RESUMO DE VENDA  #####\nQuantidade de produtos: ",qtd_produtos)
				escreva("\nValor total a ser pago: ",Matematica.arredondar(total_produtos, 2))
				escreva("\nInforme o valor pago pelo cliente: ")
				real valor_pago
				leia(valor_pago)

					se (valor_pago == total_produtos) {
						limpa()
						escreva("\nValor suficiente para finalizar a venda.\nVenda Finalizada")
					} senao se (valor_pago < total_produtos) {
						limpa()
						escreva("\nO cliente ainda deve: R$ ",Matematica.arredondar(total_produtos - valor_pago, 2))
					} senao {
						limpa()
						escreva("\nO troco do cliente é: R$ ",Matematica.arredondar(valor_pago - total_produtos, 2))
					}
				}
				pare

			caso 2:
				limpa()
				escreva("Saindo do sistema")
				pare

			caso contrario :
				escreva("Valor inválido")
			}
			
			} senao {
				escreva ("Usuário ou Senha Inválidos")
		}	
	}
	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1536; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {total_produtos, 24, 8, 14}-{valor_pago, 51, 9, 10}-{valor_pago, 72, 9, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */