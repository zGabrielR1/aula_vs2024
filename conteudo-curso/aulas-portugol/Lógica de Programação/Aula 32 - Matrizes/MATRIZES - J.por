// J) Faça um programa com uma matriz 3x3, que solicita para o usuário em qual posição 
// ele quer armazenar o nome de uma pessoa, após completar a matriz informando os 9 nomes, 
// o programa deve sortear um nome e imprimir na tela.

programa {
	inclua biblioteca Util 
	funcao inicio() {
		cadeia nomes[3][3], nome
		inteiro linha, coluna, qtd_nomes = 0
		logico preencheu_matriz = falso
		
		faca {
			// Pegar um nome
			escreva("Informe um nome: ")
			leia(nome)
			
			// Onde colocar o nome dentro da matriz?
			escreva("Informe a linha ")
			leia(linha)
			escreva("Informe a coluna ")
			leia(coluna)

			limpa()

			// Verificar se a linha e coluna informada são válidas
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)) {
				se (nomes[linha][coluna] == "") {
					nomes[linha][coluna] = nome
					qtd_nomes++
				} senao {
					escreva("A posição já está preenchida!")
				}
			} senao {
				escreva("Posição inválida. Informe novamente!\n")
			}
		} enquanto (qtd_nomes < 9)

		// Sortear um nome
		inteiro linha_sorteada = Util.sorteia(0, 2)
		inteiro coluna_sorteada = Util.sorteia(0, 2)
		escreva("O nome sorteado foi: " , nomes[linha_sorteada][coluna_sorteada])
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 782; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomes, 8, 9, 5}-{qtd_nomes, 9, 25, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */