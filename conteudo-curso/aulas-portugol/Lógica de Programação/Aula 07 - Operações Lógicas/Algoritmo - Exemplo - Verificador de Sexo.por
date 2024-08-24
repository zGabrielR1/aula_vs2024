programa {
	funcao inicio() {
		cadeia nome
		escreva("Informe o nome da pessoa: ")
		leia(nome)

		cadeia sexo
		escreva("Informe o sexo da pessoa (H para homem/M para mulher): ")
		leia(sexo)

		se (sexo == "M" ou sexo == "m") {
			escreva(nome," é do sexo feminino")	
		} senao se (sexo == "H" ou sexo == "h") {
			escreva(nome," é do sexo masculino")
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
 * @POSICAO-CURSOR = 234; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */