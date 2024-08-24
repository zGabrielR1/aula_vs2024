programa {
	
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	inclua biblioteca Calendario
	inclua biblioteca Texto

	funcao cadeia formatarNome(cadeia nome) {
		inteiro caracteres = Texto.numero_caracteres(nome)
		se (caracteres <= 7) {
			retorne nome + "\t\t\t"
		} senao se (caracteres > 7 e caracteres < 16) {
			retorne nome + "\t\t"
		} senao {
			retorne nome + "\t"
		}
	}

	funcao menu () {
		escreva("######### BEM VINDO AO SISTEMA #########\n")
		escreva("######### MENU DE OPÇÕES #########\n")
		escreva("[1] Cadastrar produto\n")
		escreva("[2] Ver Produtos\n")
		escreva("[3] Nova Venda\n")
		escreva("[4] Sair\n")
	}
	funcao funcoes(inteiro opcao, cadeia nomeProduto, real valorProduto) {
		
		se (opcao == 1) {
			inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
			inteiro arquivoValores = Arquivos.abrir_arquivo("D:/valores.txt", 2)
			logico valido = falso
			escreva("######### CADASTRO EM ANDAMENTO #########\n")
			escreva("Informe o nome do produto: \n")
			leia(nomeProduto)
			se (nomeProduto == "") {
				valido = falso
				escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
				faca {
					escreva("Informe o nome do produto: \n")
					leia(nomeProduto)

			} enquanto (valido == falso)
			} senao se (nomeProduto != "") {
				valido = verdadeiro
				Arquivos.escrever_linha(nomeProduto, arquivoProdutos)
			} 

			
			
			
			faca {
				escreva("Informe o valor do produto: \n")
				leia(valorProduto)
				cadeia str_valor = Tipos.real_para_cadeia(valorProduto)
				se (valorProduto == 0 ou valorProduto < 0) {
					valido = falso
					escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
				} senao {
					valido = verdadeiro
					Arquivos.escrever_linha(str_valor, arquivoValores)
limpa()
					escreva("	NOVO PRODUTO GRAVADO COM SUCESSO!	\n")
					
				}
			} enquanto (valido == falso)
			
			Arquivos.fechar_arquivo(arquivoProdutos)
			Arquivos.fechar_arquivo(arquivoValores)
		} senao se (opcao == 2) {
			inteiro arquivoProdutos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
			inteiro arquivoValores = Arquivos.abrir_arquivo("D:/valores.txt", 0)
			inteiro caracteres
			limpa()
			escreva("######### CONSULTA DE ESTOQUE #########\n")
			escreva("PRODUTO\t\t\t|\t\tPREÇO R$\n")
			inteiro qtdEstoque = 0
			real somaTotal = 0
			enquanto (nao Arquivos.fim_arquivo(arquivoProdutos) e nao Arquivos.fim_arquivo(arquivoValores)) {
				
				cadeia produto = Arquivos.ler_linha(arquivoProdutos)
				cadeia valorStr = Arquivos.ler_linha(arquivoValores)
				cadeia nome = produto
				se (produto != "" e valorStr != "") {
					real valor = Tipos.cadeia_para_real(valorStr)
					escreva(formatarNome(produto), "|\t\t", valorStr, "\n")
					somaTotal = somaTotal + valor
					qtdEstoque++
					
				}
			}
			
			Arquivos.fechar_arquivo(arquivoProdutos)
			Arquivos.fechar_arquivo(arquivoValores)

			escreva("\nQtd de produtos em estoque: ", qtdEstoque , "\n")
			escreva("Valor total do estoque: " , somaTotal , "\n")
			escreva("[1] Voltar para o Menu Principal\n")
			escreva("[2] Consultar produto pelo Nome\n")
			leia(opcao)
limpa ()
			 escolha (opcao) {
			 	caso 1:
limpa()
			 	menu()
			 	leia(opcao)
			 	funcoes(opcao, nomeProduto, valorProduto)
			 	pare
			 	caso 2:
			 	escreva("######### BUSCA DE PRODUTO #########\n")
			 	escreva("Informe o nome do produto: ")
			 	leia(nomeProduto)

				inteiro procurar = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
			 	logico encontrei = falso
			 	para(inteiro i = 0; nao Arquivos.fim_arquivo(arquivoProdutos); i++) {
			 		se (nomeProduto == Arquivos.ler_linha(arquivoProdutos)) {
			 			encontrei = verdadeiro
			 		}
			 	}
			 	se (encontrei == verdadeiro) {
			 		escreva("\tPRODUTO LOCALIZADO!\t\n")
			 	} senao {
limpa ()
			 		escreva("\tPRODUTO INEXISTENTE!\t\n")
			 	}
			 	Arquivos.fechar_arquivo(procurar)
			 	pare
			 	caso contrario:
			 	escreva("Opção Inválida!\n")
			 }
			 
		} senao se (opcao == 3) {
			cadeia sN = ""
			cadeia produtosVenda[100]
			real valorProdutoVenda[100]
			inteiro indice = 0
			real valorPago = 0
limpa ()
			faca {
				
				escreva("######### VENDA EM ANDAMENTO #########\n")
				escreva("Informe o nome do produto: ")
				leia(nomeProduto)
				escreva("Informe o valor do produto: R$")
				leia(valorProduto)
				
				logico valido = falso
				
				enquanto(valido == falso) {
					escreva("Deseja incluir mais um produto na venda?\n")
					escreva("[S] Sim\n")
					escreva("[N] Não\n")
					leia(sN)
					se (sN == "S" ou sN == "N" ou sN == "s" ou sN == "n") {
						valido = verdadeiro
					} senao {
						valido = falso
						limpa()
						escreva("Opção Inválida, tente novamente!\n")
					}
				}
				
				produtosVenda[indice] = nomeProduto
				valorProdutoVenda[indice] = valorProduto
				indice++
limpa ()
				
				se (sN == "N" ou sN == "n") {
					escreva("######### FATURAMENTO #########\n")
					escreva("PRODUTO\t\t\t|\t\tPREÇO R$\n")
					real valorTotalVenda = 0
					para(inteiro i = 0; i < indice; i++) {
						cadeia nome = produtosVenda[i]
						escreva(formatarNome(produtosVenda[i]), "|\t\t", valorProdutoVenda[i], "\n")
						valorTotalVenda = valorTotalVenda + valorProdutoVenda[i]
					}
					escreva("Total a ser pago: R$" , valorTotalVenda)
					

					logico valorPagoValido = falso

					enquanto (valorPagoValido == falso) {
						escreva("\nInforme o valor pago pelo cliente: ")
						leia(valorPago)

						se (valorPago > 0) {
							valorPagoValido = verdadeiro
						} senao {
							valorPagoValido = falso
							escreva("Informe um valor pago válido!\n")
						}
					}
limpa ()
					inteiro ano = Calendario.ano_atual()
					inteiro mes = Calendario.mes_atual()
					inteiro dia = Calendario.dia_mes_atual()
					inteiro hora = Calendario.hora_atual(falso)
					inteiro minuto = Calendario.minuto_atual()
					inteiro segundo = Calendario.segundo_atual()
					cadeia nomeArquivo = Tipos.inteiro_para_cadeia(ano, 10) + "-" + Tipos.inteiro_para_cadeia(mes, 10) + "-" + Tipos.inteiro_para_cadeia(dia, 10) + "_" + Tipos.inteiro_para_cadeia(hora,10) + "-" + Tipos.inteiro_para_cadeia(minuto, 10) + "-" + Tipos.inteiro_para_cadeia(segundo, 10) 
					inteiro faturamento = Arquivos.abrir_arquivo("D:/venda_" + nomeArquivo + ".txt", 2)
					Arquivos.escrever_linha("PRODUTO\t\t\t|\t\tPREÇO R$\n", faturamento)
					para(inteiro i = 0; i < indice; i++) {
						Arquivos.escrever_linha(produtosVenda[i] + "\t\t\t|\t\t" + Tipos.real_para_cadeia(valorProdutoVenda[i]) + "\n", faturamento)
					}
					real trocoCliente = valorPago - valorTotalVenda

					Arquivos.escrever_linha("Total a ser pago R$" + Tipos.real_para_cadeia(valorTotalVenda) + "\n", faturamento)
					Arquivos.escrever_linha("Valor pago pelo cliente R$" + Tipos.real_para_cadeia(valorPago) + "\n", faturamento)
					Arquivos.escrever_linha("O troco do cliente é: "+ Tipos.real_para_cadeia(trocoCliente) + "\n", faturamento)
					Arquivos.fechar_arquivo(faturamento)
					escreva("\tFATURAMENTO REALIZADO COM SUCESSO!\t\n")
				}
				
				
			} enquanto (sN == "S" ou sN == "s")
			
		} senao se (opcao == 4) {
			escreva("Saindo do sistema...")	
		} senao {
			escreva("Opção Inválida! Tente novamente: \n")	
			
		}
	}
	funcao inicio() {
		cadeia nomeProduto = ""
		real valorProduto = 0.0
		inteiro opcao
		faca {
			 menu()
			leia(opcao)
limpa()
			funcoes(opcao, nomeProduto, valorProduto)
		} enquanto (opcao != 4)
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5420; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */