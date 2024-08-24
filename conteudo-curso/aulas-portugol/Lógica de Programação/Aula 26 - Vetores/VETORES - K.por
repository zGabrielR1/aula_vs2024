// K) Faça um programa que solicite a nota e o nome de 10 alunos, e armazene as notas e um vetor 
// e os nomes em outro, no final imprima na tela o nome e a nota de cada aluno.

programa {
	funcao inicio() {
		real notas[10]
		cadeia alunos[10]
		para (inteiro i = 0; i < 10; i++) {
			escreva("Informe o nome do aluno: ")
			leia(alunos[i])
			escreva("Informe a nota desse aluno: ")
			leia(notas[i])
			limpa()
		}

		para (inteiro i = 0; i < 10; i++) {
			escreva(alunos[i] , " alcançou a nota: " , notas[i] , " \n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 342; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */