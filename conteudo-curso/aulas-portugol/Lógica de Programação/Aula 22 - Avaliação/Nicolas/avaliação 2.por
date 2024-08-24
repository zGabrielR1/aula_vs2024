programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Matematica --> mat
	funcao inicio()
	{
		cadeia senha, usuario, opc2
		inteiro opc, contador = 0
		real valor_p, valor_total = 0, valor_pg, valor_f
		
		escreva("### LOGIN DO SISTEMA ###")
		escreva("\nInforme o Usuario: ")
		leia(usuario)
		escreva("\nInforme a senha: ")
		leia(senha)
		limpa()

			se(usuario == "operador" e senha == "123abc_"){
				escreva("### BEM VINDO AO SISTEMA ###")
				escreva("\n### MENU DE OPÇÕES ###")
				escreva("\n[1] Nova venda")
				escreva("\n[2] Finalizar sistema\n")
				leia(opc)
				limpa()

				escolha (opc){
					caso 1:
						faca{
							escreva("### VENDA EM ANDAMENTO ###\n")
							escreva("informe o valor do produto R$ ")
							leia(valor_p)
							limpa()
							valor_total = valor_total + valor_p
							contador++
							
							escreva("DESEJA INCLUIR MAIS PRODUTOS?")
							escreva("\n[S] Sim")
							escreva("\n[N] Não\n")
							leia(opc2)
							limpa()
							
						}enquanto(txt.caixa_alta(opc2) == "S")
						pare
					caso 2:
						escreva("Finalizando Sistema")
						pare
					caso contrario:
						escreva("Opção Invalida")
						pare
				}
					escreva("### RESUMO DA VENDA ###")
					escreva("\nQuantidade de produto: ",contador)
					escreva("\nValor total a ser pago: R$",valor_total)
					escreva("\nInforme o valor pago pelo cliente: R$ ")
					leia(valor_pg)
					limpa()

					se(valor_pg >= valor_total){
						valor_f = valor_pg - valor_total
						escreva("o deve receber R$",mat.arredondar(valor_f, 2)," de troco")
					}senao se(valor_pg == valor_total){
						escreva("Valor suficiente para finalizar a venda. Venda finalizada")
					}senao{	
						valor_f = valor_pg - valor_total
						escreva("o cliente deve R$",mat.arredondar(valor_f, 2))
					}
					
				
			}senao
				escreva("Usuario ou senha invalidos")
				
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1809; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */