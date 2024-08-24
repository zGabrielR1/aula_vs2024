// U) Faça um programa que leia dois valores numéricos e 
// exiba eles em ordem crescente se forem diferentes, 
// ou informe que eles são iguais.

programa {
	funcao inicio() {
		real numero1, numero2	
		escreva("Informe o primeiro número: ")
		leia(numero1)
		escreva("Informe o segundo número: ")
		leia(numero2)

		se (numero1 > numero2) {
			escreva(numero1 , " é maior que " , numero2)
		} senao se (numero2 > numero1) {
			escreva(numero2 , " é maior que " , numero1)
		} senao {
			escreva("O números são iguais")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 529; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */