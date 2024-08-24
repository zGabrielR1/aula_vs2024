// N) Faça um programa para um banco, que solicite: 
// Número da conta do cliente, valor atual do saldo, valor do débito (saída) 
// e valor do crédito (entrada) a ser feito na conta. 
// Calcule e exiba o valor do saldo atualizado (saldo atual = saldo atual + crédito - débito). 
// Também verificar se saldo atual é positivo ou negativo 
// e informar na tela 'Saldo Positivo' ou 'Saldo Negativo'.

programa {
	funcao inicio() {
		inteiro numero_conta
		escreva("Informe o número da conta do cliente: ")
		leia(numero_conta)

		real saldo_atual, valor_credito, valor_debito
		escreva("Informe o valor atual do saldo da conta: ")
		leia(saldo_atual)
		escreva("Informe o valor de crédito a ser feito na conta: ")
		leia(valor_credito)
		escreva("Informe o valor de débito a ser feito na conta: ")
		leia(valor_debito)

		saldo_atual = saldo_atual + valor_credito - valor_debito

		se (saldo_atual > 0) {
			escreva("Conta: " , numero_conta , ". Saldo positivo de R$ " , saldo_atual)
		} senao se (saldo_atual < 0) {
			escreva("Conta: " , numero_conta , ". Saldo negativo de R$ " , saldo_atual)
		} senao {
			escreva("Conta: " , numero_conta , ". Saldo zerado de R$ " , saldo_atual)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 820; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */