// M) O mesmo exercício anterior, mas agora não será informado o número de mercadorias em estoque. 
// Então o funcionamento deverá ser da seguinte forma: 
// ler o valor da mercadoria e perguntar ‘MAIS MERCADORIAS (S/N)?’. 
// Ao final, imprimir o valor total em estoque e a média de valor das mercadorias em estoque.

programa {
	funcao inicio() {
		inteiro qtd_mercadorias = 0
		real valor_mercadoria, total_valores = 0

		cadeia resposta = "sim"
		enquanto (resposta == "sim") {
			escreva("Informe o valor da mercadoria: ")
			leia(valor_mercadoria)

			total_valores = total_valores + valor_mercadoria
			qtd_mercadorias = qtd_mercadorias + 1

			escreva("Deseja informar outra mercadoria (Sim/Não): ")
			leia(resposta)
		}
		
		real media = total_valores / qtd_mercadorias
		escreva("O valor total das mercadorias em estoque é: R$ " , total_valores , "\n")
		escreva("A média dos valores das mercadorias em estoque é: R$ " , media , "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 648; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */