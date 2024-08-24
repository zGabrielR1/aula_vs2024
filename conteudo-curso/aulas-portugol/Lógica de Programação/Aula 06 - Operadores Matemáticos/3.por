// Faça um programa para calcular e exibir o salário liquido de um
// vendedor. Considere o valor total das vendas feitas por ele, o seu
// percentual de comissão, o seu salário bruto e o percentual de
// contribuição de INSS.

programa {
	inclua biblioteca Matematica
	
	funcao inicio() {
		// Variáveis
		real sal_liquido, sal_bruto, total_vendas, per_comissao, valor_comissao, per_inss, valor_inss
		
		// Entrada
		escreva("Informe o salário bruto do funcionário R$ ")
		leia(sal_bruto)
		escreva("Informe o total de vendas faturado pelo funcionário R$ ")
		leia(total_vendas)
		escreva("Informe o perncetual de comissão do funcionário % ")
		leia(per_comissao)
		escreva("Informe o percentual de INSS do funcionário % ")
		leia(per_inss)
		
		// Processamento
		valor_comissao = total_vendas * per_comissao / 100
		valor_inss = sal_bruto * per_inss / 100
		sal_liquido = sal_bruto - valor_inss + valor_comissao
		
		// Saída
		escreva("O salário liquido do funcionário é de R$ " + Matematica.arredondar(sal_liquido, 2))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 270; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */