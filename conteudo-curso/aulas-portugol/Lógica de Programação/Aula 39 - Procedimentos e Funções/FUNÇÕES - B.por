// Faça um programa que recebe dois valores numéricos e verifica 
// se o primeiro é divisível pelo segundo (resto 0). 
// Esta verificação deve ser feita por uma função, 
// que retorna VERDADEIRO se for divisível ou FALSO se não for divisível. 
// No final do programa deverá ser informado o resultado, 
// se são divisíveis ou não.
programa
{
	funcao logico divisivel(inteiro a, inteiro b) {
		se (a % b == 0) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}
	
	funcao inicio()
	{	
		inteiro n1, n2
		
		escreva("Informe o primeiro número ")
		leia(n1)
		escreva("Informe o segundo número ")
		leia(n2)

		se (divisivel(n1,n2)) {
			escreva("É divisivel")
		} senao {
			escreva("Não é divisivel")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 715; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */