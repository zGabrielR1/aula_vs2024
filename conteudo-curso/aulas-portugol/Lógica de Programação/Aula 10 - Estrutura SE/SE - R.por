// R) Desenvolva um programa para calcular a conta de água para a CASAN. 
// O custo da água é apurado com base nos seguintes critérios
// • CONSUMIDOR RESIDENCIAL: R$ 5,00 de taxa + R$ 0,05 por m³ gastos;
// • CONSUMIDOR COMERCIAL: R$ 500,00 para os primeiros 80m³ gastos + R$ 0,25 por m³ gastos acima dos 80m³;
// • CONSUMIDOR INDUSTRIAL: R$ 800,00 para os primeiros 100m³ gastos + R$ 0,04 por m³ gastos acima dos 100 m³;
// O programa deverá ler o nome do cliente, seu tipo (RESIDENCIAL, COMERCIAL ou INDUSTRIAL) e o seu consumo de água em metros cúbicos. 
// Como resultado exibir na tela a conta do cliente, com o nome e o valor em reais a ser pago pelo mesmo.

programa {
	inclua biblioteca Texto
	funcao inicio() {
		cadeia tipo_consumidor, nome_cliente
		real qtd_m3
		escreva("Informe o nome do cliente: ")
		leia(nome_cliente)
		escreva("Informe a quantidade de m³ consumidos: ")
		leia(qtd_m3)
		escreva("Informe o tipo do consumidor: \n")
		escreva("Digite CR para Consumidor Residencial \n")
		escreva("Digite CC para Consumidor Comercial \n")
		escreva("Digite CI para Consumidor Indústrial \n")
		leia(tipo_consumidor)
		tipo_consumidor = Texto.caixa_alta(tipo_consumidor)

		real total_pagar = 0
		se (tipo_consumidor == "CR") {
			total_pagar = 5 + qtd_m3 * 0.05
		} senao se (tipo_consumidor == "CC") {
			se (qtd_m3 > 80) {
				total_pagar = 500 + (qtd_m3 - 80) * 0.25
			} senao {
				total_pagar = 500
			}
		} senao se (tipo_consumidor == "CI") {
			se (qtd_m3 > 100) {
				total_pagar = 800 + (qtd_m3 - 100) * 0.04
			} senao {
				total_pagar = 800
			}
		} senao {
			escreva("Consumidor inválido \n")
		}

		escreva("############################## \n")
		escreva("		  RESUMO DA CONTA	     \n")
		escreva("############################## \n")
		escreva("Clinte: " , nome_cliente , "\n")
		escreva("Tipo: " , tipo_consumidor , "\n")
		escreva("Consumo: "  , qtd_m3 , "m³ \n")
		escreva("Total à pagar: R$" , total_pagar)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1589; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */