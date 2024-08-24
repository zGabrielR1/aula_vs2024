programa {
	funcao inicio() {
		real nota, total_notas = 0
		inteiro qtd_notas
		escreva("Informe a quantidade de notas: ")
		leia(qtd_notas)
		
		inteiro contador = 1
		enquanto (contador <= qtd_notas) {
			escreva("Informe a " , contador , "ª nota do aluno: ")
			leia(nota)

			// Acumulador
			total_notas = total_notas + nota

			// Incrementador
			contador = contador + 1
		}

		// Calcular a média
		real media = total_notas / qtd_notas

		// Saída
		escreva("A média do aluno é " , media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 422; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nota, 3, 7, 4}-{total_notas, 3, 13, 11}-{qtd_notas, 4, 10, 9}-{contador, 8, 10, 8}-{media, 21, 7, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */