programa {
	funcao inicio() {
		inteiro altura
		escreva("Informe a altura da pessoa em cm: ")
		leia(altura)

		cadeia sexo
		escreva("Informe o sexo da pessoa (H para homem / M para mulher): ")
		leia(sexo)

		real peso_ideal
		se (sexo == "M" ou sexo == "m") {
			peso_ideal = (altura - 100) - (altura - 150) / 2
			escreva("O peso ideal desta pessoa é ",peso_ideal,"kg")
		} senao se (sexo == "H" ou sexo == "h") {
			peso_ideal = (altura - 100) - (altura - 150) / 4
			escreva("O peso ideal desta pessoa é ",peso_ideal,"kg")
		} senao {
			escreva("O sexo informado é inválido!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 422; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */