// Z) Faça um programa para converter um valor recebido em Bytes 
// nas opções abaixo (através de um menu):
// [1] Kilobyte	[2] Megabyte	[3] Gigabyte.

programa {
	inclua biblioteca Matematica	
	funcao inicio() {
		real bytes
		escreva("Informe o valor em Bytes: ")
		leia(bytes)

		inteiro opcao
		escreva("Informe o qual conversão deseja fazer: \n")
		escreva("[1] Kilobytes \n")
		escreva("[2] Megabytes \n")
		escreva("[3] Gigabytes \n")
		leia(opcao)

		real resultado
		escolha (opcao) {
			caso 1:
				resultado = bytes / Matematica.potencia(2, 10)
				resultado = Matematica.arredondar(resultado, 2)
				escreva(bytes , " Bytes equivale a " , resultado , "KB")
				pare
			caso 2:
				resultado = bytes / Matematica.potencia(2, 20)
				resultado = Matematica.arredondar(resultado, 2)
				escreva(bytes , " Bytes equivale a " , resultado , "MB")
				pare
			caso 3:
				resultado = bytes / Matematica.potencia(2, 30)
				resultado = Matematica.arredondar(resultado, 2)
				escreva(bytes , " Bytes equivale a " , resultado , "GB")
				pare
			caso contrario:
				escreva("Opçao inválida!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 924; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */