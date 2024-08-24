programa
{
	inclua biblioteca Matematica
	
	funcao inicio()
	{
	
		real p, t, troco, trocof
		inteiro op, qt=1, op2=0
		cadeia lo, sen 
		caracter simnao

		
		escreva("######### LOGIN DO SISTEMA #########\n\nLogin: ")
		leia(lo)
		escreva("Senha: ")
		leia(sen)

		limpa()

		se(lo == "operador" e sen  == "123abc"){

			escreva("######### BEM VINDO AO SISTEMA #########\n#########    MENU DE OPÇÕES    #########\n\n[1] Nova venda\n[2] Sair do sistema\n\n")
			leia(op)

			limpa()
				
			se (op == 1){
	
				limpa()
				
				escreva("######### VENDA EM ANDAMENTO #########\n\nInforme o valor do produto: R$")
				leia(p)

				limpa()

				escreva("######### Deseja incluir mais um produto na venda? #########\n\n[S] Sim\n[N] Não\n\n")
				leia(simnao)

				limpa()
	
				t=p

				se(simnao == 'S' ou simnao == 's'){
					
					op2 = 1
					
				}senao se(simnao == 'N' ou simnao == 'n'){

					op2 = 2
					
				}senao{

					escreva("Opção invalida")
					
				}

				
				escolha(op2){
	
					caso 1:
		
						faca{
	
							limpa()
								
							escreva("######### VENDA EM ANDAMENTO #########\n\nInforme o valor do produto: R$")
							leia(p)
									
							limpa()
	
							qt++
							t = t + p
								
		
							escreva("######### Deseja incluir mais um produto na venda? #########\n\n[S] Sim\n[N] Não\n\n")
							leia(simnao)
		
							limpa()
	
							se(simnao == 'S' ou simnao == 's'){
						
								op2 = 1
					
							}senao se(simnao == 'N' ou simnao == 'n'){
	
								op2 = 2
						
							}senao{
	
								escreva("Opção invalida")
						
							}
									
									
						}enquanto(op2 == 1)
		
					caso 2:
		
						escreva("######### RESUMO DA VENDA #########\n\nQuantidade de produtos: ",qt,"\nValor a ser pago: R$",Matematica.arredondar(t,2),"\n\nValor pago pelo cliente: R$")
						leia(troco)
	
						limpa()
	
						se(troco > t){
	
							escreva("Troco a devolver ao cliente: R$",Matematica.arredondar((troco - t), 2),"\n\n\n\n\n\n\n")
								
						}senao se(troco < t){
	
							escreva("Cliente ainda deve: R$",Matematica.arredondar((t - troco),2),"\n\n\n\n\n\n\n")
								
						}senao{
	
							escreva("######### Valor suficiente #########\n\n Encerrando venda\n\n\n\n\n")
								
						}	
	
				}
				
			}senao se(op == 2){
		
				escreva("Saindo do sistema\n\n\n\n\n\n\n")
						
						
			}senao{
	
				escreva("Opção invalida\n\n\n\n\n\n\n")
						
			}
				
		}senao{

			escreva("Senha ou login invalidos\n\n\n\n\n\n\n")
			
		}
		
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1577; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */