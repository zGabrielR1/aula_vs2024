// Faça um programa para calcular o consumo médio de combustível de
// um automóvel, sendo fornecida a distância total percorrida (KM) pelo
// automóvel e o total de combustível gasto (L).

programa
{
	funcao inicio()
	{
		// Variáveis
		real distancia, combustivel, consumo
		
		// Entrada
		escreva("Informe a distância percorrida (KM): ")
		leia(distancia)
		escreva("Informe a quantidade de combustivel consumida (L): ")
		leia(combustivel)
		
		// Processamento
		consumo = distancia / combustivel
		
		// Saída
		escreva("O consumo médio é de " + consumo + "KM/L")
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