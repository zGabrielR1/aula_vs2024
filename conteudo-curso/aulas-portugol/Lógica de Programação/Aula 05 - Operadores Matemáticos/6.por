// Faça um programa para converter uma velocidade fornecida em KM/H para M/S.

programa
{
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		// Variáveis
		real kmh, ms
		
		// Entrada
		escreva("Informe a velocidade em KH/H: ")
		leia(kmh)
		
		// Processamento
		ms = kmh / 3.6
		
		// Saída
		escreva("A velocidade é " + Matematica.arredondar(ms, 1) + " M/S")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */