// Ç) Crie um programa que calcula o valor a ser pago por um produto 
// considerando o preço de etiqueta e a escolha da condição de pagamento. 
// Utilize as opções da tabela a seguir para saber qual a 
// condição de pagamento escolhida e efetuar o cálculo adequado. 
// Crie um menu com as opções abaixo.
// OPÇÃO	CONDIÇÃO DE PAGAMENTO
// 1		À vista, dinheiro ou cheque, 10% de desconto.
// 2		À vista, cartão de credito, 5% de desconto.
// 3		À prazo em 2 vezes, preço normal da etiqueta sem juros.
// 4		À prazo em 3 vezes, preço normal da etiqueta + 10% de juros.

programa {
	funcao inicio() {
		real preco_etiqueta		
		escreva("Informa o preço de etiqueta do produto: R$ ")
		leia(preco_etiqueta)

		inteiro opcao
		escreva("Informe a opção de pagamento: \n")
		escreva("[1] À vista, dinheiro ou cheque, 10% de desconto. \n")
		escreva("[2] À vista, cartão de credito, 5% de desconto. \n")
		escreva("[3] À prazo em 2 vezes, preço normal da etiqueta sem juros. \n")
		escreva("[4] À prazo em 3 vezes, preço normal da etiqueta + 10% de juros. \n")
		leia(opcao)

		real valor_final
		escolha (opcao) {
			caso 1:
				valor_final = preco_etiqueta * 0.9
				escreva("Valor a pagar: R$ " , valor_final)
				pare
			caso 2:
				valor_final = preco_etiqueta * 0.95
				escreva("Valor a pagar: R$ " , valor_final)
				pare
			caso 3:
				escreva("Valo a pagar: R$ " , preco_etiqueta , " em 2 parcelas de R$ " , preco_etiqueta / 2)
				pare
			caso 4:
				valor_final = preco_etiqueta * 1.1
				escreva("Valo a pagar: R$ " , valor_final , " em 2 parcelas de R$ " , valor_final / 2)
				pare
			caso contrario:
				escreva("Opção inválida")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1563; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */