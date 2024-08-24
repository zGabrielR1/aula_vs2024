programa {
	
	funcao inicio() {
		real preco_custo
		escreva("Informe o preço de custo (R$) do produto ")
		leia(preco_custo)

		real per_lucro
		escreva("Informe o percentual (%) de lucro desejado ")
		leia(per_lucro)

		real preco_venda = (preco_custo * per_lucro / 100) + preco_custo

		escreva("O preço do produto deverá ser R$ " , preco_venda)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 349; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */