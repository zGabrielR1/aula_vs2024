programa {

     inclua biblioteca Matematica
	
	funcao inicio() {
		escreva("#### LOGIN DO SISTEMA #### \n")
		cadeia usuario
		escreva("Informe o Usuário: ")
		leia(usuario)
		cadeia senha
		escreva("Informe a Senha: ")
		leia(senha)

		se(usuario == "Operador" e senha == "123abc"){
			   escreva("Usuário ou Senha inválios")
			limpa()
			escreva("#### BEM VINDO #### \n")
			
			escreva("#### Menu de Opções #### \n")

			inteiro opcao
			escreva("[1] Nova Venda \n")
	          escreva("[2] Sair do Sistema \n")
               leia(opcao)

               
			limpa()

               escolha(opcao){

				caso 1:
					escreva("Saindo do sitema")
				pare
				caso 2:
					escreva("######### VENDA EM ANDAMENTO #########\n")
					real v
					
					cadeia prossiga
					real acumulador = 0
					inteiro acumulador2 = 1
					
					faca{
						escreva("Qual o valor do produto: R$")
						leia(v)
						acumulador = acumulador + v
						escreva("##### Deseja incluir mais um produto #####")
						escreva("[S] Sim \n")
						escreva("[N] Não \n")
						leia(prossiga)
						se(prossiga == "S"){
							acumulador2++

							
						}
					}enquanto(prossiga =="S")
					
					limpa()
					
					real pago
					escreva("########## RESUMO DA VENDA #########\nTotal de produtos adquiridos: ", acumulador2 , "\nValor total da conta: " ,  Matematica.arredondar(acumulador, 2)   , "R$\nValor pago pelo cliente: ")
					leia(pago)
					real restante = pago - acumulador
					limpa()
					
					se(restante == 0){
						escreva("Valor suficiente para finalizar a venda. Venda finalizada.")
						
					}
					senao se( restante <0){
						escreva("Valor insuficiente para finalizar a venda. O cliente deve ",  restante*-1   ,"R$")
						
					}
					senao{
						escreva(" O troco do cliente sera de: ",   restante    ,"R$")
				
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
 * @POSICAO-CURSOR = 484; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */