programa {
	inclua biblioteca Texto
	funcao inicio() {
		cadeia pilha_noticias[5]
		inteiro opcao, topo = 0
		logico validou
		faca {
			escreva("######## MENU ########\n")
			escreva("[1] Cadastrar Nova Notícia\n")
			escreva("[2] Visualizar Última Notícia\n")
			escreva("[3] Remover Notícia\n")
			escreva("[4] Visualizar Todas Notícias\n")
			escreva("[5] Encerrar o Programa\n")
			leia(opcao)
			limpa()
			escolha (opcao) {
				caso 1:
					// Algoritmo para cadastrar nova notícias
					se (topo < 5) {
						faca {
							cadeia noticia
							escreva("Digite a notícia (no máximo 10 caracteres): ")
							leia(noticia)
							limpa()
							se (noticia != "" e Texto.numero_caracteres(noticia) <= 10) {
								validou = verdadeiro
								pilha_noticias[topo] = noticia
								topo++
								escreva("Notícia cadastrada com sucesso!\n")
							} senao {
								validou = falso
								escreva("A notícia excedeu o limite de caracteres!\n")
							}
						} enquanto (nao validou)
					} senao {
						escreva("A pilha de notícias está cheia!\n")
					}
					pare
				caso 2:
					// Algoritmo visualizar a última notícia
					escreva("Última notícia cadastrada: " , pilha_noticias[topo - 1] , "\n")
					pare
				caso 3:
					// Algoritmo para remover notícia
					se (topo > 0) {
						pilha_noticias[topo - 1] = ""
						topo--
						escreva("A última notícia foi removida da pilha!\n")
					} senao {
						escreva("A pilha está vázia. Não é possível remover a última notícia!")
					}
					pare
				caso 4:
					// Algoritmo para visualizar todas as notícias
					para (inteiro i = topo - 1; i >= 0; i--) {
						escreva(pilha_noticias[i] , "\n")
					}
					pare
				caso 5:
					escreva("Encerrando o programa...")
					pare
				caso contrario:
					escreva("Opção inválida!\n")
			}
		} enquanto (opcao != 5)
	}
}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1730; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {pilha_noticias, 4, 9, 14}-{topo, 5, 17, 4}-{validou, 6, 9, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */