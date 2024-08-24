programa {
	inclua biblioteca Texto --> tx
	inclua biblioteca Matematica
	inclua biblioteca Util
	inclua biblioteca Tipos
	inclua biblioteca Arquivos
	inclua biblioteca Calendario
	
	inteiro hora = Calendario.hora_atual(falso)
	inteiro minuto = Calendario.minuto_atual()
	inteiro sec = Calendario.segundo_atual()
	inteiro ano = Calendario.ano_atual()
	inteiro mes = Calendario.mes_atual()
	inteiro dia = Calendario.dia_mes_atual()
	
	cadeia arquivo_nota = "D:/venda_" + ano + "-" + mes + "-" + dia + "_" + hora + "-" + minuto + "-" + sec + ".txt"
	
	inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
	inteiro arquivoPrecos = Arquivos.abrir_arquivo("D:/valores.txt", 2)	
	
	funcao cadeia preencher_a_direita(cadeia texto, inteiro tamanho) {
		enquanto (tx.numero_caracteres(texto) < tamanho) {
			texto = texto + " "
		}
		retorne texto
	}

	funcao menu() {
		escreva("###### BEM VINDO AO SISTEMA ######\n")
		escreva("######    MENU DE OPÇÕES    ######\n")
		escreva("[1] Cadastrar Produto\n")
		escreva("[2] Ver Produtos\n")
		escreva("[3] Nova Venda\n")
		escreva("[4] Sair\n")    
	}

	funcao logico eh_validoProd(cadeia valores) {
		se (valores == "") {
			escreva("O nome do produto não pode ser informado “em branco”, ou seja, “vazio”.\n")
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao logico eh_validoPreco(real valores) {
		se (valores <= 0) {
			escreva("O preço do produto não pode ser valor zero ou negativo.\n")
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}    

	funcao ver_produtos() {
		Arquivos.fechar_arquivo(arquivoProdutos)
		Arquivos.fechar_arquivo(arquivoPrecos)
		inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
		inteiro arquivoPrecos = Arquivos.abrir_arquivo("D:/valores.txt", 0)
		
		cadeia linha_produto
		cadeia linha_preco
		
		se (arquivoProdutos < 0 ou arquivoPrecos < 0) {
			escreva("Erro ao abrir arquivos de produtos ou preços.\n")
			retorne
		}

		escreva("######## CONSULTA DE ESTOQUE ########\n")
		escreva("\n")
		escreva("PRODUTO                        PREÇO\n")
		escreva("--------------------------------------\n")

		enquanto (nao Arquivos.fim_arquivo(arquivoProdutos) e nao Arquivos.fim_arquivo(arquivoPrecos)) {
			linha_produto = Arquivos.ler_linha(arquivoProdutos)
			linha_preco = Arquivos.ler_linha(arquivoPrecos)

			se (linha_produto != "" e linha_preco != "") {
				escreva(preencher_a_direita(linha_produto, 30) + " " + linha_preco + "\n")
			}
		}		
	}
	
	funcao consultar_estoque() {
		Arquivos.fechar_arquivo(arquivoProdutos)
		Arquivos.fechar_arquivo(arquivoPrecos)
	
		inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
		inteiro arquivoPrecos = Arquivos.abrir_arquivo("D:/valores.txt", 0)
	
		inteiro qtd_estoque = 0
		real valor_estoque = 0
	
		enquanto (nao Arquivos.fim_arquivo(arquivoProdutos)) {
			cadeia linha_produto = Arquivos.ler_linha(arquivoProdutos)
			se (linha_produto != "") {
				qtd_estoque = qtd_estoque + 1
			}
		}
		Arquivos.fechar_arquivo(arquivoProdutos)  
	
		enquanto (nao Arquivos.fim_arquivo(arquivoPrecos)) {
			cadeia linha_preco = Arquivos.ler_linha(arquivoPrecos)
			se (linha_preco != "") {
				real valor = Tipos.cadeia_para_real(linha_preco)
				valor_estoque = valor_estoque + valor
			}
		}
		Arquivos.fechar_arquivo(arquivoPrecos)  
	
		escreva("Quantidade de produtos: ", qtd_estoque, "\n", "Valor total do estoque: R$ ", Matematica.arredondar(valor_estoque, 2), "\n")
	}
	
	funcao logico busca_prod(cadeia produto) {
		inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
		cadeia linha
		logico encontrado = falso
		
		enquanto (nao Arquivos.fim_arquivo(arquivoProdutos)) {
			linha = Arquivos.ler_linha(arquivoProdutos)
			
			se (Texto.caixa_alta(linha) == Texto.caixa_alta(produto)) {
				escreva("PRODUTO LOCALIZADO!\n")
				escreva("\n")
				encontrado = verdadeiro
				pare
			}
		}
		
		se (nao encontrado) {
			escreva("PRODUTO INEXISTENTE!\n")
			escreva("\n")
		}
		Arquivos.fechar_arquivo(arquivoProdutos)
		retorne encontrado
	}

	funcao inicio() {
		logico resposta = falso
	
		inteiro opcao
	
		cadeia produto = "", str_preco, str_total, resp, str_qtdProd, str_pgto
		real dbl_preco = 0, dbl_sub = 0, dbl_total = 0, dbl_sub1 = 0, pgto
		inteiro int_qtdProd = 0, qtd = 1

		faca {
			menu()
			leia(opcao)
			
			limpa()

			escolha(opcao) {
				caso 1:
					eh_validoProd(produto)
					eh_validoPreco(dbl_preco) 
					limpa()
					
					se (eh_validoProd(produto)) {
						limpa()
						faca {
							escreva ("Informe o produto: ")
							leia (produto)
							limpa()
						} enquanto (eh_validoProd(produto))
					}

					int_qtdProd++

					se (eh_validoPreco(dbl_preco)) {
						limpa()
						faca {
							escreva ("Informe o preço do produto ", produto, ": ")
							leia(dbl_preco) 
							limpa()
						} enquanto (eh_validoPreco(dbl_preco))
					}

					str_preco = Tipos.real_para_cadeia(Matematica.arredondar(dbl_preco, 3))
					
					Arquivos.escrever_linha(produto,arquivoProdutos)
					Arquivos.escrever_linha(str_preco, arquivoPrecos)
					
					dbl_sub = dbl_sub + dbl_preco
					dbl_sub = Matematica.arredondar(dbl_preco, 3)
					
					produto = ""
					dbl_preco = 0

					escreva ("NOVO PRODUTO GRAVADO COM SUCESSO!\n")
				
				pare
				caso 2:
					ver_produtos()
					escreva("\n")
					consultar_estoque()

					inteiro opcao2 = 0
					escreva("\n")
					escreva ("[1] Voltar para o Menu Principal\n")
					escreva ("[2] Consultar produto pelo NOME\n")
					leia (opcao2)
					limpa()

					se (opcao2 == 1) {
						opcao = 1
					} senao se (opcao2 == 2) {		
						cadeia proood
						escreva ("####### BUSCA DE PRODUTO #######\n")
						escreva("Escreva o nome do produto: \n")
						leia (proood)
						limpa()
						
						busca_prod(proood)
					} senao {
						opcao = 5				
					}
					
				pare
				caso 3:
					cadeia linhaa
					
					inteiro nota = Arquivos.abrir_arquivo(arquivo_nota, 2)
					
					Arquivos.escrever_linha("================================================", nota)
					Arquivos.escrever_linha("                    NOTA FISCAL          ", nota)
					Arquivos.escrever_linha("================================================", nota)
					Arquivos.escrever_linha("------------------------------------------------", nota)
					Arquivos.escrever_linha("Produto                 Preço", nota)
					
					enquanto (nao resposta) {
						para (inteiro i = 1; i <= qtd; i++) {
							escreva ("######### VENDA EM ANDAMENTO #########\n")
							
							escreva ("Informe o nome do produto: ")
							leia (produto)
					
							escreva ("Informe o preço do produto ", produto, ": ")
							leia(dbl_preco)
					
							str_preco = "R$ " + Tipos.real_para_cadeia(Matematica.arredondar(dbl_preco, 2))
							str_qtdProd = Tipos.inteiro_para_cadeia(int_qtdProd, 10)
					
					
							str_qtdProd = Tipos.inteiro_para_cadeia(int_qtdProd, 10)
					
							produto = preencher_a_direita(produto, 24)
							str_preco = preencher_a_direita(str_preco, 10)
					
							Arquivos.escrever_linha(produto + str_preco, nota)
					
							dbl_sub1 = dbl_sub1 + dbl_preco
						}
						
						escreva ("Deseja inserir mais produtos na compra?\n(S/N): ")
						leia (resp)
						resp = Texto.caixa_baixa(resp)
						limpa()
						
						se (resp == "s") {
							resposta = falso
						} senao se (resp == "n") {							
							resposta = verdadeiro 

							dbl_total = dbl_sub1

							escreva ("#########   FATURAMENTO   #########\n")
							escreva ("Total a ser pago: R$ ", dbl_total, "\n")
							escreva ("Informe o valor pago pelo cliente: ")
							leia (pgto)
							limpa()
					
							escreva ("Gerando nota fiscal...\n")
							escreva ("\n")					
					
							str_total = "R$ " + Tipos.real_para_cadeia(Matematica.arredondar(dbl_total, 2))
							str_pgto = "R$ " + Tipos.real_para_cadeia(Matematica.arredondar(pgto, 2))
					
							Arquivos.escrever_linha("------------------------------------------------", nota)
							Arquivos.escrever_linha(preencher_a_direita("Total:", 37) + str_total, nota)
					
							Arquivos.escrever_linha(preencher_a_direita("Total pago pelo cliente:", 37) + str_pgto, nota)

							cadeia emitida = Texto.preencher_a_esquerda(' ', 47, "Emitida em: " + dia + "/" + mes + "/" + ano + " " + hora + ":" + minuto + ":" + sec)
		
							Arquivos.escrever_linha("------------------------------------------------", nota)
							Arquivos.escrever_linha(emitida, nota)
							Arquivos.escrever_linha("================================================", nota)

							Arquivos.fechar_arquivo(nota)

							nota = Arquivos.abrir_arquivo(arquivo_nota, 0)
							enquanto (nao Arquivos.fim_arquivo(nota)) {
								cadeia linha
								linha = Arquivos.ler_linha(nota)
								escreva(linha,"\n")
							}
							Arquivos.fechar_arquivo(nota)

							escreva ("  NOTA FISCAL EMITIDA COM SUCESSO!\n")
							escreva ("\n")
						}
						
					}
				pare
				caso 4:
				escreva("Saindo do sistema...\n")
				pare
			}
		} enquanto (opcao < 4 e opcao >= 1)

		se (opcao < 1 ou opcao > 4){
			escreva("Opção Inválida!\n")
		}	
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8887; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */