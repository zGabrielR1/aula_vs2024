// D) O mesmo exercício anterior, mas agora deve informar parao usuário 
// o menor valor do vetor e a respectiva posição dele nesse vetor.

programa {
	funcao inicio() {
		inteiro valores[10], menor_valor, posicao = 0

		para (inteiro i = 0; i < 10; i++) {
			escreva("Informe um número inteiro: ")
			leia(valores[i])
		}

		menor_valor = valores[0]
		
		para (inteiro i = 0; i < 10; i++) {
			se (valores[i] < menor_valor) {
				menor_valor = valores[i]
				posicao = i
			}
		}

		escreva("O Menor valor do vetor é " , menor_valor , " e a sua posição é " , posicao)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 288; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */