// N) Faça um programa que armazena os seguinte valores (4, 7, 2, 9, 13, 5, 8, 1, 12, 11) em um vetor A, 
// e os seguintes valores (5, 8, 1, 3, 4, 6, 2, 9, 7, 2) em outro vetor B, 
// multiplique o valor de cada posição do primeiro vetor A pelo valor da posição correspondente no outro vetor B, 
// e armazene o resultado em um terceiro vetor C. No final imprima os resultados na tela.

programa {
	funcao inicio() {
		inteiro a[10] = { 4, 7, 2, 9, 13, 5, 8, 1, 12, 11 }
		inteiro b[10] = { 5, 8, 1, 3, 4, 6, 2, 9, 7, 2 }
		inteiro c[10]

		para (inteiro i = 0; i < 10; i++) {
			c[i] = a[i] * b[i]
		}

		para (inteiro i = 0; i < 10; i++) {
			escreva(c[i] , " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 603; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */