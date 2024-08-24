programa {
	funcao inicio() {
		inteiro qtd_macas
		escreva("Informe a quantidade de maçãs compradas: ")
		leia(qtd_macas)

		real total_pagar
		se (qtd_macas >= 12) {
			total_pagar = qtd_macas * 1.15
		} senao {
			total_pagar = qtd_macas * 1.30
		}

		escreva("O valor total a ser pago é R$ ",total_pagar)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 146; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */