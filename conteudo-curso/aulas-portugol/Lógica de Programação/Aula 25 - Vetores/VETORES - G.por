// G) Faça um programa que solicite a nota de uma prova de 
// uma turma de 15 alunos e armazene estas notas dentro de um vetor. 
// Após a leitura das notas o programa deverá calcular a média das notas da turma 
// e verificar quantos alunos tiveram nota acima desta média.

programa {
	funcao inicio() {
		real notas[15], total = 0
		para (inteiro i = 0; i < 15; i++) {
			escreva("Informe a nota do aluno: ")
			leia(notas[i])
			total+= notas[i]
		}

		real media = total / 15

		inteiro notas_acima = 0
		para (inteiro i = 0; i < 15; i++) {
			se (notas[i] > media) {
				notas_acima++
			}
		}

		escreva("A média da turma foi " , media , "\n")
		escreva("E a quantidade de alunos com notas acima desta média foi " , notas_acima)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 595; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */