// D) Faça um programa para apresentar ao usuário todos os números de 0 à 100 
// indicando ao lado de cada um deles, se o mesmo é par ou ímpar.

programa {
	funcao inicio() {
		inteiro contador = 0
		enquanto (contador <= 100) {
			se (contador % 2 == 0) {
				escreva(contador , " é PAR \n")
			} senao {
				escreva(contador , " é ÍMPAR \n")
			}
			contador = contador + 1
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 385; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */