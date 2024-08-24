programa{ inclua   biblioteca Matematica
	
	funcao inicio(){

		
		escreva("##LOGIN DO SISTEMA##")
		cadeia usuario 
		escreva("\nInforme o usuario  ")
		leia (usuario) 
	
	
		cadeia senha 
		escreva("Informe a senha ") 
		leia (senha)
	
			se (usuario == "operador" e senha == "123abc_") {
			escreva("usuario e senha corretos , \n #####SEJA BEM VINDO##### \n", "MENU DAS OPÇÕES\n")
			limpa()
	
		inteiro opcao 
		escreva("[1] NOVA VENDA \n ")
		escreva("[2] SAIR DO SISTEMA\n")
		leia(opcao) 
		limpa()
	
		cadeia resposta = "sim "
		real valor_produto = 0
		real valor_total = 0
		real valor_pago_cliente = 0
		inteiro qtd_produtos= 0
		real troco = 0
		cadeia O_valor_suficiente
		
					
					escolha(opcao) {
					caso 1:
							escreva("###VENDA EM ANDAMENTO### \n ")
							
						faca{
								escreva("Informe o valor do produto (R$)")
								leia(valor_produto)
									
								limpa()
									
								qtd_produtos ++
								valor_total = valor_total + valor_produto 
									
								
								escreva("###DESEJA INCLUIR MAIS ALGUM PRODUTO NA VENDA ? ###\n")
								escreva("sim\n")
								escreva("não\n")
						
									leia(resposta)
						
							
					
							}enquanto(resposta =="sim" ou resposta =="S")
							limpa()

								Matematica.arredondar(valor_total, 2)
								escreva("###RESUMO DA VENDA###\n")
								escreva("Informe a quantidade de produtos", qtd_produtos,"R$\n")
								escreva("Informe o valor total a ser pago",valor_total,"R$\n")
								escreva("Informe o valor pago pelo cliente ", "R$\n")
								leia(valor_pago_cliente)
								
						se (valor_pago_cliente<valor_total){
							troco = valor_total - valor_pago_cliente
							escreva("O cliente deve ",troco)
						}senao se(valor_pago_cliente>valor_total) {
							troco =valor_pago_cliente - valor_total
							escreva("O troco do cliente será", troco)
							
						} senao {
							escreva("O valor suficinetepara finalizar a compra")
						}
						
						
					caso 2 : 
						escreva("saindo do sistema")
			
					
				 	caso contrario: 
						escreva("opção invalida..")
					
					
					pare}
					
			
						}senao {
					escreva("usuario e senha invalidos ")}

	}
} 
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1178; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */