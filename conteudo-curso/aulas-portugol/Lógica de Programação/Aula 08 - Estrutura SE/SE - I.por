// I) Faça um programa que recebe o prefixo correspondente ao estado de um indivíduo 
// (ex: RS, SC etc.) e exibe na tela qual é a região (geográfica) do mesmo.

programa {
	inclua biblioteca Texto
	
	funcao inicio() {
		cadeia estado
		escreva("Informe o seu estado (UF): ")
		leia(estado)

		estado = Texto.caixa_alta(estado)

		se (estado == "RS" ou estado == "SC" ou estado == "PR") {
			escreva("Região Sul")
		} senao se (estado == "SP" ou estado == "RJ" ou estado == "MG" ou estado == "ES") {
			escreva("Região Sudeste")
		} senao se (estado == "MS" ou estado == "MT" ou estado == "GO" ou estado == "DF") {
			escreva("Região Centro-oeste")
		} senao se (estado == "AM" ou estado == "PA" ou estado == "TO" ou estado == "AC" ou estado == "RR" ou estado == "RO" ou estado == "AP") {
			escreva("Região Norte")
		} senao se (estado == "BA" ou  estado == "AL" ou estado == "SE" ou estado == "PE" ou estado == "PB" ou estado == "RN" ou estado == "CE" ou estado == "MA" ou estado == "PI") {
			escreva("Região Nordeste")
		} senao {
			escreva("Este valor não corresponde a um estado do Brasil")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 235; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */