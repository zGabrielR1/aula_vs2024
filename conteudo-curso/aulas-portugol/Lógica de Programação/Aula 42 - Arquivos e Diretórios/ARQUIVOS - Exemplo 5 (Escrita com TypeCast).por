programa{
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	funcao inicio() {
		// Pegando a nota do aluno
		real dbl_nota 
		escreva("Informe a nota do aluno: ")
		leia(dbl_nota)

		// Type Cast (Conversão de Tipos)
		cadeia str_nota = Tipos.real_para_cadeia(dbl_nota)

		// Abrir Arquivo
		inteiro arquivo = Arquivos.abrir_arquivo("D:/pasta1/pastaA/notas.txt", 2)

		// Escrevendo a linha no arquivo
		Arquivos.escrever_linha(str_nota, arquivo)

		// Fechar Arquivo
		Arquivos.fechar_arquivo(arquivo)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 184; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */