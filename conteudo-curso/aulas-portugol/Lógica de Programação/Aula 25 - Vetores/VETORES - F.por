// F) Faça um programa que solicite 10 números inteiros e armazene os mesmos dentro de um vetor. 
// Após a leitura total dos 10 números, o programa deve imprimir na tela 
// esses 10 números lidos na ordem inversa.

programa {
	funcao inicio() {
		inteiro valores[10]

		para (inteiro i = 0; i < 10; i++) {
			escreva("Informe um número inteiro: ")
			leia(valores[i])
		}
		
		para (inteiro i = 9; i >= 0; i--) {
			escreva(valores[i] , " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 376; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valores, 7, 10, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */