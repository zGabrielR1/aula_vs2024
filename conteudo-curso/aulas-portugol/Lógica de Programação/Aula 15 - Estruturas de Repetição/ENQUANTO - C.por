// C) Faça um programa que só recebe um número entre 1 e 9 (validar essa condição), 
// e imprima a tabuada do valor digitado.

programa {
	funcao inicio() {
		inteiro numero
		escreva("Informe um valor inteiro entre 1 e 10: ")
		leia(numero)

		se (numero >= 1  e numero <= 10) {
			inteiro contador = 1, resultado
			enquanto (contador <= 10) {
				resultado =  numero * contador
				escreva(numero , " x " , contador , " = " , resultado , "\n")
				contador = contador + 1
			}
		} senao {
			escreva("O valor informado é inválido!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 480; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */