// A) Faça um programa que recebe um número inteiro e 
// através de uma função, verifica se ele é PAR ou ÍMPAR. 
// No final exibe o resultado da função.

programa {
	funcao logico eh_par(inteiro valor) {
		se (valor % 2 == 0) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao inicio() {
		inteiro numero
		escreva("Informe um número inteiro: ")
		leia(numero)

		se (eh_par(numero)) {
			escreva("É Par!")
		} senao {
			escreva("É Ímpar!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 328; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valor, 6, 30, 5}-{numero, 15, 10, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */