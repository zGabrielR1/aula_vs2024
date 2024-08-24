programa {
	inclua biblioteca Util
	funcao inicio() {
		cadeia vetor_frutas[] = { "laranja", "pera", "uva" }
		inteiro qtd_frutas = Util.numero_elementos(vetor_frutas)
		para (inteiro i = 0; i < qtd_frutas; i++) {
			escreva(vetor_frutas[i] , " \n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 194; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */