// Q) Faça um programa para pegar o salário fixo e o valor das vendas efetuadas 
// pelo vendedor de uma empresa. 
// Sabendo que ele recebe uma comissão de 3% sobre o total das vendas até R$1.500,00 
// mais 5% sobre o que ultrapassar este valor, calcular e escrever o seu salário total.

programa {
	funcao inicio() {
		real salario_fixo, total_vendas
		escreva("Informe qual é o salário fixo do vendedor: R$ ")
		leia(salario_fixo)
		escreva("Informe o valor total das vendas deste vendedor: R$ ")
		leia(total_vendas)

		real comissao_1, comissao_2, salario_final
		se (total_vendas > 1500) {
			comissao_1 = 1500 * 0.03
			comissao_2 = (total_vendas - 1500) * 0.05
			salario_final = salario_fixo + comissao_1 + comissao_2
		} senao {
			comissao_1 = total_vendas * 0.03
			salario_final = salario_fixo + comissao_1
		}

		escreva("O slário total deste vendedor é R$ " , salario_final)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 727; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */