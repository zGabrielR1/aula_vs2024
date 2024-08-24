// Faça um programa para calcular o reajuste de salário dos funcionários
// de uma empresa, usando um percentual de aumento desejado.

programa {
	funcao inicio() {
		// Variáveis
		real salario, per_reajuste
		
		// Entrada
		escreva("Informe o salário do funcionário R$ ")
		leia(salario)
		escreva("Informe o percentual de acréssimo desejado %")
		leia(per_reajuste)
		
		// Processamento
		salario = (salario * per_reajuste / 100) + salario
		
		// Saída
		escreva("O salário do funconário reajustado é R$ " + salario)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 163; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */