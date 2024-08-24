// L) Faça um programa para pegar dois valores e informar qual é o maior deles. 
// Caso sejam iguais informar que são iguais.

programa {
	funcao inicio() {
		real numero1, numero2
		escreva("Infrome o primeiro número: ")
		leia(numero1)
		escreva("Informe o segundo número: ")
		leia(numero2)
		
		se (numero1 > numero2) {
			escreva(numero1 , " é maior que " , numero2)
		} senao se (numero2 > numero1) {
			escreva(numero2 , " é maior que " , numero1)
		} senao {
			escreva(numero1 , " é igual a " , numero2)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 520; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */