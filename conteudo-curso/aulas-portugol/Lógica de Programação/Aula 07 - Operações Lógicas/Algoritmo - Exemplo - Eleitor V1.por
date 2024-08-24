programa {
	funcao inicio() {
		inteiro idade
		escreva("Informe a idade do eleitor: ")
		leia(idade)

		se (idade < 16) {
			escreva("Essa pessoa não pode votar!")
		} senao se (idade >= 18 e idade <= 65) {
			escreva("Eleitor obrigatório!")
		} senao {
			escreva("Eleitor facultativo!")
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 308; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */