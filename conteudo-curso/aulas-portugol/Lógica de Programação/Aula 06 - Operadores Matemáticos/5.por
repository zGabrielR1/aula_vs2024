// Crie um programa que converte uma medida lida em Metros² para Hectare e Alqueire.

programa {
	funcao inicio() {
		// Variáveis
		real metros2
		
		// Entrada
		escreva("Informe a área em M²: ")
		leia(metros2)
		
		// Processamento
		real hectare = metros2 / 10000
		real alqueire_sp = metros2 / 24200
		real alqueire_mg = metros2 / 48400
		
		// Saída
		escreva(metros2 + " M² equivalem a " + hectare + " Hectare(s) \n")
		escreva(metros2 + " M² equivalem a " + alqueire_sp + " Alqueire(s) Paulista")
		escreva(metros2 + " M² equivalem a " + alqueire_mg + " Alqueire(s) Mineiro")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 505; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */