// V) Faça um algoritmo que dado três valores numéricos A, B, e C 
// verifica se eles formam um triângulo.
// Formando um triângulo, exibe na tela se ele é equilátero, isósceles ou escaleno.

programa {
	funcao inicio() {
		real a, b, c
		escreva("informe o valor de A: ")
		leia(a)
		escreva("informe o valor de B: ")
		leia(b)
		escreva("informe o valor de C: ")
		leia(c)
		
		se ((a < b + c) e (b < a + c) e (c < a + b)) {
			se ((a == b) e (b == c) e (c == a)) {
				escreva("Triângulo equilatero")
			} senao se ((a != b) e (b != c) e (a != c)) {
				escreva("Triângulo escaleno")
			} senao {
				escreva("Triângulo isóceles")
			}
		} senao {
			escreva("A medidas não formam um triângulo")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 600; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */