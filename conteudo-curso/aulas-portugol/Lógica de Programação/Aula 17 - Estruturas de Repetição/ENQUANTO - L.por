// L) Uma loja está levantando o valor total de todas as mercadorias em estoque. 
// Escreva um programa que permita a entrada das seguintes informações:
// • O número total de mercadorias no estoque;
// • O valor de cada mercadoria. 
// Ao final exibir um relatório com o valor total (R$) em estoque e a média de valor (R$) das mercadorias.

programa {
	funcao inicio() {
		inteiro qtd_mercadorias
		real valor_mercadoria, total_valores = 0

		escreva("Informe quantas mercadorias tem no estoque: ")
		leia(qtd_mercadorias)

		inteiro contador = 1
		enquanto (contador <= qtd_mercadorias) {
			escreva("Informe o valor da " , contador , "º mercadoria: ")
			leia(valor_mercadoria)

			total_valores = total_valores + valor_mercadoria
			contador = contador + 1
		}
		
		real media = total_valores / qtd_mercadorias
		escreva("O valor total das mercadorias em estoque é: R$ " , total_valores , "\n")
		escreva("A média dos valores das mercadorias em estoque é: R$ " , media , "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 645; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */