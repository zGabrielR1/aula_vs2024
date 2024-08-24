// D) Faça um programa que recebe um número inteiro (maior do que 0 e menor ou igual a 10) 
// e exibe a tabuda (até 10) de multiplicação deste número. 
// Para esse programa crie uma função de validação do número digitado 
// e um procedimento que imprime a tabuada.

// FUNCAO: Deverá receber como parâmetro o número informado e verificar se ele 
// está dentro do intervalo permitido (entre 1 e 10) e retornar 
// um valor lógico (VERDADEIRO para número válido e FALSO para número invalido). 
// Cada vez que for digitado um número inválido no programa principal, com ajuda desta função, 
// deverá exibir uma mensagem "Número inválido. Digite novamente!".

// PROCEDIMENTO: Receberá como parâmetro o número inteiro validado e deverá imprimr na tela, 
// usando uma estrutura de repetição, a tabuada de multiplicação até 10 do número lido.
// Exemplo: número lido 5
// 5 x 1 = 5
// 5 x 2 = 10
// ....
// 5 x 10 = 50

programa {
	// Função de validação
	funcao logico eh_valido(inteiro numero) {
		se (numero >= 1 e numero <= 10) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	// Procedimento para imprimir a tabuada
	funcao imprimir_tabuada(inteiro numero) {
		para (inteiro i = 1; i <= 10; i++) {
			escreva(numero , " x " , i , " = " , numero * i , "\n")
		}
	}

	// Programa principal
	funcao inicio() {
		inteiro valor
		faca {
			escreva("Informe um número inteiro (entre 1 e 10): ")
			leia(valor)
		} enquanto (nao eh_valido(valor))
		imprimir_tabuada(valor)
	}
}




















/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1487; 
 * @PONTOS-DE-PARADA = 39;
 * @SIMBOLOS-INSPECIONADOS = {numero, 22, 33, 6}-{numero, 31, 33, 6}-{i, 32, 16, 1}-{valor, 39, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */