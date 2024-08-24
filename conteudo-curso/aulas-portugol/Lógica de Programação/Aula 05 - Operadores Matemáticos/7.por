// Faça um programa para calcular a multa por devolução atrasada dos
// livros em uma biblioteca. Considere R$0,75 o valor diário da multa por livro atrasado.

programa
{
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		// Variáveis
		real livros, dias, multa
		
		// Entrada
		escreva("Informe a quantidade de livros atrasados: ")
		leia(livros)
		escreva("Informe a quantidade de dias em atraso: ")
		leia(dias)
		
		// Processamento
		multa = livros * dias * 0.75
		
		// Saída
		escreva("O valor da multa é R$ " + Matematica.arredondar(multa, 2))
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