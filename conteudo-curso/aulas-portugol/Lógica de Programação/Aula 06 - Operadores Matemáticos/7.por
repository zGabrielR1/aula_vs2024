// Faça um programa que converte para Kelvin uma temperatura recebida em Celsius.

programa {
	inclua biblioteca Matematica
	
	funcao inicio() {
		// Variáveis
		real celsius, kelvin
		
		// Entrada
		escreva("Informe atemperatura em celsius ")
		leia(celsius)

		// Processamento
		kelvin = celsius + 273.15
		
		// Saída
		escreva("Atemperatura convertida é " + Matematica.arredondar(kelvin, 2) + " K")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 125; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */