programa {
	funcao inicio() {
		inteiro idade
		escreva("Informe a idade do eleitor: ")
		leia(idade)

		se (idade < 16) {
			escreva("Essa pessoa não pode votar!")
		} senao se (idade == 16 ou idade == 17 ou idade > 65) {
			escreva("Eleitor facultativo")
		} senao {
			escreva("Eleitor obrigatório")
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 273; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */