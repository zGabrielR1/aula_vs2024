// E) Faça um programa que armazena os seguinte valores (4, 7, 2, 9, 13, 5, 8, 1, 12, 11) 
// em um vetor e depois imprime na tela esses 10 números na ordem inversa.

programa {
	funcao inicio() {
		inteiro valores[10] = { 4, 7, 2, 9, 13, 5, 8, 1, 12, 11 }
		para (inteiro i = 9; i >= 0; i--) {
			escreva(valores[i] , " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 256; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */