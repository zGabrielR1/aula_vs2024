// O) Para donos de carros flex, o álcool é mais vantajoso economicamente 
// se o preço não ultrapassar 45% do preço da gasolina.
// Escreva um programa de computador que indique ao motorista 
// qual combustível o mesmo deve utilizar (Gasolina ou Àlcool).

programa {
	funcao inicio() {
		real valor_litro_gasolina, valor_litro_alcool
		escreva("Informe o valor do litro da gasolina R$")
		leia(valor_litro_gasolina)
		escreva("Informe o valor do litro do álcool R$")
		leia(valor_litro_alcool)

		se (valor_litro_alcool < valor_litro_gasolina * 0.45) {
			escreva("É mais vantajoso abastecer álcool")
		} senao {
			escreva("É mais vantajoso abastecer gasolina")
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
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */