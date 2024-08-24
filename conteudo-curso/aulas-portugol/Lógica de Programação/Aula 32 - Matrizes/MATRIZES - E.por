// E) Faça um programa que recebe a 3 notas de 4 alunos, armazena as notas em uma matriz, 
// verifica e informa quantos alunos tiveram média acima da média da turma.

programa {
	funcao inicio() {
		// Populando a Matriz com as notas
		real notas[4][3]
		para (inteiro i = 0; i < 4; i++) {
			para (inteiro j = 0; j < 3; j++) {
				escreva("Informe a " , j + 1 , "ª nota do " , i + 1 , "º aluno: ")
				leia(notas[i][j])
			}
			limpa()
		}

		// Descobrindo a Média da Turma
		real total_turma = 0
		para (inteiro i = 0; i < 4; i++) {
			para (inteiro j = 0; j < 3; j++) {
				total_turma = total_turma + notas[i][j]
			}
		}
		real media_turma = total_turma / 12


		// Calculando a Média de cada Aluno e contando 
		// quantos alunos tiveram média acima da turma
		inteiro qtd_acima_media = 0
		para (inteiro i = 0; i < 4; i++) {
			real total_aluno = 0
			para (inteiro j = 0; j < 3; j++) {
				total_aluno = total_aluno + notas[i][j]
			}
			real media_aluno = total_aluno / 3
			se (media_aluno > media_turma) {
				qtd_acima_media++
			}
		}

		escreva("A média da turma foi " , media_turma , "\n")
		escreva("e a quantidade de alunos que tiveram média acima foi " , qtd_acima_media , " aluno(s)")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1045; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */