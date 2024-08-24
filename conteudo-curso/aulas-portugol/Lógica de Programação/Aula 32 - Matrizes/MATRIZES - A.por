// A) Faça um programa que solicite 6 números inteiros e armazene estes números dentro de uma matriz 2x3, 
// em seguida solicite mais 6 números inteiro e armaze estes números em outra matriza 2x3. 
// Após armazenar os valores o programa deverá multiplicar os números da primeira matriz pelos 
// numeros da segunda matriz, conforme o indíce correspondente de cada posição, 
// e armazenar o resultado em uma terceira matriz 2x3.

programa {
	funcao inicio() {
		inteiro matriz_A[2][3], matriz_B[2][3], matriz_C[2][3]

		// Preenchendo a primeira matriz (A)
		para (inteiro i = 0; i < 2; i++) {
			para (inteiro j = 0; j < 3; j++) {
				escreva("Informe um valor inteiro: ")
				leia(matriz_A[i][j])
			}
		}

		// Preenchendo a segunda matriz (B)
		para (inteiro i = 0; i < 2; i++) {
			para (inteiro j = 0; j < 3; j++) {
				escreva("Informe um valor inteiro: ")
				leia(matriz_B[i][j])
			}
		}

		// Multiplicando e armazenando o resultado na terceira matriz (C)
		para (inteiro i = 0; i < 2; i++) {
			para (inteiro j = 0; j < 3; j++) {
				matriz_C[i][j] = matriz_A[i][j] * matriz_B[i][j]
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 907; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */