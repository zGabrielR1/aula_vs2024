// Faça um programa que leia a idade de uma pessoa e exiba esta idade
// convertida em meses, dias, horas e minutos.

programa
{
	funcao inicio()
	{
		// Variáveis
		inteiro idade, meses, horas, minutos
		real dias
		
		// Entrada
		escreva("Informe a idade da pessoa: ")
		leia(idade)
		
		// Processamento
		meses = idade * 12
		dias = idade * 365.25 // Para considerar os anos bissextos onde fevereiro possuí um dia a mais
		horas = dias * 24
		minutos = horas * 60
		
		// Saída
		escreva("Esta pessoa possuí " + meses + " meses, " + dias + " dias, " + horas + "horas e " + minutos + " minutos de idade.")
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