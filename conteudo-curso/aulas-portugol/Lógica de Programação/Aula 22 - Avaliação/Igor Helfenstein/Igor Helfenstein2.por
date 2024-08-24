programa {
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio() {

		cadeia login
		cadeia senha
		inteiro opcao1
		cadeia opcao2 = "s"
		inteiro i = 1
		real valor
		real total = 0
		real pago
		
		escreva("###### LOGIN DO SISTEMA ###### \nInforme o usuário: ")
		leia(login)

		escreva("Informe a senha: ")
		leia(senha)

		limpa()

		se(login == "operador" e senha == "123abc") {
			escreva("###### BEM VINDO AO SISTEMA ###### \n###### MENU DE OPÇÕES ######\n[1] Nova Venda\n[2] Sair do Sistema\n")
			leia(opcao1)
			limpa()

			
			escolha (opcao1) {
				
				caso 1 : 
	
					enquanto(opcao2 == "s" ou opcao2 == "sim") {
						
						escreva("###### VENDA EM ANDAMENTO ###### \nInforme o valor do produto: R$")
						leia(valor)
						limpa()
	
						total = total + valor
	
						total = Matematica.arredondar(total, 2)
						
						escreva("###### Deseja incluir mais um produto na venda? ###### \n[S] Sim\n[N] Não\n")
						leia(opcao2)
						opcao2 = Texto.caixa_baixa(opcao2)
						limpa()
						
						se(opcao2 == "s" ou opcao2 == "sim") {
						i++
						}	
					} 
					
					escreva("###### RESUMO DA VENDA ###### \nQuantidade de Produtos: ",i,"\nValor Total a ser Pago: R$",total,"\nInforme o valor Pago pelo Cliente: R$")
					leia(pago)
					limpa()
	
					se(pago > total) {
						pago = pago - total
						pago = Matematica.arredondar(pago, 2)
						escreva("O troco do cliente é: R$",pago)
						pare
						
					} senao se(pago < total) {
						pago = total - pago
						pago = Matematica.arredondar(pago, 2)
						escreva("O Cliente ainde deve: R$",pago)
						pare
						
					} senao 
						pago = Matematica.arredondar(pago, 2)
						escreva("Valor suficiente para finalizar a venda. Venda Finalizada.")
						pare
					
				caso 2 :
				
					escreva("Saindo do Sistema...\n")
					pare
	
				caso contrario : 
				
					escreva("Opção inválida!\n")
					pare
				
			}
		} senao escreva("Usuário ou Senha Inválidos\n")
	}	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 576; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 11, 10, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */