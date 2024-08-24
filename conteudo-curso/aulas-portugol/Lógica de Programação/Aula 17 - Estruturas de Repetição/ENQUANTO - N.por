// N) Faça um programa que leia tantos números quanto o usuário desejar e imprima a soma deles.

programa {
	funcao inicio() {
		inteiro total = 0
		real numero

		cadeia resposta = "sim"
		enquanto (resposta == "sim") {
			escreva("Informe um número: ")
			leia(numero)

			total = total + numero

			escreva("Deseja informar outro número (Sim/Não): ")
			leia(resposta)
		}
		
		escreva("O valor total dos valores digitados é " , total)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 302; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */