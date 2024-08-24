// G) Faça um programa que repita até o usuário informar para parar.

programa {
	funcao inicio() {
		cadeia resposta = "sim"

		enquanto (resposta == "sim") {
			escreva("Olá Mundo \n")
			escreva("Deseja repetir mais uma vez? (Sim/Não) ")
			leia(resposta)
		}

		escreva("Terminou de repetir")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 186; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */