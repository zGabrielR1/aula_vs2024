// D) Faça um programa que recebe a 3 notas de 4 alunos, armazena as notas em uma matriz, 
// verifica e informa quais foram os alunos que estão aprovados, reprovados e em exame: 
// Sendo média do aluno igual ou acima de 7 para aprovado, média entre 5 e 7 para exame, 
// média abaixo de 5 para reprovado.

programa {
	funcao inicio() {
		real notas[4][3]

		// Preenchendo a matriz das notas
		para (inteiro i = 0; i < 4; i++) {
			para (inteiro j = 0; j < 3; j++) {
				escreva("Informe a " , j + 1 , "ª nota do " , i + 1 , "º aluno: ")
				leia(notas[i][j])
			}
			limpa()
		}

		// Calculando a média do aluno e verificando a situação dele
		para (inteiro i = 0; i < 4; i++) {
			real total = 0.0
			para (inteiro j = 0; j < 3; j++) {
				total = total + notas[i][j]
			}

			real media = total / 3

			// Antes de avançar para o proximo aluno, verifica a situação dele
			se (media >= 7) {
				escreva(i + 1 , "º aluno foi aprovado \n")
			} senao se (media >= 5 e media < 7) {
				escreva(i + 1 , "º aluno está em exame \n")
			} senao {
				escreva(i + 1 , "º aluno foi reprovado \n")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 984; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {notas, 8, 7, 5}-{media, 26, 8, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */