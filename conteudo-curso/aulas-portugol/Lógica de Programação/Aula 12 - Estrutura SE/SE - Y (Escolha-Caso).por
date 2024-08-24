// Y) Faça uma calculadora, que recebe do usuário 2 números e a operação matemática desejada, 
// calcula os números e exibe o resultado na tela (tratar o erro de divisão por 0). 
// Para isso considere as opções de cálculo abaixo:
// [1] Adição 
// [2] Subtração 
// [3] Multiplicação 
// [4] Divisão

programa {
	funcao inicio() {	
		real numero1, numero2
		escreva("Informe o primeiro número: ")
		leia(numero1)
		escreva("Informe o segundo número: ")
		leia(numero2)

		inteiro opcao
		escreva("########################## \n")
		escreva("        CALCULADORA        \n")
		escreva("########################## \n")
		escreva("[1] Adição \n")
		escreva("[2] Subtração \n")
		escreva("[3] Multiplicação \n")
		escreva("[4] Divisão \n")
		leia(opcao)

		real resultado
		escolha (opcao) {
			caso 1:
				resultado = numero1 + numero2
				escreva(numero1 , " + " , numero2 , " = " , resultado)
				pare
			caso 2:
				resultado = numero1 - numero2
				escreva(numero1 , " - " , numero2 , " = " , resultado)
				pare
			caso 3:
				resultado = numero1 * numero2
				escreva(numero1 , " x " , numero2 , " = " , resultado)
				pare
			caso 4:
				se (numero2 == 0) {
					escreva("Não é possível dividir por zero!")
				} senao {
					resultado = numero1 / numero2
					escreva(numero1 , " : " , numero2 , " = " , resultado)
				}
				pare
			caso contrario:
				escreva("Opção inválida")
		}
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