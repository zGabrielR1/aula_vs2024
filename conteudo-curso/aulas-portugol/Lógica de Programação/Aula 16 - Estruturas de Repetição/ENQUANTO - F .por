// F) Faça um programa que peça 10 números e apresente no final 
// o maior e o menor valor digitado pelo usuário.

programa {
	funcao inicio() {
		real numero
		escreva("Informe um número: ")
		leia(numero)

		real maior_numero = numero
		real menor_numero = numero

		inteiro contador = 1
		enquanto (contador <= 9) {
			escreva("Informe um número: ")
			leia(numero)

			se (numero > maior_numero) {
				maior_numero = numero
			}

			se (numero < menor_numero) {
				menor_numero = numero
			}

			contador = contador + 1
		}

		escreva("O maior valor informado foi: " , maior_numero , " E o menor foi: "  , menor_numero)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 267; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */