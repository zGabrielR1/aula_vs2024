programa {
	funcao inicio() {
		inteiro numero
		escreva("Informe um número inteiro: ")
		leia(numero)

		inteiro qtd_divisoes = 0
		para (inteiro contador = 1; contador <= numero; contador++) {
			se (numero % contador == 0) {
				qtd_divisoes++
			}
		}

		se (qtd_divisoes > 2) {
			escreva("Não é primo")
		} senao {
			escreva("É primo")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 356; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */