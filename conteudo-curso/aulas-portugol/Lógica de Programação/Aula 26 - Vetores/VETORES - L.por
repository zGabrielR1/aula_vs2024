// L) O mesmo exercício anterior, mas agora o programa deve verificar qual foi o melhor aluno, 
// imprimindo na tela no final o nome e a nota deste aluno.

programa {
	funcao inicio() {
		real notas[10], melhor_nota = 0
		cadeia alunos[10], melhor_aluno = ""
		para (inteiro i = 0; i < 10; i++) {
			escreva("Informe o nome do aluno: ")
			leia(alunos[i])
			escreva("Informe a nota desse aluno: ")
			leia(notas[i])
			limpa()
			
			se (notas[i] > melhor_nota) {
				melhor_nota = notas[i]
				melhor_aluno = alunos[i]
			}
		}

		escreva("O melhor aluno foi: " , melhor_aluno , " e a sua nota foi: " , melhor_nota)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 492; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */