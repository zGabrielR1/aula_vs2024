programa {
	inclua biblioteca Arquivos 
	inclua biblioteca Tipos
	inclua biblioteca Texto
	inclua biblioteca Calendario
	
	funcao imprimir_menu() {
		escreva("###### BEM VINDO AO SISTEMA ###### \n")
		escreva("######    MENU DE OPÇÕES    ###### \n")
		escreva("#[1] Cadastrar Produto           # \n")
		escreva("#[2] Ver Produtos                # \n")
		escreva("#[3] Nova Venda                  # \n")
		escreva("#[4] Sair                        # \n")
	}

	funcao logico validacao1(cadeia nome, real valor) {
		se(nome != "" e valor > 0){
			retorne verdadeiro
		} senao retorne falso
	}

  	funcao logico busc_produto(cadeia nome) {
    		logico encontrou = falso
    		inteiro abrir_produtos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)

		enquanto (nao Arquivos.fim_arquivo(abrir_produtos) e encontrou == falso) {
			cadeia produtos = Arquivos.ler_linha(abrir_produtos)
			se (produtos == nome) {
				encontrou = verdadeiro
				Arquivos.fechar_arquivo(abrir_produtos)
				retorne verdadeiro
			} 
      	}
      	Arquivos.fechar_arquivo(abrir_produtos)
      	retorne falso
  	}
	
	inteiro opcao
	funcao inicio() {
		faca {
			imprimir_menu()
			leia(opcao)		
			limpa()
			
			
			escolha(opcao) {
				caso 1:	
					logico validacao = falso
					enquanto(validacao == falso) {
						escreva("###### CADASTRANDO EM ANDAMENTO ###### \n")
						escreva("Informe o Nome do Produto: ")
						cadeia nome
						leia(nome)
						
						escreva("Informe o valor do Produto: R$")
						real valor
						leia(valor)
				
						limpa()
				
						se (validacao1(nome, valor)) {
							validacao = verdadeiro
							inteiro abrir_nome = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
							inteiro abrir_valor = Arquivos.abrir_arquivo("D:/valores.txt", 2)	
							
							Arquivos.escrever_linha(nome, abrir_nome)
							cadeia Valor = Tipos.real_para_cadeia(valor)
							Arquivos.escrever_linha(Valor, abrir_valor)
	
							
							Arquivos.fechar_arquivo(abrir_nome)
							Arquivos.fechar_arquivo(abrir_valor)
							escreva("NOVO PRODUTO GRAVADO COM SUCESSO!\n")
						} senao {
						 	escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
						}
					}
					pare
						
				caso 2:
					inteiro abrir_produto = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
					inteiro abrir_valor = Arquivos.abrir_arquivo("D:/valores.txt", 0)
				
					escreva("######### \tCONSULTA ESTOQUE \t########### \n")
					escreva("PRODUTO\t\t\t|\t\tPREÇO R$ \n")
					inteiro total_produtos = 0
					real valor_total = 0.0
						
					enquanto(nao Arquivos.fim_arquivo(abrir_produto)) {
						cadeia produtos = Arquivos.ler_linha(abrir_produto)
						se (produtos == "") {
							escreva("\n")
							pare
						}	
								
						cadeia valor_cadeia = Arquivos.ler_linha(abrir_valor)
						real valor = Tipos.cadeia_para_real(valor_cadeia)
						escreva(produtos)
							
						valor_total = valor_total + valor
						total_produtos = total_produtos + 1
							
						inteiro carac = Texto.numero_caracteres(produtos)
						se (carac > 7 e carac <= 14) {
							escreva("\t\t|")
						} senao se (carac >= 15 e carac < 24) {
							escreva("\t\t|")
						} senao se (carac <= 7) {
							escreva("\t\t\t|")
						} senao se (carac >= 24) {
							escreva("|")
						}
							
						escreva("\t\t",valor_cadeia,"\n")
					}
							
					inteiro opcao1 = 0
					escreva("Qtd de produtos em estoque: ",total_produtos,"\n")
					escreva("Valor total do estoque: ",valor_total,"\n\n")
					escreva("[1] Voltar para o Menu Principal\n")
					escreva("[2] Consultar o produto pelo nome\n")
					leia(opcao1)
	
					Arquivos.fechar_arquivo(abrir_produto)
					Arquivos.fechar_arquivo(abrir_valor)
	
					se (opcao1 == 2) {
						limpa()
						escreva("######### BUSCA DE PRODUTO ###########\n")
						escreva("Informe o nome do produto: ")
						cadeia produto
						leia(produto)
	
						se (busc_produto(produto)) {
							limpa()
							escreva("\tPRODUTO LOCALIZADO!\n")
							pare
						} senao {
							limpa()
							escreva("\tPRODUTO INEXISTENTE!\n")
							pare
						}
						
						} senao se (opcao1 == 1) {
							limpa()
							pare
								
						} senao se (opcao1 != 1 ou opcao1 != 2) {
							limpa()
							escreva("Opção Inválida!\n")
							opcao = 4
							pare
						}
													
				caso 3:
					inteiro dia = Calendario.dia_mes_atual()
					inteiro ano = Calendario.ano_atual()
					inteiro mes = Calendario.mes_atual()
					inteiro hora = Calendario.hora_atual(falso)
					inteiro minuto = Calendario.minuto_atual()
					inteiro segundo = Calendario.segundo_atual()
					inteiro faturamento
					cadeia nome
						
					se (mes < 9) {
						faturamento = Arquivos.abrir_arquivo("D:/Venda_"+ano+"-"+"0"+mes+"-"+dia+"_"+hora+"-"+minuto+"-"+segundo+".txt", 2)
						nome = "D:/Venda_"+ano+"-"+"0"+mes+"-"+dia+"_"+hora+"-"+minuto+"-"+segundo+".txt"
					} senao {
						nome = "D:/Venda_"+ano+"-"+mes+"-"+dia+"_"+hora+"-"+minuto+"-"+segundo+".txt"
						faturamento = Arquivos.abrir_arquivo("D:/Venda_"+ano+"-"+mes+"-"+dia+"_"+hora+"-"+minuto+"-"+segundo+".txt", 2)
					}
					
					cadeia opcao_s_n
				  	real valor_produto_venda
				  	cadeia nome_produto_venda
					real valor_cliente
				     real total_faturamento = 0.0
					
					faca {
				     	escreva("######### VENDA EM ANDAMENTO ########### \n")
				          escreva("Informe o Nome do Produto: ")
				          leia(nome_produto_venda)
				
				          escreva("Informe o Valor do Produto: ")
				          leia(valor_produto_venda)
	                		
						total_faturamento = total_faturamento + valor_produto_venda
	
				          escreva("\nDeseja incluir mais um produto na venda? \n")
				          escreva("[S] Sim \n")
				          escreva("[N] Não \n")
				          leia(opcao_s_n)
				          limpa()
				          
				          opcao_s_n = Texto.caixa_baixa(opcao_s_n)
				
				          cadeia valor_produto = Tipos.real_para_cadeia(valor_produto_venda)
	
						inteiro carac = Texto.numero_caracteres(nome_produto_venda)
						se (carac > 7 e carac <= 14) {
							Arquivos.escrever_linha(nome_produto_venda+"\t\t|\t\t"+valor_produto, faturamento)
						} senao se (carac >= 15 e carac < 24) {
							Arquivos.escrever_linha(nome_produto_venda+"\t\t|\t\t"+valor_produto, faturamento)
						} senao se (carac <= 7) {
							Arquivos.escrever_linha(nome_produto_venda+"\t\t\t|\t\t"+valor_produto, faturamento)
						} senao se (carac >= 24) {
							Arquivos.escrever_linha(nome_produto_venda+"|\t\t"+valor_produto, faturamento)
						}
	
						se(opcao_s_n == "n" ou opcao_s_n == "nao" ou opcao_s_n == "não") {
				
			          		Arquivos.fechar_arquivo(faturamento)
			
				          	escreva("###########\t FATURAMENTO \t###########\n")
				          
				          	inteiro faturamentos = Arquivos.abrir_arquivo(nome, 0)
				
				          	enquanto(nao Arquivos.fim_arquivo(faturamentos)) {
				           		cadeia produtos = Arquivos.ler_linha(faturamentos)
				           		escreva(produtos,"\n")
				            	}
				          
				          	Arquivos.fechar_arquivo(faturamentos)
				
				          	inteiro escrever_final = Arquivos.abrir_arquivo(nome, 2)
				
				         		escreva("Total a ser pago: R$",total_faturamento,"\n")
					          escreva("Informe o valor pago pelo cliente: ")
					          leia(valor_cliente)
					
					          Arquivos.escrever_linha("Total a ser pago: R$"+total_faturamento, escrever_final)
					          Arquivos.escrever_linha("Informe o valor pago pelo cliente: "+valor_cliente, escrever_final)
					
					          Arquivos.fechar_arquivo(escrever_final)
					
					          limpa()
					          
					          escreva("FATURAMENTO REALIZADO COM SUCESSO!\n")	        
						}
					} enquanto(opcao_s_n == "s" ou opcao_s_n == "sim" )
					pare
	
				caso 4:
					escreva("Saindo do sistema...\n")
					pare
					
				caso contrario: 
					escreva("Opção Inválida!\n")
					opcao = 4				
			}
		} enquanto (opcao != 4) 
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7964; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */