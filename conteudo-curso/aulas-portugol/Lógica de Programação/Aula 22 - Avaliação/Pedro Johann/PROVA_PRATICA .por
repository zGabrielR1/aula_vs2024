programa
{
	inclua biblioteca Matematica
	
	funcao inicio()
	{

	
		escreva (" ### LOGIN DO SISTEMA ### \n")
		
		cadeia operador
		escreva ("Informe o Usuário: ")
		leia (operador)

		cadeia senha
		escreva ("Informe o Senha: ")
		leia (senha)

		limpa()


		se (operador == "operador" e senha == "123abc"){

		inteiro opcao
		escreva ("### BEM VINDO AO SISTEMA ### \n")
			
		escreva ("### MENU DO OPÇÕES ### \n")
		escreva ("[1] Nova Venda \n")
		escreva ("[2] Sair do Sistema \n")
		leia (opcao)

		limpa()

		inteiro venda 
		escreva ("Informe o valor do produto: R$ ")

		limpa()
	

			
		inteiro qtd_produto = 0
		inteiro valor
		inteiro valor_pago
		inteiro troco
		inteiro valor_total = 0
			
				
			escolha (opcao){
				caso 1 : 
				  escreva ("### Venda em Andamento: ### \n")
					cadeia sim = "S"


					faca {
						
						
					
						escreva ("Informe o valor do produto: R$ ")
						leia (valor)

						limpa()

						qtd_produto ++
						valor_total = valor + valor_total
						
						escreva ("### Deseja incluir mais um produto de venda? ### \n")
						escreva (" [S] Sim \n [N] Não \n ")
						leia (sim)
						limpa()
						
					}enquanto (sim == "S" ou sim == "s")
						
						
						
						Matematica.arredondar(valor_total, 2)
						escreva ("### RESUMO DA VENDA ### \n")
						escreva ("Quantidade de produtos: ", qtd_produto)
						escreva ("\nValor total a ser pago: ", valor_total)
						escreva ("\nInforme o valor pago pelo clinte: R$ ")
						leia (valor_pago)

					se(valor_pago < valor_total){
						troco = valor_total - valor_pago
						escreva ("O clinte ainda deve: ", troco)
							
					}senao se (valor_pago > valor_total){
						troco = valor_pago - valor_total
						escreva ("O troco do cliente é: ", troco)
					}senao {
						escreva ("Valor suficiente para finalizar a compra. Venda Finalizada	")
						}
						
					pare

				caso 2 :
						escreva ("Saindo do Sistema... ")
					 pare
					   
				caso contrario :
						escreva ("OPÇÃO INVÁLIDA!! ")   
				}
			
			

				
	
		}senao {
			escreva ("Usuário ou senha inválidos ")
		}
		
		
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */