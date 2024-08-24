// B) Faça um programa que solicita ao usuário a quantidade real em estoque, 
// e a quantidade miníma em estoque de 5 produtos, armazena estes valores em 
// uma matriz e cálcula a diferença entre os dois valores e armazena em um vetor.

programa {
	funcao inicio() {
		real produtos[5][2]
		
		// Preenchendo a matriz
		para (inteiro i = 0; i < 5; i++) {
			escreva("informe a quantidade real em estoque: ")
			leia(produtos[i][0])
			escreva("Informe a quantidade mínima em estoque: ")
			leia(produtos[i][1])			
		}

		// Calculando e armazenando o saldo do estoque
		real diferenca[5]
		para (inteiro i = 0; i < 5; i++) {
			diferenca[i] = produtos[i][0] - produtos[i][1]
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 674; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {produtos, 7, 7, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */