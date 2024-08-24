programa {
	funcao inicio() {
		real capital
		escreva("Informe o valor aplicado na poupança R$ ")
		leia(capital)

		inteiro tempo
		escreva("Informe o tempo da aplicação em meses ")
		leia(tempo)

		real taxa
		escreva("Informe a taxa de juros ao mês ")
		leia(taxa)

		real juros = capital * (taxa / 100) * tempo
		real montante = capital + juros

		escreva("A sua aplicação rendeu R$ " , juros , ".\nTotalizando um montante de R$ " , montante )
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 451; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */