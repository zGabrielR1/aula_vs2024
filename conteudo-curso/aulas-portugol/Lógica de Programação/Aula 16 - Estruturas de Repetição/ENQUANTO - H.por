// H) Faça um programa que recebe a idade de 10 pessoas, 
// e no final imprima quantas são menores de idade e quantas são maiores de idade.

programa {
	funcao inicio() {
		inteiro idade, qtd_maiores = 0, qtd_menores = 0

		inteiro contador = 1
		enquanto (contador <= 10) {
			escreva("Informe a idade da " , contador , "ª pessoa: ")
			leia(idade)

			se (idade >= 18) {
				qtd_maiores = qtd_maiores + 1
			} senao {
				qtd_menores = qtd_menores + 1
			}
			
			contador = contador + 1
		}
		
		escreva("A quantidade de pessoas maiores de idade foi: " , qtd_maiores , "\n")
		escreva("A quantidade de pessoas menores de idade foi: " , qtd_menores)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 420; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {idade, 6, 10, 5}-{qtd_maiores, 6, 17, 11}-{qtd_menores, 6, 34, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */