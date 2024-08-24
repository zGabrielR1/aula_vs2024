// Faça um programa que calcula o valor dos juros de um financiamento
// imobiliário (capital). O programa deve considerar a taxa de juros
// compostos ao mês (a.m.), e o tempo em meses.

programa
{
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		// Variáveis
		real montante, capital, taxa, tempo, juros
		
		// Entrada
		escreva("Informe o valor do capital financiado R$ ")
		leia(capital)
		escreva("Informe a taxa de juros (a.m) % ")
		leia(taxa)
		escreva("Informe a quantidade de meses do pagamento do financiamento: ")
		leia(tempo)
		
		// Processamento
		montante = capital * Matematica.potencia(1 + taxa / 100, tempo)
		juros = montante - capital
		
		// Saída
		escreva("O valor dos juros é R$ " + Matematica.arredondar(juros, 2))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 187; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */