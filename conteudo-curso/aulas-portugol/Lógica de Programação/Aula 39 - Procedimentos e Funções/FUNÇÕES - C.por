// C) Faça um programa com um menu (conforme abaixo) para receber uma temperatura 
// e converter ela de: Celsius para Fahrenheit; Fahrenheit para Celsius; 
// Celsius para Kelvin; Kelvin para Celsius; Fahrenheit para Kelvin e 
// Kelvin para Fahrenheit. O programa deverá possuir um procedimento 
// para imprimir o menu, e uma função para cada cálculo de conversão. 
// O programa deve repetir até que seja escolhida a opção para finalizar.

programa {
	inclua biblioteca Texto
	funcao real converter_temperatura(real temperatura, cadeia tipo_conversao) {
		tipo_conversao = Texto.caixa_baixa(tipo_conversao)
		se (tipo_conversao == "cf") {
			retorne temperatura * 9 / 5 + 32
		} senao se (tipo_conversao == "fc") {
			retorne (temperatura - 32) * 5 / 9
		} senao se (tipo_conversao == "ck") {
			retorne temperatura + 273.15
		} senao se (tipo_conversao == "kc") {
			retorne temperatura - 273.15
		} senao se (tipo_conversao == "fk") {
			retorne (temperatura - 32) * 5 / 9 + 273.15
		} senao se (tipo_conversao == "kf") {
			retorne (temperatura - 273.15) * 9 / 5 + 32
		} senao {
			retorne 0.0
		}
	}

	funcao imprimir_menu() {
		escreva("################\n")
		escreva("   CONVERSOR    \n")
		escreva("################\n")
		escreva("[1] C para F\n")
		escreva("[2] F para C\n")
		escreva("[3] C para K\n")
		escreva("[4] K para C\n")
		escreva("[5] F para K\n")
		escreva("[6] K para F\n")
		escreva("[7] Sair    \n")
		escreva("################\n")
	}

	funcao inicio() {
		inteiro opcao
		faca {
			// Imprimir o menu
			imprimir_menu()
			leia(opcao)

			// Verificar a opção
			real temp
			escolha (opcao) {
				caso 1:
					escreva("Informe a temperatura em ºC que deseja converter para ºF: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "cf") , "ºF\n")
					pare
				caso 2:
					escreva("Informe a temperatura em ºF que deseja converter para ºC: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "fc") , "ºC\n")
					pare
				caso 3:
					escreva("Informe a temperatura em ºC que deseja converter para ºK: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "ck") , "ºK\n")
					pare
				caso 4:
					escreva("Informe a temperatura em ºK que deseja converter para ºC: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "kc") , "ºC\n")
					pare
				caso 5:
					escreva("Informe a temperatura em ºF que deseja converter para ºK: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "fk") , "ºK\n")
					pare
				caso 6:
					escreva("Informe a temperatura em ºK que deseja converter para ºF: ")
					leia(temp)
					escreva("A temperatura é " , converter_temperatura(temp, "kf") , "ºF\n")
					pare
				caso 7:
					escreva("Saindo do aplicativo...")
					pare
				caso contrario:
					escreva("Opção inválida. Digite novamente!\n")
			}
		} enquanto (opcao != 7)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2944; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */