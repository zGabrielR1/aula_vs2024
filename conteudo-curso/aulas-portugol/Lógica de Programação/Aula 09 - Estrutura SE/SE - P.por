// P) Faça um programa que leia 3 notas de avaliações de um aluno. 
// Calcule a média aritmética e exiba uma mensagem que informa 
// se o aluno foi ou não aprovado 
// (considerar que média igual ou maior que 6 o aluno é aprovado). 
// Exibir também a média calculada.

programa {
	funcao inicio() {
		real nota1, nota2, nota3
		escreva("Informe a primeira nota do aluno: ")
		leia(nota1)
		escreva("Informe a segunda nota do aluno: ")
		leia(nota2)
		escreva("Informe a terceira nota do aluno: ")
		leia(nota3)

		real media = (nota1 + nota2 + nota3) / 3

		se (media >= 6) {
			escreva("Com média " , media , " este aluno está aprovado")
		} senao {
			escreva("Com média " , media , " este aluno está reprovado")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 514; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */