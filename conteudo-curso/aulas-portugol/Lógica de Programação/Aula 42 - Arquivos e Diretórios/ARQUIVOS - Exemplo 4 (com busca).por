// Fazer programa para ler os dados do arquivo "alunos.txt"

programa {
	inclua biblioteca Arquivos
	funcao inicio() {
		// Entrada do nome
		cadeia nome
		escreva("Informe o nome que deseja buscar no arquivo: ")
		leia(nome)
		
		// Abrir arquivo
		inteiro arquivo = Arquivos.abrir_arquivo("D:/pasta1/pastaB/alunos.txt", 0)

		// Fazer a leitura
		logico encontrou = falso
		enquanto (nao Arquivos.fim_arquivo(arquivo)) {
			se (nome == Arquivos.ler_linha(arquivo)) {
				encontrou = verdadeiro
			}
		}

		// Fechar o arquivo
		Arquivos.fechar_arquivo(arquivo)

		// Verificando se encotnrou o nome
		se (encontrou) {
			escreva("Nome encontrado")
		} senao {
			escreva("Este nome não foi encontrado no arquivo!")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 700; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */