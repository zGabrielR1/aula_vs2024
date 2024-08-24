// Fazer programa para ler os dados do arquivo "alunos.txt"

programa {
	inclua biblioteca Arquivos
	funcao inicio() {
		// Abrir arquivo
		inteiro arquivo = Arquivos.abrir_arquivo("D:/pasta1/pastaB/alunos.txt", 0)

		// Fazer a leitura
		cadeia linha
		enquanto (nao Arquivos.fim_arquivo(arquivo)) {
			linha = Arquivos.ler_linha(arquivo)
			escreva(linha,"\t")
		}

		// Fechar o arquivo
		Arquivos.fechar_arquivo(arquivo)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 0; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {linha, 10, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */