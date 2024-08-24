programa{
	inclua biblioteca Matematica 
	funcao inicio(){
		escreva("### LOGIN DO SISTEMA ###\n")

		cadeia usuario
		escreva(" Informe o Usuário: ")
		leia(usuario)
		
		cadeia senha 
		escreva(" Informe a Senha: ")
		leia(senha)
		
		limpa()		

		se ( usuario == "operador" e senha == "123abc") {
			escreva("### BEM VINDO AO SISTEMA ##### \n ##### MENU DE OPÇÕES ### \n \n")

			inteiro opcao
			escreva(" [1] NOVA VENDA\n")
			escreva(" [2] SAIR DO SISTEMA\n")
			leia(opcao)
			
			limpa()
			
			inteiro i = 1 , qtd_produtos = 0  , resposta = 1
			real total = 0.0, valor
			
			escolha(opcao){				
				caso 1:
					enquanto(resposta == 1 ){
						escreva("### VENDA EM ANDAMENTO ###\n")
						escreva(" Informe o valor do produto R$")
						leia(valor)
						
						limpa()

						qtd_produtos = qtd_produtos + 1 
						total = total + valor

						escreva("### Deseje incluir mais algum produto na venda? ###\n")
						inteiro pergunta
						escreva(" 1 - SIM \n 2 - NÃO\n ")
						leia(resposta)

							enquanto(resposta != 1 e resposta != 2 ){
								escreva(" OPÇÃO INVALIDA \n")
								leia(resposta)					
							}
			limpa()						
					}
					
					escreva("### RESUMO DA VENDA ###\n")
						escreva(" Quantidade de produtos: ", qtd_produtos,"\n")
						escreva(" Valor total a ser pago: R$", Matematica.arredondar(total, 2), "\n")
						
						real valor_recebido
						escreva(" Informe o valor pago pelo cliente: R$")
						leia(valor_recebido)
			limpa()

						se(valor_recebido < total){
							real falta = total - valor_recebido
							escreva(" O cliente ainda deve: R$",Matematica.arredondar(falta, 2))

						} senao se(valor_recebido > total) {
							real troco = valor_recebido - total
							escreva(" Seu troco será de: R$", Matematica.arredondar(troco, 2))

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
 * @POSICAO-CURSOR = 2057; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */