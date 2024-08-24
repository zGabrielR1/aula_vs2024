programa {
	inclua biblioteca Matematica 
	funcao inicio() {
	
		escreva("###### LOGIN DO SISTEMA ######\n")
		cadeia usuario
		escreva("\nInforme o Usuário: ")
		leia(usuario)

		cadeia senha 
		escreva("Informe a Senha:")
		leia(senha)
		
		limpa()

			se(senha=="123abc" e usuario=="operador"){
				escreva("###### BEM VINDAO AO SISTEMA ######")
				escreva("\n###### MENU DE OPÇÕES ######\n")

				inteiro opcao 
				escreva("\n[1] Nova Venda\n")
				escreva("[2] Sair do sistema\n")
				leia(opcao)

				real valor_produto = 0
				inteiro qtd_produtos = 0
				real valor_total = 0
				real valor_pago = 0
				real troco = 0

				limpa()

					escolha(opcao){
						caso 1: 
							escreva("###### VENDA EM ANDAMENTO ######\n")
							cadeia sim = "S"
		
							faca {
		
		   					escreva("Informe o valor do produto: $")
		   					leia(valor_produto)
		
		   					limpa()
		
		   					qtd_produtos++
		   					valor_total = valor_total + valor_produto
		
		   					escreva("###### Deseja incluir mais um produto na venda? ######\n")
		   					escreva("[S] Sim \n[N] Não\n")
		   					leia(sim)
		   					limpa()
		   					}enquanto(sim=="S" ou sim=="s")
		
		   					limpa()
							Matematica.arredondar(valor_total, 2)
							escreva("###### RESUMO DA VENDA ######\n")
							escreva("Quntidade de produtos: ",qtd_produtos)
							escreva("\nValor Total a ser pago: R$",valor_total)
							escreva("\nInforme o valor pago pelo cliente: R$")
							leia(valor_pago)
		
							
		
							limpa()
							Matematica.arredondar(troco, 2)
							se (valor_total>valor_pago){
								troco = valor_total - valor_pago
								escreva("O cliente ainda deve: R$",troco)
								
							}senao se(valor_total<valor_pago){
								troco = valor_pago - valor_total
								escreva("O troco do cliente é: R$",troco)
								
							}senao{
								escreva("Valor suficiente para finalizar a venda. Venda finalizada.")
							}
							
							pare
						caso 2 :
						escreva("Saindo do sistema...")	
							pare
						caso contrario:
						escreva("opção inválida!")	
				}
				
			}senao{
			escreva("Usuário ou Senha inválidos")
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1717; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */