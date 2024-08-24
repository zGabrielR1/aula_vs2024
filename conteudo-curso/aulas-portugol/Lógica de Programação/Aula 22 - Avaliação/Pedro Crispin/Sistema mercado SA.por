programa {
	
	inclua biblioteca Matematica
	inclua biblioteca Texto
	funcao inicio() {

		cadeia login, senha, opcoes_
		inteiro opcoes, tantos = 0, i = 1, troco
		real valor, total = 0, pago

		escreva ("### LOGIN DO SISTEMA ###\n")
	
		escreva ("\nInforme o Usuário: ")
		leia (login)
		escreva ("\nInforme a Senha: ")
		leia (senha)

		limpa ()

			se (login == "operador" e senha == "123abc"){

				escreva ("### BEM VINDO AO SISTEMA ###\n", "### MENU DE OPÇÕES ###")
				
				escreva ("\n[1] Nova Venda")
				escreva ("\n[2] Sair do Sistema\n")
				leia (opcoes)

				limpa ()	

					escolha (opcoes){
					
						caso 1:
							faca{
								escreva ("### Venda em andamento ###\n")

								escreva ("\nInforme o valor do produto: R$")
								leia (valor)
								total = total + valor
								tantos++
								i++

								limpa ()

								escreva ("### Deseja Incluir mais um produto na venda? ###\n")

								escreva ("\n[S] Sim")
								escreva ("\n[N] Não\n")
								leia (opcoes_)

								limpa ()
								
							}enquanto (opcoes_ == "SIM" ou opcoes_ == "S")

							pare

							caso 2:
							escreva ("Saindo do sistema...\n")
							pare
						
						caso contrario:
							escreva ("Opção inválida\n")
							pare
							
					}

						escreva ("### RESUMO DA VENDA ###\n")

						escreva ("\nQuantidade de produtos: ", tantos)
						escreva ("\nValor total a ser pago: ", Matematica.arredondar (total ,2))
						escreva ("\nInforme o valor pago pelo cliente: R$" )
						leia (pago)
						limpa ()


						se (pago < total){
							escreva ("O cliente ainda deve: R%", total-pago)
							
						} senao {
							escreva ("O troco do cliente é: R$", pago-total)
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
 * @POSICAO-CURSOR = 1686; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */