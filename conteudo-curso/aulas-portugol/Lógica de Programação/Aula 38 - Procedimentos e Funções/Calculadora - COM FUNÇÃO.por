// A) Faça um programa que recebe um número inteiro e através de uma função,
// verifica se ele é PAR ou ÍMPAR. No final exibe o resultado da função.
programa {	
	funcao logico parOuImpar(inteiro numero) {
		se (numero % 2 == 0) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}
	
	funcao inicio() {
		inteiro num
		escreva("Informe um número inteiro ")
		leia(num)

		se (parOuImpar(num)) {
			escreva("PAR")
		} senao {
			escreva("ÍMPAR")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 218; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */