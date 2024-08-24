programa {
	funcao inicio() {
		real preco_venda
		escreva("Informe o preço (R$) de venda do produto ")
		leia(preco_venda)

		real per_desconto
		escreva("Informe o percentual (%) de desconto ")
		leia(per_desconto)

		real preco_final = preco_venda - (preco_venda * per_desconto / 100)

		escreva("O valor do produto com o desconto é R$ " , preco_final)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 292; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */