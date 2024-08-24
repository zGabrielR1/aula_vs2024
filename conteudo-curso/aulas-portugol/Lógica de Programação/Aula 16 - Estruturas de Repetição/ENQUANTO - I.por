// I) Faça um programa que recebe a idade e o nome de várias pessoas, 
// no final imprimia quantas são maiores e menores de idade e 
// também quem foi a pessoa mais nova e mais velha a ser entrevistada.

programa {
	funcao inicio() {
		inteiro idade, qtd_pessoas, qtd_maiores = 0, qtd_menores = 0
		cadeia nome
		
		escreva("Informe a quantidade de pessoas: ")
		leia(qtd_pessoas)

		escreva("Informe o nome da 1ª pessoa: ")
		leia(nome)
		escreva("Informe a idade da 1ª  pessoa: ")
		leia(idade)
		
		inteiro idade_mais_velho = idade
		cadeia nome_mais_velho = nome
		inteiro idade_mais_novo = idade
		cadeia nome_mais_novo = nome
		
		se (idade >= 18) {
			qtd_maiores = qtd_maiores + 1
		} senao {
			qtd_menores = qtd_menores + 1
		}
		
		inteiro contador = 2
		enquanto (contador <= qtd_pessoas) {			
			escreva("Informe o nome da " , contador , "ª pessoa: ")
			leia(nome)
			escreva("Informe a idade da " , contador , "ª pessoa: ")
			leia(idade)

			se (idade >= 18) {
				qtd_maiores = qtd_maiores + 1
			} senao {
				qtd_menores = qtd_menores + 1
			}

			se (idade > idade_mais_velho) {
				idade_mais_velho = idade
				nome_mais_velho = nome
			}
			
			se (idade < idade_mais_novo) {
				idade_mais_novo = idade
				nome_mais_novo = nome
			}
			
			contador = contador + 1
		}
		
		limpa()
		escreva("Maiores de idade: " , qtd_maiores , " Menores de idade: " , qtd_menores , "\n")
		escreva("A pessoa mais velha é: " , nome_mais_velho , "\n")
		escreva("A pessoa mais nova é: " , nome_mais_novo , "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1199; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */