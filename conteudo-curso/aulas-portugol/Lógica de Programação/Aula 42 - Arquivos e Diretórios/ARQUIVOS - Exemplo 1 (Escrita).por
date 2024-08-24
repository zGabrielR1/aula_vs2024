programa {
	inclua biblioteca Arquivos
	funcao inicio() {
		cadeia nomes[5] = { "Carlos R", "Luiz", "Amanda", "João", "Jonas" }

		// Abrir/Criar o arquivo txt
		inteiro arquivo = Arquivos.abrir_arquivo("D:/alunos.txt", 1)

		// Escrever os noems dos alunos dentro do arquivo
		para (inteiro i = 0; i < 5; i++) {
			Arquivos.escrever_linha(nomes[i], arquivo)
		}

		// Fechar o arquivo para liberar ele para outras possíveis solitações
		Arquivos.fechar_arquivo(arquivo)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 108; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {arquivo, 7, 10, 7}-{i, 10, 16, 1}-{nomes, 4, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */