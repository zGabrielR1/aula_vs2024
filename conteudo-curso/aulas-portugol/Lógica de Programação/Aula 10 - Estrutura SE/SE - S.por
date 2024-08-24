// S) Faça um programa que leia 3 notas de avaliações de um aluno e a sua frequência. 
// Calcule a média aritmética e exiba uma mensagem que informa a situação do aluno.
// CONDIÇÕES:
// APROVADO = Média superior ou igual a 7 e frequência superior ou igual a 75.
// EXAME = Média entre 5 e 7 e frequência superior ou igual a 75.
// REPROVADO = Média abaixo de 5 ou frequência abaixo de 75.

programa {
	funcao inicio() {
		real nota1, nota2, nota3, frequencia
		escreva("Informe a primeira nota do aluno: ")
		leia(nota1)
		escreva("Informe a segunda nota do aluno: ")
		leia(nota2)
		escreva("Informe a terceira nota do aluno: ")
		leia(nota3)
		escreva("Informe a frequência do aluno: ")
		leia(frequencia)
		
		real media = (nota1 + nota2 + nota3) / 3

		se (media >= 7 e frequencia >= 75) {
			escreva("Aluno aprovado!")
		} senao se (media >= 5 e media < 7 e frequencia >= 75) {
			escreva("Aluno em exame!")
		} senao {
			escreva("Aluno reprovado!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 390; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */