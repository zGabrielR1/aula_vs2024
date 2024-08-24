// W) Escreva um algoritmo que descubra se um ano lido é bissexto. 
// Um ano é bissexto se ele for múltiplo de 4, exceto quando ele for múltiplo de 100. 
// Os anos múltiplos de 100 somente são bissextos quando são múltiplos de 400

programa {
	funcao inicio() {
		inteiro ano
		escreva("Informe um ano (ex: 2021) ")
		leia(ano)

		se ((ano % 4 == 0) e nao(ano % 100 == 0)) {
			escreva("É bissexto")
		} senao se ((ano % 100 == 0) e (ano % 400 == 0)) {
			escreva("É bissexto")
		} senao {
			escreva("Não é bissexto")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 529; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */