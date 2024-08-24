// H) Faça um programa para ler: Quantidade atual em estoque, quantidade máxima em estoque e quantidade mínima em estoque de um produto. 
// Calcular e informar a quantidade média (quantidade média = (quantidade máxima + quantidade mínima) / 2).
// Se a quantidade atual em estoque for maior ou igual a quantidade média 
// exibir a mensagem "Não efetuar compra", caso contrário escrever a mensagem "Efetuar compra".

programa {
	funcao inicio() {
		real qtd_atual, qtd_maxima, qtd_minima
		escreva("Informe qual é a quantidade atual, do produto, em estoque: ")
		leia(qtd_atual)
		escreva("Informe qual é a quantidade mínima deste produto: ")
		leia(qtd_minima)
		escreva("Informe qual é a quantidade máxima deste produto: ")
		leia(qtd_maxima)

		real qtd_media = (qtd_maxima + qtd_minima) / 2

		se (qtd_atual >= qtd_media) {
			escreva("Não efetuar compra")
		} senao {
			escreva("Efetuar compra")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 795; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */