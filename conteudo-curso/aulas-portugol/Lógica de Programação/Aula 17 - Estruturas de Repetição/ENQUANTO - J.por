// J) Crie um programa que receba o nome e a nota (de uma prova) de X alunos, 
// e ao final exiba quantas notas foram menores que 7 e quantas foram iguais ou superiores a 7, 
// e exiba também o nome do aluno com a melhor nota juntamente com a sua nota.

programa {
	funcao inicio() {
		inteiro qtd_alunos, qtd_acima = 0, qtd_abaixo = 0
		real nota, melhor_nota = 0
		cadeia nome, melhor_aluno = ""

		escreva("Infrome a quantidade de alunos: ")
		leia(qtd_alunos)
		
		inteiro contador = 1
		enquanto (contador <= qtd_alunos) {
			escreva("Infrome o nome do " , contador , "º aluno: ")
			leia(nome)
			escreva("Informe a nota do " , contador , "º aluno: ")
			leia(nota)

			se (nota >= 7) {
				qtd_acima = qtd_acima + 1
			} senao {
				qtd_abaixo = qtd_abaixo + 1
			}

			se (nota > melhor_nota) {
				melhor_nota = nota
				melhor_aluno = nome
			}

			contador = contador + 1
		}
		
		escreva("Melhor aluno foi : " , melhor_aluno , " que tirou " , melhor_nota , "\n")
		escreva("Quantidade de notas acima de 7 : " , qtd_acima , "\n")
		escreva("Quantidade de notas abaixo de 7: " , qtd_abaixo , "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 468; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */