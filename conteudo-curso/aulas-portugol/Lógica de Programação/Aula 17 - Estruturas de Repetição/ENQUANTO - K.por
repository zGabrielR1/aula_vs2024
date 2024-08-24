// K) A prefeitura de uma cidade deseja fazer uma pesquisa entre seus habitantes. 
// Faça um algoritmo para coletar os dados sobre o salário e número de filhos de cada habitante 
// e após as leituras, exibir um relatório com:
// • Média de salário da população;
// • Média do número de filhos;
// • Maior salário dos habitantes;
// • Percentual de pessoas com salário menor que R$ 1045,00.

programa {
	funcao inicio() {
		inteiro qtd_pessoas, qtd_sal_abaixo = 0, qtd_filhos, total_filhos = 0
		real salario, total_salarios = 0, maior_salario = 0

		escreva("Informe a quantidade de pessoas: ")
		leia(qtd_pessoas)

		inteiro contador = 1
		enquanto (contador <= qtd_pessoas) {
			escreva("Informe o salário da " , contador , "º pessoa: ")
			leia(salario)
			escreva("Informe a quantidade de filhos da " , contador , "º pessoa: ")
			leia(qtd_filhos)

			se (salario < 1045) {
				qtd_sal_abaixo = qtd_sal_abaixo + 1
			}

			se (salario > maior_salario) {
				maior_salario = salario
			}
			
			total_salarios = total_salarios + salario
			total_filhos = total_filhos + qtd_filhos
			contador = contador + 1
		}
		
		real percentual = qtd_sal_abaixo / qtd_pessoas * 100
		real media_salario = total_salarios / qtd_pessoas
		real media_filhos = total_filhos / qtd_pessoas

		escreva("A média do salário da população é: " , media_salario , "\n")
		escreva("A média de filhos da população é: " , media_filhos , "\n")
		escreva("O percentual da populção com salário abaixo de 800 é: " , percentual , "% \n")
		escreva("O maior salário foi: " , maior_salario , "\n")
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