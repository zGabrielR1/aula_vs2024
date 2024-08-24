programa {
	
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio() {
		
		inteiro contador = 1
		real pagamento, troco, deve
		real valorTotal = 0
		cadeia simNao = ""
		real valorProduto
		cadeia usuario, senha
		cadeia usuarioPadrao = "operador"
		cadeia senhaPadrao = "123abc"
		inteiro opcao
		
		escreva("######### LOGIN DO SISTEMA #########\n")
		escreva("Informe o Usuário: ")
		leia(usuario)
		escreva("Informe a Senha: ")
		leia(senha)
		limpa()

		se (usuario == usuarioPadrao e senha == senhaPadrao) {
			escreva("######### BEM VINDO AO SISTEMA #########\n")
			escreva("#########    MENU DE OPÇÕES    #########\n")
			escreva("[1] Nova Venda\n")
			escreva("[2] Sair do Sistema\n")
			leia(opcao)
			limpa()
			escolha(opcao) {
				caso 1:
					escreva("######### VENDA EM ANDAMENTO #########\n")
					escreva("Informe o valor do produto: R$ ")
					leia(valorProduto)
					limpa()
					escreva("######### Deseja incluir mais um produto na venda? #########\n")
					escreva("[S] Sim\n")
					escreva("[N] Não\n")
					leia(simNao)
					simNao = Texto.caixa_alta(simNao)
					limpa()
					valorTotal = valorProduto

					se (simNao == "N") {
							escreva("######### RESUMO DA VENDA #########\n") 
							escreva("Quantidade de Produtos: ", contador , "\n")
							escreva("Valor Total a ser Pago: R$", valorTotal)
							escreva("\nInforme o valor Pago pelo Cliente: ") 
							leia(pagamento)
							limpa()

							se (pagamento == valorTotal) {
								escreva("Valor suficiente para finalizar a venda. Venda Finalizada.")
							} senao se (pagamento < valorTotal) {
								deve = valorTotal - pagamento
								escreva("O Cliente ainda deve: R$", Matematica.arredondar(deve, 2))
							} senao se (pagamento > valorProduto) {
								troco = pagamento - valorTotal
								escreva("O Troco do Cliente é: R$", Matematica.arredondar(troco, 2))
							} senao {
								}
					}
					
					enquanto (simNao == "S") {
						escreva("######### VENDA EM ANDAMENTO #########\n")
						escreva("Informe o valor do produto: R$ ")
						leia(valorProduto)
						limpa()
						escreva("######### Deseja incluir mais um produto na venda? #########\n")
						escreva("[S] Sim\n")
						escreva("[N] Não\n")
						leia(simNao)
						limpa()

						contador++
						valorTotal = valorTotal + valorProduto
						simNao = Texto.caixa_alta(simNao)

						se (simNao == "N") {
							escreva("######### RESUMO DA VENDA #########\n") 
							escreva("Quantidade de Produtos: ", contador , "\n")
							escreva("Valor Total a ser Pago: R$", valorTotal)
							escreva("\nInforme o valor Pago pelo Cliente: ") 
							leia(pagamento)
							limpa()

							se (pagamento == valorTotal) {
								escreva("Valor suficiente para finalizar a venda. Venda Finalizada.")
							} senao se (pagamento < valorTotal) {
								deve = valorTotal - pagamento
								escreva("O Cliente ainda deve: R$", Matematica.arredondar(deve, 2))
							} senao se (pagamento > valorProduto) {
								troco = pagamento - valorTotal
								escreva("O Troco do Cliente é: R$", Matematica.arredondar(troco, 2))
							} senao {
								}
						}
					}
					
				pare
				caso 2: 
					escreva("Saindo do sistema...\n")
				pare
			caso contrario:
					escreva("Opção Inválida!\n")
			}
			
		} senao {
			escreva("Usuário ou Senha Inválidos")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 91; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */