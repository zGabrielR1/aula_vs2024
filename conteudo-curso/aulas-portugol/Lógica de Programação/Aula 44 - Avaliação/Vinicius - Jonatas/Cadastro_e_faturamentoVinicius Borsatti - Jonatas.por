programa{
	inclua biblioteca Calendario
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	
    funcao imprimir_menu() {
		escreva(" ##### BEM VINDO #####  \n")
		escreva("[1] CADASTRAR PRODUTO \n")
		escreva("[2] VER PRODUTO  \n")
		escreva("[3] NOVA VENDA \n")
		escreva("[4] SAIR \n")
	}
	funcao logico buscar(cadeia nome_produto) {
		inteiro produtos_arquivo = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
		enquanto (nao Arquivos.fim_arquivo(produtos_arquivo)){
			se(nome_produto == Arquivos.ler_linha(produtos_arquivo)) {
				Arquivos.fechar_arquivo(produtos_arquivo)
				retorne verdadeiro
			} 
		} 
		Arquivos.fechar_arquivo(produtos_arquivo)
		retorne falso
	}
	funcao logico verificacao(cadeia produtos, inteiro precos) {
		se (precos > 0 e produtos != "") {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao inicio(){
		real valores
		real valor_final = 0.0
		inteiro opcao 
		inteiro  i = 0 
		inteiro  produtos_qtd = 0 
		inteiro  redirecionar
		cadeia produtos 
		cadeia  buscar_produto		
		faca {	
			imprimir_menu()
			leia (opcao)	
			limpa()	
			escolha (opcao) {
				caso 1:
				
					inteiro precos_arquivo = Arquivos.abrir_arquivo("D:/precos.txt", 2)
					inteiro produtos_arquivo = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
					i = 0
					enquanto (i == 0) {
						escreva ("\n CADASTRO EM ANDAMENTO \n")
						escreva ("Informe o nome do Produto: ")
						leia (produtos)
						escreva ("Informe o valor do Produto: R$ ")
						leia (valores)

						se (verificacao(produtos,valores)){
							Arquivos.escrever_linha("\n"+produtos, produtos_arquivo)
							Arquivos.escrever_linha ("\n"+valores, precos_arquivo)
							i++
							produtos_qtd++
							
						} senao{
							limpa()
							escreva ("Os dados estão errados VERIFQUE!\n")
						}
					}

					limpa()
					escreva (" Poduto gravado com sucesso !")
					
					Arquivos.fechar_arquivo(produtos_arquivo)
					Arquivos.fechar_arquivo(precos_arquivo)

				pare
				caso 2:

					produtos_qtd = -1
					
					inteiro precos_imprimir = Arquivos.abrir_arquivo("D:/preco.txt", 0)
					inteiro produtos_imprimir = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
					cadeia soma
					real soma1, soma2 = 0								
					escreva ("\n######## CONSULTA DE ESTOQUE ########\n")
					escreva ("Poduto\tPreço R$")
					
					faca{
						soma= (Arquivos.ler_linha(precos_imprimir))
						se (soma != ""){
							soma1 = Tipos.cadeia_para_real(soma)
							soma2 = soma2 + soma1	
						}	
						escreva("\n" ,Arquivos.ler_linha(produtos_imprimir), "\t\t", soma)
						produtos_qtd++
					} enquanto ( nao Arquivos.fim_arquivo(precos_imprimir))
						escreva ("Total de produtos no estoque: " ,produtos_qtd,"\n")
						escreva ("Preço total do estoque: R$ " ,soma2,"\n")
							 
						Arquivos.fechar_arquivo(produtos_imprimir)
						Arquivos.fechar_arquivo(precos_imprimir)
						escreva ("\n[1] Voltar para o Menu Principal")
						escreva ("\n[2] Consultar produto pelo NOME\n")
						leia(redirecionar)
					escolha (redirecionar) {
						caso 1:
							limpa()
						pare
						caso 2:						
							limpa()
							escreva ("\n######## BUSCA DE PRODUTO ########\n")
							escreva("Informe o nome do Produto: ")
							leia(buscar_produto)
							buscar(buscar_produto)
							se (buscar(buscar_produto) == verdadeiro) {
								limpa()
								escreva("Produto achado com sucesso !")
							} senao {
								limpa()
								escreva(" O Produto não existe!")
							}
						pare
						caso contrario:
							limpa()
							escreva ("Opção invalida!\n")
							opcao = 4
					}
				pare
				caso 3:
					inteiro produto_preco, valor_pago
					real total = 0
					cadeia venda_produto
					cadeia parar = "N"
					cadeia data = "Data:" + Calendario.ano_atual() + "/" + Calendario.mes_atual() + "/" + Calendario.dia_mes_atual()
					cadeia hora = "Hora:" + Calendario.hora_atual(falso) + ":" + Calendario.minuto_atual()
					cadeia nome_arquivo = data + "|" + hora
					inteiro arquivo = Arquivos.abrir_arquivo("D:/Nova_venda_"+nome_arquivo+".txt", 1)
					
					faca {
						escreva ("VENDA EM ANDAMENTO \n")
						escreva("Informe o nome do produto: ")
						leia(venda_produto)
						escreva("Informe o valor do produto: R$ ")
						leia( produto_preco)
						limpa()
						se (verificacao(venda_produto, produto_preco)){
							Arquivos.escrever_linha("\n"+venda_produto+"\t"+ produto_preco, arquivo)					
						} senao{
							limpa()
							escreva ("Os dados estão errados VERIFQUE!\n")
						}
						total = total + produto_preco
						escreva ("Deseja incluir mais um produto na venda?\n")
						escreva(" Sim [S] \n ")
						escreva(" Não [N]\n")
						leia(parar)
						limpa()
					}enquanto (parar != "n" e parar != "N")
						Arquivos.fechar_arquivo(arquivo)
						escreva ("\n FATURAMENTO \n")
						escreva ("Produto\t Preco R$")
						arquivo = Arquivos.abrir_arquivo("D:/venda_"+nome_arquivo+".txt", 0)
					faca{
						escreva("\n" ,Arquivos.ler_linha(arquivo))
					    }enquanto ( nao Arquivos.fim_arquivo(arquivo))
							Arquivos.fechar_arquivo(arquivo)
							arquivo = Arquivos.abrir_arquivo("D:/venda_"+nome_arquivo+".txt", 2)
							escreva ("Total a pagar: R$ " ,total,"\n")
							escreva ("Informe o valor pago  R$ ")
							leia(valor_pago)
							Arquivos.escrever_linha("Valor pago R$" + valor_pago, arquivo)
															
						Arquivos.fechar_arquivo(arquivo)
						limpa()
						escreva ("Faturamento finalizado com secesso !")
				pare
				caso 4:
					limpa()
					escreva ("Saindo do progrma......... \n")
				pare
				caso contrario:
					escreva ("\n Opção invalida!")
			} 
		} enquanto ( opcao != 4)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5535; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */