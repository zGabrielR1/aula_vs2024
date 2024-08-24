// M) Faça um programa que solicita o nome e o preço de venda de 10 produtos, 
// armazena os preços em um vetor e os nomes em outro e no final do programa imprime a relação de produtos 
// e seus respectivos preços, com o total da venda também.

programa {
	funcao inicio() {	
		real precos[10]
		cadeia nomes[10]
		para (inteiro i = 0; i < 10; i++) {
			escreva("Informe o nome do produto: ")
			leia(nomes[i])
			escreva("Infrome o preço deste produto: ")
			leia(precos[i])
			limpa()
		}

		para (inteiro i = 0; i < 10; i++) {
			escreva("Produto: " , nomes[i] , " - Preço: R$ " , precos[i] , " \n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 599; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */