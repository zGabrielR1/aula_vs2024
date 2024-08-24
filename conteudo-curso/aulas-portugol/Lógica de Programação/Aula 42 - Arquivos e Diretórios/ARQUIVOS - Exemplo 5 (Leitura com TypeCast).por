programa {
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	funcao inicio() {
		// Abrir Arquivo
		inteiro arquivo = Arquivos.abrir_arquivo("D:/pasta1/pastaA/notas.txt", 0)

		// Interagir com o Arquivo
		cadeia str_nota
		real dbl_notas[3]
		para (inteiro i = 0; i < 3; i++) {
			// Lendo a linha do arquivo
			str_nota = Arquivos.ler_linha(arquivo)

			// Type Cast
			dbl_notas[i] = Tipos.cadeia_para_real(str_nota)
		}

		// Fechar Arquivo
		Arquivos.fechar_arquivo(arquivo)

		// Calcular a média do aluno
		real media = (dbl_notas[0] + dbl_notas[1] + dbl_notas[2]) / 3
		escreva("A média de notas lidas do arquivo é: ", media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 229; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */