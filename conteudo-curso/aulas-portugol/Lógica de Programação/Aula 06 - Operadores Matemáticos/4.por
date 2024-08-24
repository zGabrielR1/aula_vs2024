// Faça um programa para converter distâncias lidas em Quilômetros para Milhas e Jardas.

programa {
	inclua biblioteca Matematica
	
	funcao inicio() {
		// Variáveis
		real km, milha, jarda
		
		// Entrada
		escreva("Informe a distância em Quilômetros: ")
		leia(km)
		
		// Processamento
		milha = km / 1.609
		jarda = milha * 1760
		
		// Saída
		escreva(km + " KM são equivalentes a " + Matematica.arredondar(milha, 1) + " Milhas e " + Matematica.arredondar(jarda, 1) + " Jardas")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 150; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */