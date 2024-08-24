programa {
	funcao inicio() {
		real valor_reais
		escreva("Informe o valor em Reais R$ ")
		leia(valor_reais)

		real cotacao
		escreva("Informe a cotação do Dólar ")
		leia(cotacao)

		real valor_dolares = valor_reais / cotacao

		escreva("O valor convertido em Dólares é US$ " , valor_dolares)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 115; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */