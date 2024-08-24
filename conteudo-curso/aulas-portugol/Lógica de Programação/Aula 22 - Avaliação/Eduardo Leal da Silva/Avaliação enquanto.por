programa

{	inclua biblioteca Matematica
	
	funcao inicio()
	{
		escreva("######### LOGIN DO SISTEMA #########\n")
		cadeia us
		escreva("Informe o Usuário:\n")
		leia(us)
		cadeia sen
		escreva("Informe a Senha:")
		leia(sen)
		
		limpa()
		
		se(us != "operador" e  sen != "123abc"){
			escreva("Usuário ou Senha inválios")
		}
		senao{
			escreva("######### BEM VINDO AO SISTEMA #########\n")
		
			escreva("######### MENU PRINCIPAL #########\n")
			inteiro emp
			escreva("[1] Nova Venda \n[2] Sair do sistema\n")
			leia(emp)
			limpa()
			escolha(emp){

				caso 1:
					escreva("Saindo do sitema")
				pare
				caso 2:
					escreva("######### VENDA EM ANDAMENTO #########\n")
					real valor
					
					cadeia continuar
					real acumulador = 0
					inteiro acumuladorp = 1
					
					faca{
						escreva("Qual o valor do produto: R$")
						leia(valor)
						acumulador = acumulador + valor
						escreva("##### Deseja incluir mais um produto #####\n[S] Sim\n[N] Nao\n")
						leia(continuar)
						se(continuar == "S"){
							acumuladorp++
						}
					}enquanto(continuar=="S")
					limpa()
					
					real pag
					escreva("########## RESUMO DA VENDA #########\nTotal de produtos adquiridos: ",acumuladorp,"\nValor total da conta:", Matematica.arredondar(acumulador, 2)  ,"R$\nValor pago pelo cliente: ")
					leia(pag)
					real sobra = pag - acumulador
					limpa()
					se(sobra == 0){
						escreva("Valor suficiente para finalizar a venda. Venda finalizada.")
					}
					senao se(sobra<0){
						escreva("Valor insuficiente para finalizar a venda. O cliente deve ",sobra*-1,"R$")
					}
					senao{
						escreva(" O troco do cliente sera de: ",sobra,"R$")
				
					}
				pare
				}
			
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1062; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */