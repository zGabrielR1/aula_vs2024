programa {
	inclua biblioteca Matematica
	funcao inicio() {
		cadeia usuario , senha , continuar = ""
		inteiro opcao , quant_produtos = 0 , contador = 0
		real valor_produto , valor_total = 0 , valor_pago , valor_troco = 0 ,valor_deve = 0
		
		escreva("         LOGIN DO SISTEMA\n")
		escreva("Informe o usuário: ")
			leia(usuario)
		escreva("informe a senha: ")
			leia(senha)

		limpa()

		se(usuario == "operador" e senha == "123abc") {
			escreva("          BEM VINDO AO SISTEMA\n")
			escreva("            MENU DE OPÇÔES\n")
			escreva("[1]Nova venda\n[2]Sair do sistema\n")
				leia(opcao)

			limpa()

			escolha(opcao){
				caso 1:
					faca{
						escreva("         VENDA EM ANDAMENTO\n")
						escreva("Informe o valor do produto: R$")
							leia(valor_produto)

						limpa()

						escreva("        DESEJA INCLUIR MAIS UM PRODUTO NA VENDA?\n")
						escreva("[S]Sim\n[N]Não\n")
							leia(continuar)
	
						valor_total = valor_total + valor_produto

						contador++

						limpa()
						
					}enquanto(continuar == "S" ou continuar == "s")   

						escreva("         RESUMO DA VENDA\n")
						escreva("Quantidade de produtos: " , contador , "\nValor total a ser pago: " , valor_total )
						escreva("\nInforme o valor pago pelo cliente: R$")
							leia(valor_pago)

							limpa()

							se(valor_pago > valor_total){
								valor_troco = valor_pago - valor_total 
								escreva("O troco do cliente é: R$" , Matematica.arredondar(valor_troco , 2))  // incluir biblioteca matematica para arredondar o valor
							
							}senao se(valor_pago < valor_total) {
								valor_deve = valor_total - valor_pago 
								escreva("O cliente ainda deve: R$" , Matematica.arredondar(valor_deve , 2))
							
							}senao{
								escreva("Valor suficiente para finalizar a venda.\nVenda finalizada!")
							}
					
				pare
				
				caso 2:
					escreva("Saindo do sistema...")
				pare

				caso contrario:
					escreva("Opção inválida!")
			}
			
		}senao{
			escreva("Usuário ou senha inválidos")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 540; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */