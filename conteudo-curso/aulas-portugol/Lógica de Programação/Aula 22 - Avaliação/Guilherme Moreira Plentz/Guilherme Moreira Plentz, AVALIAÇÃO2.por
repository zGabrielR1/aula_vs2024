programa {
	inclua biblioteca Matematica
	inclua biblioteca Texto

	const cadeia nome_usuario = "operador"
	const cadeia senha_usuario = "123abc"
	
	funcao inicio() {

		cadeia contador = "s"

		inteiro qnt_prod = 1

		real valor_total = 0

		real pgto_cliente
		real troco
		real falta
		
		escreva ("###### LOGIN DO SISTEMA ###### \n")

	
		cadeia usuario
		escreva ("Informe o Usuário: ")
		leia (usuario)
		
		cadeia senha
		escreva ("Informe a senha: ")
		leia (senha)

		limpa()

		se (usuario == nome_usuario e senha == senha_usuario) {
			limpa ()
			escreva ("###### BEM-VINDO AO SISTEMA ######\n")
			escreva ("######  MENU DE OPÇÕES ######\n")

			inteiro opcao
			escreva ("[1] Nova Venda \n")
			escreva ("[2] Sair no Sistema \n")
			leia (opcao)

			limpa()

			escolha (opcao) {
				caso 1:
					enquanto (contador == "s") {
						escreva ("######  VENDA EM ANDAMENTO ######\n")
						real valor_produto
						escreva ("Informe o valor do produto: R$ ")
						leia (valor_produto)
						valor_total = valor_total + valor_produto
						
						limpa()
						
						escreva ("######  DESEJA INCLUIR MAIS UM PRODUTO NA VENDA? ######\n")
						escreva ("[s] Sim \n")
						escreva ("[n] Não \n")
						contador = Texto.caixa_baixa(contador)
						leia (contador)
						limpa()

						se (contador == "s") {
							qnt_prod = qnt_prod + 1
						}
					}
					escreva ("Quantidade de produtos: ", qnt_prod, "\n")
					escreva ("Valor total a ser pago: R$ ", Matematica.arredondar(valor_total, 2), "\n")
					escreva ("Informe o valor Pago pelo cliente: R$ ")
					leia (pgto_cliente)
					limpa()
	
					se (pgto_cliente < valor_total) {
						falta = valor_total - pgto_cliente
						escreva ("O Cliente ainda deve: R$ ", Matematica.arredondar(falta, 2))
					} senao se (pgto_cliente > valor_total) {
						troco = pgto_cliente - valor_total
						escreva ("O Troco do Cliente é: R$ ", Matematica.arredondar(troco, 2))
					} senao {
						escreva ("Valor suficiente para finalizar a venda! Venda finalizada.")
					}
				pare
				caso 2: 
					escreva ("Saindo do sistema...")
				pare
				caso contrario:
					escreva ("Opção Inválida!")
			}
			
		} senao {
			escreva ("Usuário ou senha inválidos!")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1195; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */