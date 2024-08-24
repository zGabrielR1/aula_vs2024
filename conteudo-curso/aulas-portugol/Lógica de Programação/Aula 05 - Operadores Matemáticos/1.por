// Um comércio por atacado compra caixas de produtos para revender
// (exemplo, uma caixa de sabonetes com 12 unidades). Escreva um
// programa para calcular o custo unitário dos produtos contidos em uma caixa.

programa
{
	funcao inicio()
	{
		// Variáveis
		real valor_caixa, valor_unitario
		inteiro qtd_un

		// Entrada
		escreva("Informe o valor pago pela caixa R$ ")
		leia(valor_caixa)
		escreva("Informe quantas unidades tem dentro da caixa: ")
		leia(qtd_un)

		// Processamento
		valor_unitario = valor_caixa / qtd_un

		// Saída
		escreva("O custo unitário de cada produto é R$ " + valor_unitario)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */