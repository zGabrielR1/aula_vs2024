programa {
	funcao inicio() {
		real notas[8]
		para (inteiro i = 0; i < 8; i++) {
			escreva("Informe a nota do aluno: ")
			leia(notas[i])
			limpa()
		}
		
		para (inteiro i = 0; i < 8; i++) {
			escreva(notas[i] , "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 45; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {notas, 3, 7, 5}-{i, 4, 16, 1}-{i, 10, 16, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */