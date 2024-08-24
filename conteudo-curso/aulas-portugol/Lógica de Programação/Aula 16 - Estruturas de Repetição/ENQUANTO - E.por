// E) Faça um programa que peça 10 números e apresente a média destes valores digitados.

programa {
	funcao inicio() {
		real numero, acumulador = 0

		inteiro contador = 1
		enquanto (contador <= 10) {
			escreva("Informe o " , contador , "º número: ")
			leia(numero)
			
			acumulador = acumulador + numero
			contador = contador + 1			
		}

		real media = acumulador / 10
		escreva("A média dos valores digitado é: " , media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 135; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */