programa{
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	
	funcao inicio(){
		
		cadeia senha
		cadeia usuario
		
		inteiro opcao 
		cadeia opcao2
		
		inteiro contador = 0
		real valor_total = 0
		
		real valor_produto
		real valor_pago
		real valor_final
		
		escreva("########## LOGIN DO SISTEMA ##########\n")
		escreva("Informe o usuario: ")
			leia(usuario)
		escreva("\nInforme a senha: ")
			leia(senha)
		limpa()

			se(usuario == "operador" e senha == "123abc_"){
				escreva("######## BEM VINDO AO SISTEMA ########")
				escreva("\n###### MENU DE OPÇÕES ######")
				escreva("\n[1] Nova Venda")
				escreva("\n[2] Sair do Sistema\n")
					leia(opcao)
				limpa()

				escolha (opcao){
					caso 1:
					faca{
						escreva("########## VENDA EM ANDAMENTO ##########\n")
						escreva("Informe o valor do produto: R$ ")
							leia(valor_produto)
limpa()
						valor_total = valor_total + valor_produto
						
						contador++
							
						escreva("Deseja incluir mais um produto na venda?")
						escreva("\n[S] Sim")
						escreva("\n[N] Não\n")
							leia(opcao2)
limpa()
							
					}enquanto(txt.caixa_alta(opcao2) == "S")
						pare
						
					caso 2:
						escreva("Saindo do Sistema...")
						pare

					caso contrario:
						escreva("Opção Invalida!")
						pare
					}

					
					escreva("####### RESUMO DA VENDA ########")
					escreva("\nQuantidade de produtos: ",contador)
					escreva("\nValor total a ser pago: R$",valor_total)
					escreva("\nInforme o valor pago pelo cliente: R$ ")
						leia(valor_pago)
					limpa()

					se(valor_pago >= valor_total){
					valor_final = valor_pago - valor_total
						escreva("O Troco do Cliente é: R$",mat.arredondar(valor_final, 2))
					}senao se(valor_pago == valor_total){
						escreva("Valor suficiente para finalizar a venda. Venda finalizada")
					}senao{	
					valor_final = valor_pago - valor_total
						escreva("O Cliente ainda deve: R$",mat.arredondar(valor_final, 2))
					}
					
				}senao
					escreva("Usuario ou Senha Inválidos!")
				
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1924; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */