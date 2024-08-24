programa {

	inclua biblioteca Matematica
	funcao inicio(){
		
		escreva("### LOGIN DO SISTEMA ### \n")
		
		cadeia usuario
		escreva ("informe seu usuario: ")
		leia (usuario)
		cadeia senha
		escreva ("informe sua senha: ")
		leia (senha)

		inteiro i= 1, qtd_itens, qtd_itens2, i2= 1 , total1= 0, total2 =0
		real valor_prod, valor_prod2, total, pagar

		limpa ()

		se (usuario == "operador" e senha == "123abc"){
			escreva("### BEM VINDO AO SISTEMA ### \n", "### MENU DE OPÇÕES ### \n")
		
			inteiro opcao
			escreva ("[1]Nova venda \n")
			escreva ("[2]sair do sistema \n")
			leia (opcao)

			limpa()
		
			escreva("### VENDA EM ANDAMENTO ### \n")
			escreva("informe a quantidade de itens: ")
			leia(qtd_itens)

			limpa()

			escolha (opcao){
				caso 1 :
				enquanto (i <= qtd_itens){
					escreva("### VENDA EM ANDAMENTO ### \n")
					escreva("informe o valor do " , i , "º produto: R$")
					leia(valor_prod)
	
					limpa()
					total1 = total1 + valor_prod
					i++
					}
				
					escreva("### Deseja incluir mais algum item? \n")
			

					inteiro opcao2
					escreva ("[1]sim \n")
					escreva ("[2]não \n")
					leia (opcao2)

					limpa()
					
					escolha (opcao2){
						caso 1 :
						escreva("informe quantos produtos mais você deseja:")
						leia(qtd_itens2)

						limpa()

						enquanto (i2 <= qtd_itens2){
					escreva("### VENDA EM ANDAMENTO ### \n")
					escreva("informe o valor do " , i2 , "º produto que sera adicionado: R$")
					leia(valor_prod2)
	
					limpa()
					total2 = total2 + valor_prod2
					i2++
					}

					
					inteiro total_item = qtd_itens + qtd_itens2
					real total_pagar = total2 + total1
					Matematica.arredondar(total_pagar, 2)
						escreva("### RESUMO DA VENDA ### \n")
						escreva("quantidade de produtos: ", total_item, "\n")
						escreva("o total a pagar será de: R$", total_pagar, "\n")
						escreva("informe o valor pago pelo cliente: R$")
						leia(pagar)

						limpa()

						se (pagar < total_pagar){
						real dever = total_pagar - pagar
						escreva ("O cliente ainda deve: R$" , dever)
						}senao se (pagar > total_pagar){
							real troco = pagar - total_pagar
							escreva ("O cliente recebe de troco: R$" , troco)
						}senao{
							escreva("O valor foi suficiente, compra feita com sucesso!!!")
						}

					pare	

					caso 2 :

						Matematica.arredondar(total1, 2)
						escreva("### RESUMO DA COMPRA ### \n")
						escreva("quantidade de produtos: ", qtd_itens, "\n")
						escreva("o total a pagar será de: R$", total1, "\n")
						escreva("informe o valor pago pelo cliente: R$")
						leia(pagar)

						limpa()

						se (pagar < total1){
						real dever = total1 - pagar
						escreva ("O cliente ainda deve: R$" , dever)
						}senao se (pagar > total1){
							real troco = pagar - total1
							escreva ("O cliente recebe de troco: R$" , troco)
						}senao{
							escreva("O valor foi suficiente, compra feita com sucesso!!!")
						}
				}
			pare

			caso 2 :
			escreva("Saindo do sistema...") 
			
			pare
		}
		
		}senao {
			escreva ("usuario ou senha invalidos!!")
		 }	
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1693; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */