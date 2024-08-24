programa{
	inclua biblioteca Matematica 
	funcao inicio(){
		//INICIO
		escreva("##### LOGIN DO SISTEMA #####\n")

		//VARIAVEIS
		cadeia usuario
		escreva(" Informe o Usuário: ")
		leia(usuario)
		
		cadeia senha 
		escreva(" Informe a Senha: ")
		leia(senha)
		
		
limpa()		
		//LOGIN
		se ( usuario == "operador" e senha == "123abc") {
			escreva("##### BEM VINDO AO SISTEMA ##### \n ##### MENU DE OPÇÕES ##### \n \n")

			//DADA AS OPÇOES
			inteiro opcao
			escreva(" [1] NOVA VENDA\n")
			escreva(" [2] SAIR DO SISTEMA\n")
			leia(opcao)
limpa()
			//varialvel das opções
			inteiro i = 1 , qtd_produtos = 0  , resposta = 1
			real total = 0.0, valor
			
			//ESCOLHA AS OPÇOES
			escolha(opcao){				
				caso 1:
					enquanto(resposta == 1 ){
						escreva("##### VENDA EM ANDAMENTO #####\n")
						escreva(" Informe o valor do produto R$")
						leia(valor)
limpa()
						//SOMATORIA 
						qtd_produtos = qtd_produtos + 1 
						total = total + valor

						//QUER MAIS ITENS?
						escreva("##### DESEJA INCLUIR MAIS UM PRODUTO NA VENDA #####\n")
						inteiro pergunta
						escreva(" [1] SIM \n [2] NÃO\n ")
						leia(resposta)

							//CASO DIGITAR ERRADO
							enquanto(resposta != 1 e resposta != 2 ){
								escreva(" OPÇÃO INVALIDA \n")
								leia(resposta)
								
							}
limpa()						
					}
					
						//RESUMO DA VENDA 
						escreva("##### RESUMO DA VENDA #####\n")
						escreva(" QUANTIDADE DE PRODUTOS: ", qtd_produtos,"\n")
						escreva(" VALOR TOTAL A SER PAGO: R$", Matematica.arredondar(total, 2), "\n")
						
						real valor_recebido
						escreva(" INFORME O VALOR PAGO PELO CLIENTE: R$")
						leia(valor_recebido)
limpa()
						//FALTOU 
						se(valor_recebido < total){
							real falta = total - valor_recebido
							escreva(" O CLIENTE AINDA DEVE: R$",Matematica.arredondar(falta, 2))

						//TROCO
						} senao se(valor_recebido > total) {
							real troco = valor_recebido - total
							escreva(" SEU TROCO SERÁ DE: R$", Matematica.arredondar(troco, 2))

						
						//TOTAL CORRETO 	
						}senao {
							escreva(" FINALIZANDO VENDA ")
						}
				pare


				caso 2: 
					escreva(" SAINDO DO SISTEMA......")

				pare

				caso contrario:
				
					escreva(" OPÇÃO INVALIDA ")
			}				 			
			
		}
		
		senao {
			escreva (" Usuário invalido ")
		}
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2026; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */