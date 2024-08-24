programa {
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	inclua biblioteca Calendario
	
	funcao imprimir_menu() {
		
		escreva("\n----- BEM VINDO AO SISTEMA -----\n")
		escreva("         MENU DE OPÇÕES         \n")
		escreva("[1] Cadastrar produto\n")
		escreva("[2] Ver produtos\n")
		escreva("[3] Nova venda\n")
		escreva("[4] Sair\n")
	}

	funcao logico eh_valido (cadeia nome_produto, real valor_produto) {
		se(nome_produto == "" ou valor_produto <= 0.0) {
			logico valido_ou_nao = falso
			retorne valido_ou_nao 
		}senao {
			logico valido_ou_nao = verdadeiro
			retorne valido_ou_nao 
		}
	}

	
	funcao logico produto_foi_encontrado (cadeia produto_encontrado) {

		// Abrir arquivo
		inteiro arquivo = Arquivos.abrir_arquivo("D:/produtos.txt", 0)

		// Fazer a leitura
		cadeia linha = ""
		enquanto (nao Arquivos.fim_arquivo(arquivo)) {
			linha = Arquivos.ler_linha(arquivo)
		}

		// Fechar o arquivo
		Arquivos.fechar_arquivo(arquivo)
		
			se(linha == produto_encontrado) {
				logico foi_encontrado = verdadeiro
				retorne foi_encontrado 
			}senao {
				logico foi_encontrado = falso
				retorne foi_encontrado 
			}
	}


	funcao inicio()
 {
		inteiro opcao
		cadeia str_nome_pdt
		real dbl_valor_pdt
			faca {
				imprimir_menu()
				leia(opcao)

				limpa()
				
					escolha(opcao){
						caso 1:
						logico repetir = verdadeiro
							faca {
								escreva("\n--- CADASTRO EM ANDAMENTO ---")
								escreva("\nInforme o nome do produto: ")
									leia(str_nome_pdt)
								escreva("Informe o valor do produto: ")
									leia(dbl_valor_pdt)
	
								se (eh_valido(str_nome_pdt, dbl_valor_pdt)) {
									//abrir arquivo
										inteiro arquivo0 = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
										
									//passar os dados para o arquivo produtos.txt OU valores.txt
										Arquivos.escrever_linha(str_nome_pdt + "\n", arquivo0)
										
									//fechar arquivo
										Arquivos.fechar_arquivo(arquivo0)
										
									//type cast (conversão de valores)
										cadeia str_valor_pdt = Tipos.real_para_cadeia(dbl_valor_pdt)
										
									//abrir arquivo
										inteiro arquivo1 = Arquivos.abrir_arquivo("D:/valores.txt", 2)
										
									//passar os dados para o arquivo produtos.txt OU valores.txt
										Arquivos.escrever_linha(str_valor_pdt + "\n", arquivo1)
										
									//fechar arquivo
										Arquivos.fechar_arquivo(arquivo1)

									limpa()

									escreva("!NOVO PRODUTO GRAVADO COM SUCESSO!")

									repetir = falso
									
								}senao {
									limpa()
									
									escreva("DADOS INVÁLIDOS, POR FAVOR VEREFIQUE!")
								}
							}enquanto(repetir)
						pare
						caso 2:
							escreva("---------- CONSULTA DE ESTOQUE ----------\n")
							escreva("PRODUTO\t\t\t\t PREÇO R$\n")

								//abrir arquivo produtos.txt (leitura)
									inteiro arquivo0 = Arquivos.abrir_arquivo("D:/produtos.txt", 0)

								//adicionar os dados em um vetor 
									cadeia nome_pdt[10]
										para(inteiro i = 0; i < 10; i++) {
											nome_pdt[i] = Arquivos.ler_linha(arquivo0)
										}

								//fechar arquivo produtos.txt
									Arquivos.fechar_arquivo(arquivo0)
	
									cadeia str_valores 
									real dbl_valores[10] 


								//abrir arquivo valores.txt (leitura)
									inteiro arquivo1 = Arquivos.abrir_arquivo("D:/valores.txt", 0)

								//adicionar dados no arquivo e executar o type cast
									str_valores = Arquivos.ler_linha(arquivo1)
		
									para(inteiro i = 0; i < 10; i++) {
										dbl_valores[i] = Tipos.cadeia_para_real(str_valores)
									}	

								//fechar arquivo valores.txt
									Arquivos.fechar_arquivo(arquivo1)

								// colocar os dados na "tabela"
									real total_valores = 0.0
									inteiro j = 0 , qtd_produtos = 0, opcao_1_2
											para( j = 0; j < 10; j++){
												escreva(nome_pdt[j] , "\t\t\t|\t" , dbl_valores[j] , "\n")
			
												se (nome_pdt[j] != "" e dbl_valores[j] != 0) {
													qtd_produtos++
													total_valores = total_valores + dbl_valores[j]
												}
											}

								escreva("qtd de produtos em estoque: ", qtd_produtos)
								escreva("\nvalor total do estoque: R$", total_valores , "\n")

								escreva("\n[1]Voltar para o menu principal\n[2]Consultar produto pelo NOME\n")
								leia(opcao_1_2)

								limpa()

									escolha(opcao_1_2){
										caso 1:
											escreva("")
										pare
										caso 2:
										cadeia encontrar_produto
											escreva("BUSCA DE PRODUTO\n")
											escreva("Informe o nome do produto: ")
											leia(encontrar_produto)

											se(produto_foi_encontrado(encontrar_produto)){
												
												limpa()
												
												escreva("      PRODUTO LOCALIZADO!      !")
											}senao{

												limpa()
												
												escreva("      PRODUTO INEXISTENTE!      !")
											}
										pare
										caso contrario:
											escreva("Opção inválida!")
									}
									
										pare
						caso 3:
							inteiro opcao1_2, i = 0
							cadeia produtos_venda[10]
							real valor_produtos_venda[10], valor_pago , valor_a_pagar = 0
								faca{
									escreva("\n ----------VENDA EM ANDAMENTO---------- ")
									escreva("\nInforme o nome do produto: ")
									leia(produtos_venda[i])
									escreva("Informe o valor do produto: ")
									leia(valor_produtos_venda[i])
									i++
	
									escreva("\nDeseja incluir mais um produto na venda?\n[1]Sim\n[2]Não\n")
									leia(opcao1_2)

									limpa()
									
								}enquanto(opcao1_2 != 2)

								escolha(opcao1_2){
									caso 1:
										escreva("")
									pare
									caso 2:
										escreva(" ----------FATURAMENTO---------- \n")
										escreva("PRODUTO\t\t\t|\tPREÇO R$\n")
											para(i = 0; i < 10;i++){
												escreva(produtos_venda[i] , "\t\t\t|\t" , valor_produtos_venda[i] , "\n")

												valor_a_pagar = valor_a_pagar + valor_produtos_venda[i]
											}
											
										escreva("Total a ser pago: R$", valor_a_pagar)
										escreva("\nInforme o valor pago pelo cliente: ")
										leia(valor_pago)

											cadeia data = Calendario.ano_atual() + "-" + Calendario.mes_atual() + "-" + Calendario.dia_mes_atual()
											cadeia hora = Calendario.hora_atual(falso) + "-" + Calendario.minuto_atual()
											cadeia nome_arquivo = data + "_" + hora

											//abrir arquivo 
												inteiro arquivo  = Arquivos.abrir_arquivo("D:/faturamento_" + nome_arquivo + ".txt", 2)
	
												//type cast(preço, real para cadeia)
												//enquanto( i < 10){
													//inteiro i = 0
													//cadeia str_valor_produtos_venda[i] = Tipos.real_para_cadeia(valor_produtos_venda[i])
													//i++
												//}	
												
												//type cast(valor a ser pago, real para cadeia)
													cadeia str_valor_a_pagar = Tipos.real_para_cadeia(valor_a_pagar)
													
												//type cast(valor que o cliente pagou, real para cadeia)
													cadeia str_valor_pago = Tipos.real_para_cadeia(valor_pago)

											//Escreva no arquivo
											para(i = 0; i < 10; i++){
												Arquivos.escrever_linha(produtos_venda[i] + "\t\t|\t" + valor_produtos_venda[i] + "\n", arquivo)
											}
												Arquivos.escrever_linha(str_valor_a_pagar , arquivo)
												Arquivos.escrever_linha(str_valor_pago , arquivo)
											
											//fechar arquivo produtos.txt
												Arquivos.fechar_arquivo(arquivo)

											limpa()

											escreva("   FATURAMENTO REALIZADO COM SUCESSO!")

									pare
									caso contrario:
									 	escreva("Opção inválida!")
								}
									
									pare
						caso 4:
							escreva("Saindo do sistema...")
						pare
						
						caso contrario:
							escreva("Opção Inválida!")
						pare
					}
			}enquanto(opcao != 4)
	}
}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 993; 
 * @DOBRAMENTO-CODIGO = [5, 15, 64];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */