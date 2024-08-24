// B) Faça um programa que armazena os seguinte valores (4, 7, 2, 9, 13, 5, 8, 1, 12, 11) 
// em um vetor e depois verifica e informa para o usuário qual é o maior valor deste vetor 
// e a sua posição dentro dele.

programa {
	funcao inicio() {
		inteiro valores[10] = { 4, 7, 2, 9, 13, 5, 8, 1, 12, 11 }, maior_valor = 0, posicao = 0
		para (inteiro i = 0; i < 10; i++) {
			se (valores[i] > maior_valor) {
				maior_valor = valores[i]
				posicao = i
			}
		}
		escreva("O Maior valor do vetor é " , maior_valor , " e a sua posição é " , posicao)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 335; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */