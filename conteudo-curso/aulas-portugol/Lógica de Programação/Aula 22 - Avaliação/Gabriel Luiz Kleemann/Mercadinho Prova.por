programa {
	inclua biblioteca Matematica --> M
	inclua biblioteca Texto --> T
	funcao inicio() {

	cadeia user, senha
		escreva("######## LOGIN DO SISTEMA ########\nInforme o Usuário: ")	leia(user)
		escreva("Informe a senha: ")									leia(senha)
		limpa()
	
		se(user == "operador" e senha == "123abc"){

			inteiro opcao
			escreva("######### BEM VINDO AO SISTEMA #########\n#########    MENU DE OPÇÕES    #########\n[1] Nova Venda\n[2] Sair do Sistema\n")
				leia(opcao)
			limpa()

			escolha(opcao){
				
				caso 1:
					
						cadeia simnao = ""
						real valor_produto, valor_total = 0
						inteiro qtd_produtos = 0
						
						faca{
							escreva("######### VENDA EM ANDAMENTO #########\nInforme o valor do produto: R$")
								leia(valor_produto)
								valor_total += valor_produto
								qtd_produtos++
								
								limpa()
				
							escreva("#########    Deseja incluir mais um produto na venda?    #########\n[S] Sim\n[N] Não\n")
								leia(simnao)
								simnao = T.caixa_baixa(simnao)
								
								limpa()
								
						}enquanto(simnao == "s")
						
							escreva("#########    RESUMO DA VENDA    #########\nQuantidade de produtos:  ", qtd_produtos )
							escreva("\nValor Total a ser Pago: R$", valor_total)
							
							real valor_pago
							escreva("\nInforme o valor Pago pelo cliente: R$")
								leia(valor_pago)
								limpa()
		
							real troco_ou_deve	
							
								se(valor_pago < valor_total){
									troco_ou_deve = M.arredondar(valor_total - valor_pago, 2)
									escreva("O cliente ainda deve: R$", troco_ou_deve)
								
								}senao se(valor_pago > valor_total){
									troco_ou_deve = M.arredondar(valor_pago - valor_total, 2)
									escreva("O troco do cliente é: R$", troco_ou_deve)
								
								}senao{
									escreva("Valor suficiente para finalizar a venda. Venda Finalizada")								
								}
						pare
				
				caso 2:
					
						escreva("Saindo do sistema...")
						pare
			
			}
			se(opcao != 1 e opcao !=2){
				escreva("Opção Inválida")
			}
		}senao{
			escreva("Usuário ou Senha Inválidos")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 303; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */