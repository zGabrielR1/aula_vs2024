// Faça um programa que calcule o valor de venda de um automóvel,
// considerando o valor de custo que a fábrica teve para fabrica-lo, o
// percentual de impostos sobre o valor de custo, e o percentual de lucro
// da agência distribuidora do veículo.

programa {
	funcao inicio() {
		// Variáveis
		real valor_custo, per_imposto, per_lucro, valor_imposto, valor_lucro, valor_venda
		
		// Entrada
		escreva("Informe o valor de custo para fabricar o veículo R$ ")
		leia(valor_custo)
		escreva("Informe o percentual total de impostos % ")
		leia(per_imposto)
		escreva("Informe o percentual de lucro desejado pela agência % ")
		leia(per_lucro)
		
		// Processamento
		valor_imposto = valor_custo * per_imposto / 100
		valor_custo = valor_custo + valor_imposto
		valor_lucro = valor_custo * per_lucro / 100
		valor_venda = valor_custo + valor_lucro
		
		// Saída
		escreva("O valor de venda do veículo é R$ " + valor_venda)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 280; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */