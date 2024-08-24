programa {
	funcao inicio() {
		cadeia cadeiras[5][4] = { 
								{"", "", "", ""}, 
								{"", "", "", ""}, 
								{"", "", "", ""}, 
								{"", "", "", ""}, 
								{"", "", "", ""} 
							}
		cadeia nome
		inteiro opcao, linha, coluna
		faca {
			escreva("######### MENU #########\n")
			escreva("[1] Reservar Cadeira\n")
			escreva("[2] Remover Reserva\n")
			escreva("[3] Visualizar Reservas\n")
			escreva("[4] Encerrar o Programa\n")
			leia(opcao)

			limpa()

			escolha (opcao) {
				caso 1:
					escreva("Informe o nome do cliente: ")
					leia(nome)
					escreva("Informe a fila desejada (1 à 5): ")
					leia(linha)
					escreva("Informe o nº da poltrona (1 à 4): ")
					leia(coluna)

					limpa()
					
					se (cadeiras[linha-1][coluna-1] == "") {
						cadeiras[linha-1][coluna-1] = nome
						escreva("Poltrona reservada com sucesso!\n")
					} senao {
						escreva("Esta poltrona já está reservada!\n")
					}

					pare
				caso 2:
					escreva("Informe a fila desejada (1 à 5): ")
					leia(linha)
					escreva("Informe o nº da poltrona (1 à 4): ")
					leia(coluna)

					limpa()
					
					se (cadeiras[linha-1][coluna-1] == "") {
						escreva("Esta poltrona não possui reserva!\n")
					} senao {
						cadeiras[linha-1][coluna-1] = ""
						escreva("Poltrona liberada com sucesso!\n")
					}
				
					pare
				caso 3:
					escreva("\t 1      2      3      4\n")
					para (linha = 0; linha < 5; linha++) {
						escreva("\t  _______________________\n")
						escreva("Fileira " , linha+1 , "|")
						para (coluna = 0; coluna < 4; coluna++) {
							se (cadeiras[linha][coluna] == "") {
								escreva("Vazio", "|")
							} senao {
								escreva(cadeiras[linha][coluna] , "|")
							}
						}
						escreva("\n")
					}
					escreva("\t  _______________________\n")
					pare
				caso 4:
					escreva("Encerrando o programa...") 
					pare
				caso contrario:
					escreva("Opção inválida! Tente novamente.\n")
			}
		} enquanto (opcao != 4)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {cadeiras, 3, 9, 8}-{linha, 11, 17, 5}-{coluna, 11, 24, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */