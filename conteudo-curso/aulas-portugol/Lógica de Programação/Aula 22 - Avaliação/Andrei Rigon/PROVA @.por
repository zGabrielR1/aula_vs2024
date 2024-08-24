programa {
	inclua biblioteca Matematica	
	inclua biblioteca Texto
	funcao inicio() 
{
		cadeia operador
		escreva("######### LOGIN DO SISTEMA ######### \n")
		escreva("Informe o Úsuario: ")
		leia(operador)

		cadeia senha
		escreva("Informe a Senha: ")
		leia(senha)

		limpa()

		real i = 1.0
		cadeia Nao  = ""
		inteiro opcao 
		cadeia opcao_s = "S" 
		real valor = 0.0
		real qtde = 0.0
		real valorf = 0.0
		real valorfinal = 0.0
		real valor_cliente = 0.0
		
		
		
		se (operador == "1" e senha == "1" ) { 

				
				escreva("### BEM VINDO AO SISTEMA ###\n")
				escreva("[1] Nova Venda \n")
				escreva("[2] Sair do Sistema\n")
				leia(opcao)
				limpa()

				se(opcao == 1) {
					
				
				

				escolha(opcao) {
					caso 1 :
						enquanto (opcao_s == "S" ) {
							escreva("######### VENDA EM ANDAMENTO #########\n") 
							escreva("Informe o valor do produto: R$")
							leia(valor)
							
							valorfinal = valorfinal + valor
							qtde++
							limpa()
						
							escreva("######### Deseja incluir mais um produto na venda? #########\n")
							escreva("[S] Sim \n")	
							escreva("[N] Não \n")	
							leia(opcao_s) 
							limpa() 
							opcao_s = Texto.caixa_alta(opcao_s)
							

					se (opcao_s == "S") {
					i++
					}

					} 

					se(opcao_s == "N"){
						
							escreva("######### RESUMO DE VENDA #########\n")
							escreva("Quantidade de Produtos: " , qtde)
								Matematica.arredondar(qtde, 2)
							escreva("\nValor Total a ser pago: " , valorfinal)
								Matematica.arredondar(valorfinal, 2)
							escreva("\nInforme o valor Pago pelo cliente: R$ ")
							leia(valor_cliente)
						
					} 
					
					
					real valorfcliente
					 
					real deve
					valorfcliente =  valorfinal -valor_cliente
					real troco 
					
					
					se (valor_cliente < valorfinal){
						
						valorfcliente = Matematica.arredondar(valorfcliente, 2)
						escreva("O Cliente deve: " , valorfcliente) 
					} senao se (valor_cliente > valorfinal) {
						troco = valor_cliente - valorfinal
						troco = Matematica.arredondar(troco, 2)
						escreva("O troco do Cliente é: " , troco) 
					} senao {
						escreva("Valor suficiente para finalizar a compra")
					}
					pare 
					
					caso 2 :
					
					escreva("Saindo do Sistema...")

					pare

					caso contrario : 
					escreva("Opção invalida")
					
					} 
					
					
				} senao se (opcao == 2) {
					
					escreva("\nSaindo do Sistema... ")
				} senao {
					escreva("Operação Invalida")
				}


				 
				} senao {
					escreva("Usuario ou Senha incorreto")
				}
				}
	}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2581; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */