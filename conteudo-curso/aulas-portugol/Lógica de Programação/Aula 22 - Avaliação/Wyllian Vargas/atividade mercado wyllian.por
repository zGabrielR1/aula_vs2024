programa {
	inclua biblioteca Matematica
	funcao inicio() {
		cadeia usuario
		cadeia senha
		
		escreva("######### LOGIN DO SISTEMA #########\n")
		escreva("Informe o Usuário: ")
		leia(usuario)
		escreva("Informe a Senha: ")
		leia(senha)

		limpa()
		
		se (usuario == "operador" e senha == "123abc"){
			escreva("######### BEM VINDO AO SISTEMA #########")
			escreva("\n######### MENU DE OPÇÕES #########")
			escreva("\n[1] Nova Venda")
			escreva("\n[2] Sair do Sistema\n")
			
			inteiro menu
			leia(menu)

			limpa()
			
			escolha(menu){
				caso 1:
					real valor_produto
					real valor_total = 0
					real valor_pago
					inteiro qnt_produtos = 1

					cadeia incluir = "S"
					enquanto(incluir == "S"){
						escreva("######### VENDA EM ANDAMENTO #########")
						escreva("\nInforme o valor do produto: R$ ")
						leia(valor_produto)
	
						valor_total = valor_total + valor_produto
		
						limpa()
		
						escreva("######### Deseja incluir mais um produto na venda? #########")
						escreva("\n[S] Sim")
						escreva("\n[N] Não\n")
						leia(incluir)
						
						se(incluir == "S"){
							qnt_produtos++
						}
						
						limpa()
							
					}
		
					escreva("######### RESUMO DA VENDA #########")
					escreva("\nQuantidade de produtos: ", qnt_produtos)
					escreva("\nValor total a ser pago: R$ ",  Matematica.arredondar(valor_total, 2))
					escreva("\nInforme o valor pago pelo cliente: R$ ")
					leia(valor_pago)

					limpa()
		
					se(valor_pago < valor_total){
						real valor_faltando
						valor_faltando = valor_total - valor_pago
						escreva("O cliente ainda deve: R$ ",  Matematica.arredondar(valor_faltando, 2))
					} senao se(valor_pago > valor_total) {
						real valor_sobrando
						valor_sobrando = valor_pago - valor_total
						escreva("O Troco do cliente é de: R$ ",  Matematica.arredondar(valor_sobrando, 2))
					} senao {
						escreva("Valor suficiente para finalizar a venda. Venda Finalizada.")
					}
					pare
				caso 2:
					escreva("Saindo do sistema...")
					pare
				caso contrario:
					escreva("Opção Inválida!")
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
 * @POSICAO-CURSOR = 2156; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */