programa {
	funcao inicio() {
		cadeia fila_clientes[6], nome
		inteiro opcao, inicio_fila = 0, fim_fila = 0, idade
		faca {
			escreva("######## MENU ########\n")
			escreva("[1] Inserir Cliente na Fila\n")
			escreva("[2] Atender Próximo Cliente\n")
			escreva("[3] Visualizar Fila\n")
			escreva("[4] Encerrar o Programa\n")
			leia(opcao)
			limpa()
			escolha (opcao) {
				caso 1:
					// Algoritmo para inserir cliente na fila
					se (fim_fila == 6) {
						escreva("Fila cheia, não é possível incluir mais clientes!\n")
					} senao {
						escreva("Informe o nome do cliente que será adicionado à fila: ")
						leia(nome)
						escreva("Informe a idade do cliente: ")
						leia(idade)

						se (idade > 60) {
							para (inteiro i = fim_fila; i > 0; i--) {
								fila_clientes[i] = fila_clientes[i - 1]
							}
							fila_clientes[inicio_fila] = nome
						} senao {
							fila_clientes[fim_fila] = nome
						}
						fim_fila++
						limpa()
					}
					pare
				caso 2:
					// Algoritmo para atender próximo da fila
					se (fim_fila == 0) {
						escreva("Fila vazia, não existe nenhum cliente para ser atendido!\n")
					} senao {
						escreva("O próximo cliente a ser atentido é " , fila_clientes[inicio_fila] , "\n")
						para (inteiro i = 0; i < 5; i++) {
							fila_clientes[i] = fila_clientes[i + 1]
						}
						fim_fila--
						fila_clientes[fim_fila] = ""
					}
					pare
				caso 3:
					// Algoritmo para imprimir a fila
					escreva("Visualização da Fila\n")
					escreva("----------------------------------------\n")
					para (inteiro i = 0; i < fim_fila; i++) {
						escreva(fila_clientes[i] , "\t")
					}
					escreva("\n----------------------------------------\n")
					pare
				caso 4:
					escreva("Encerrando o programa...")
					pare
				caso contrario:
					escreva("Opção inválida!\n")
			}
		} enquanto (opcao != 4)
	}
}





/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 930; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {fila_clientes, 3, 9, 13}-{opcao, 4, 10, 5}-{fim_fila, 4, 34, 8}-{i, 42, 20, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */