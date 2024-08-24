programa {
	inclua biblioteca Arquivos
	funcao inicio() {
		// Abrir o arquivo txt
		inteiro arquivo = Arquivos.abrir_arquivo("D:/alunos.txt", 0)

		// Ler os dados do arquivo e armazenar no vetor
		cadeia alunos[5]
		para (inteiro i = 0; i < 5; i++) {
			alunos[i] = Arquivos.ler_linha(arquivo)
		}

		// Fechar o arquivo para liberar ele para outras possíveis solitações
		Arquivos.fechar_arquivo(arquivo)

		// Imprimir os dados lidos na tela
		para (inteiro i = 0; i < 5; i++) {
			escreva(alunos[i] , "\n")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 135; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {alunos, 8, 9, 6}-{i, 9, 16, 1}-{i, 17, 16, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */