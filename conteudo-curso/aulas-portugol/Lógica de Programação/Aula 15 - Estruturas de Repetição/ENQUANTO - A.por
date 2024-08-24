// A) Faça um programa para "contar" até o limite informado pelo usuário, 
// fazendo um salto (incremento) também informado pelo usuário.

programa {
	funcao inicio() {
		inteiro limite, salto

		escreva("Informe até quando deve contar: ")
		leia(limite)
		escreva("Informe qual deve ser o salto incremental: ")
		leia(salto)

		inteiro contador = 0
		enquanto (contador <= limite) {
			escreva(contador,"\n")
			contador = contador + salto
		}

		escreva("Terminou")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 446; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */