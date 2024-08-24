// G) Faça um programa que armazene os seguintes valores dos produtos de 3 vendas, 
// venda1: (9.50, 4.75, 2.00, 1.15), 
// venda2: (3.55, 6.90, 4.50, 2.00) e 
// venda3: (9.18, 12.65, 3.40, 2.98) em uma matriz, 
// e em um vetor de 3 posições armazene o nome do cliente de cada venda, 
// venda1: Nicolas Cage, venda2: Angelina Jolie e venda3: Tom Hanks. 
// No final apresente na tela o total da venda e o nome do cliente e 
// quem foi o cliente com a maior valor de compra.

programa {
	funcao inicio() {
		real vendas[3][4] = {
			{ 9.50, 4.75, 2.00, 1.15 },
			{ 3.55, 6.90, 4.50, 2.00 },
			{ 9.18, 12.65, 3.40, 2.98 }
		}

		cadeia clientes[3] = { "Nicolas Cage", "Angelina Jolie", "Tom Hanks" }
		real totais[3]

		para (inteiro i = 0; i < 3; i++) {
			real total_venda = 0
			para (inteiro j = 0; j < 4; j++) {
				total_venda = total_venda + vendas[i][j]
			}
			escreva("O valor total da venda do cliente " , clientes[i] , " é R$ " , total_venda , "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 595; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */