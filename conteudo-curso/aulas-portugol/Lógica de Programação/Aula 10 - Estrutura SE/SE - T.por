// T) Uma fruteira está vendendo frutas com a seguinte tabela de preços:
//			Até 5 Kg 			Acima de 5 Kg
// Morango 	R$ 2,50 por Kg 	R$ 2,20 por Kg
// Maçã 		R$ 1,80 por Kg 	R$ 1,50 por Kg
// Se o cliente comprar mais de 8 Kg em frutas ou o valor total da compra ultrapassar R$ 25,00
// receberá ainda um desconto de 10% sobre este total. 
// Faça um programa para ler a quantidade (em Kg) de morangos e a quantidade (em Kg) de maçãs 
// adquiridas e exiba o valor a ser pago pelo cliente.

programa {
	funcao inicio() {
		real kg_morango, kg_maca
		escreva("Informe a quantidade (kg) de morangos compradas: ")
		leia(kg_morango)
		escreva("Informe a quantidade (kg) de maçãs compradas: ")
		leia(kg_maca)

		real valor_morango
		se (kg_morango > 5) {
			valor_morango = kg_morango * 1.50
		} senao {
			valor_morango = kg_morango * 1.80
		}

		real valor_maca
		se (kg_maca > 5) {
			valor_maca = kg_maca * 2.20
		} senao {
			valor_maca = kg_maca * 2.50
		}

		real kg_total = kg_morango + kg_maca
		real valor_total = valor_morango + valor_maca
		
		se (kg_total >  8  ou valor_total > 25) {
			valor_total = valor_total * 0.9
		}

		escreva("O valor total aser pago é: R$ " , valor_total)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1093; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */