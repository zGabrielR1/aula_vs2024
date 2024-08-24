// B) Faça um programa que recebe 5 valores numéricos e no final exiba 
// qual foi o maior valor digitado pelo usuário.

programa {
	funcao inicio() {
		inteiro numero, maior_numero = 0

		inteiro contador = 1
		enquanto (contador <= 5) {
			escreva("Informe o " , contador , "º número: ")
			leia(numero)

			se (numero > maior_numero) {
				maior_numero = numero
			}

			contador = contador + 1
		}

		escreva("O maior valor digitado foi: " , maior_numero)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 132; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */