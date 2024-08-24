programa {
	funcao inicio() {
		real notas[3][4] = {
			{8.0, 7.8, 3.0, 9.5}, 
			{4.0, 3.5, 10.0, 8.5}, 
			{9.8, 8.1, 5.8, 1.0}
		}

		para (inteiro linha = 0; linha < 3; linha++) {
			escreva("-------------------------------------\n")
			para (inteiro coluna = 0; coluna < 4; coluna++) {
				escreva(notas[linha][coluna] , "\t")
			}
			escreva("\n")
		}
		escreva("-------------------------------------")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 187; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {notas, 3, 7, 5}-{linha, 9, 16, 5}-{coluna, 11, 17, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */