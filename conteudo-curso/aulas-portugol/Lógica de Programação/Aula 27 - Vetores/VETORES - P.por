// P) Faça um programa que solicite 10 números inteiros e armazene os mesmos dentro de um vetor. 
// Detalhe: O programa não deve permitir que o usuário insira valores repetidos, 
// se isso acontecer deverá ser infromado ao usuário e ele deverá informar um novo valor.

programa {
	funcao inicio() {
		inteiro valores[10], valor
		logico encontrou_iguais, continuar = verdadeiro
		
		inteiro i = 0
		enquanto (i < 10) {
			escreva("Informe um valor inteiro: (não repita valores): ")
			leia(valor)

			encontrou_iguais = falso
			para (inteiro j = 0; j < 10; j++) {
				se (valor == valores[j]) {
					encontrou_iguais = verdadeiro
				}
			}
			
			se (encontrou_iguais == falso) {
				valores[i] = valor
				i++
			}

			limpa()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 566; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valores, 7, 10, 7}-{valor, 7, 23, 5}-{i, 10, 10, 1}-{j, 16, 17, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */