programa
{
	inclua biblioteca Calendario
	inclua biblioteca Texto
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	funcao imprimir_menu(){
		escreva("###### BEM VINDO AO SISTEMA ######\n")
		escreva("######   MENU DE FUNÇÕES   ######\n")
		escreva("[1] Cadastrar produto\n")
		escreva("[2] Ver produtos\n")
		escreva("[3] Nova Venda\n")
		escreva("[4] Sair\n")
	}
	inteiro hora = Calendario.hora_atual(falso)
	inteiro minuto = Calendario.minuto_atual()
	inteiro sec = Calendario.segundo_atual()
	inteiro ano = Calendario.ano_atual()
	inteiro mes = Calendario.mes_atual()
	inteiro dia = Calendario.dia_mes_atual()
	
	cadeia arquivo_ven_prod = "D:/vendas_"+ ano + "-" + mes + "-" + dia + "_" + hora + "-" + minuto + "-" + sec + ".txt"
	
	
		
	funcao logico valida_produto(cadeia cad_nome ){
        se (cad_nome == "") {
            retorne falso
        }
        	retorne verdadeiro
		}
    funcao logico valida_valor(real cad_valor ){
        se (cad_valor <= 0) {
            retorne falso
        }
        	retorne verdadeiro
		}
	funcao logico valida_produto2(cadeia prd_venda ){
        se (prd_venda == "") {
            retorne falso
        }
        	retorne verdadeiro}
     funcao logico valida_valor2(real val_venda ){
        se (val_venda <= 0) {
            retorne falso
        }
        	retorne verdadeiro
		}

	
	funcao inicio()
	{
		

		inteiro arquivo_prod
		inteiro arquivo_val
		inteiro opcao
		real cad_valor
		cadeia cad_nome
		cadeia str_valor
		real vf = 0.0
		real vl_prd
		cadeia prd_venda
		real val_venda
		cadeia str_venda_val
		faca{
		imprimir_menu()
		leia(opcao)
		limpa()
		escolha (opcao){
			caso 1:
				
				faca{
					
					escreva("###### CADASTRO EM ANDAMENTO ######\n")
					escreva("Informe o nome do produto a ser adicionado: ")
					leia(cad_nome)
					se(nao valida_produto(cad_nome)){
						escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
					}
					
					}enquanto(nao valida_produto(cad_nome))

					
				
				escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!")

					
					 
					arquivo_prod = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
		
					Arquivos.escrever_linha(cad_nome, arquivo_prod)

					Arquivos.fechar_arquivo(arquivo_prod)
	
					limpa()
				
				
				faca{
				escreva("Informe o valor do produto a ser adicionado: ")
				leia(cad_valor)
				se(nao valida_valor(cad_valor)){
					escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!")
				}
				}enquanto(nao valida_valor(cad_valor))
				
				arquivo_val = Arquivos.abrir_arquivo("D:/valores.txt", 2)
				
				str_valor =  Tipos.real_para_cadeia(cad_valor)
				
		
				Arquivos.escrever_linha(str_valor, arquivo_val)
				
				
		
				Arquivos.fechar_arquivo(arquivo_val)
				
				limpa()
				
				escreva("Produto cadastrado com sucesso!\n")
				
				pare
				
			caso 2:
				
			 	cadeia l_prd
			 	inteiro qtd_prd = 0
			 	cadeia l_vl
			 	arquivo_val = Arquivos.abrir_arquivo("D:/valores.txt", 0)
			 	arquivo_prod = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
				escreva("###### CONSULTA DE ESTOQUE ######\n")
                    escreva("PREÇO\t  |\tPRODUTO\n")
				enquanto (nao Arquivos.fim_arquivo(arquivo_prod) e nao Arquivos.fim_arquivo(arquivo_val)) {
    					l_prd = Arquivos.ler_linha(arquivo_prod)
    					l_vl = Arquivos.ler_linha(arquivo_val)
    					se (l_prd != "" e l_vl != "") {
       					escreva(l_vl,"\t  |\t",l_prd, "\n")
        					qtd_prd++
        					vl_prd = Tipos.cadeia_para_real(l_vl)
    						vf = vf + vl_prd
    					}
    					
    					
				}
				Arquivos.fechar_arquivo(arquivo_prod)
				Arquivos.fechar_arquivo(arquivo_val)
				escreva("A quantidade de produtos é: ",qtd_prd,"\nO valor total dos produtos é: ",vf,"\n")
				inteiro opcao2
				escreva("[1] Voltar ao menu\n")
				escreva("[2] Consultar Produto pelo nome\n")
				leia(opcao2)

				escolha(opcao2){
					caso 1:
						limpa()
					pare
					
					caso 2:
					limpa()
					escreva("###### BUSCA DE PRODUTO ######")
					cadeia nome_produto
					escreva("Informe o nome do produto: \n")
					leia(nome_produto)
					arquivo_prod = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
					logico encontrou = falso
					enquanto (nao Arquivos.fim_arquivo(arquivo_prod)) {
						se (nome_produto == Arquivos.ler_linha(arquivo_prod)) {
							encontrou = verdadeiro
							limpa()
							escreva("PRODUTO LOCALIZADO\n")
						}
						senao{
							limpa()
							escreva("PRODUTO INEXISTENTE\n")
						}
					}

					pare

					caso contrario:
					escreva("Opção inválida!")
					
				}

				pare
				
			caso 3:
				inteiro i = 0
				real vf2 = 0
				cadeia resposta
				inteiro arquivo_ven_prd = Arquivos.abrir_arquivo("D:/vendas_"+ ano + "-" + mes + "-" + dia + "_" + hora + "-" + minuto + "-" + sec + ".txt", 2)
				Arquivos.escrever_linha( "PRODUTO \t| PREÇO" , arquivo_ven_prd)
				Arquivos.fechar_arquivo(arquivo_ven_prd)
				faca{
					arquivo_ven_prd = Arquivos.abrir_arquivo("D:/vendas_"+ ano + "-" + mes + "-" + dia + "_" + hora + "-" + minuto + "-" + sec + ".txt", 2)
					
					faca{
						escreva("###### VENDA EM ANDAMENTO ######\n")
						
						escreva("Informe o nome do produto: ")
						leia(prd_venda)
						escreva("Informe o valor do produto: ")
						leia(val_venda)
						se(nao valida_produto(prd_venda) e nao valida_valor2(val_venda)){
							escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
						}
						
					}enquanto(nao valida_produto2(prd_venda) e nao valida_valor2(val_venda))
					
					Arquivos.escrever_linha( "-------------------------------------" , arquivo_ven_prd)
					Arquivos.escrever_linha(prd_venda + "\t  \t| " + val_venda, arquivo_ven_prd)
					
					vf2 = vf2 + val_venda
					
					Arquivos.fechar_arquivo(arquivo_ven_prd)
				
					limpa()
					
				
				
					
					escreva("Deseja incluir mais um produto na venda?\n")
					escreva("[S] Sim\n")
					escreva("[N] Não\n")
					leia(resposta)
					limpa()
					resposta = Texto.caixa_alta(resposta)
				}enquanto(resposta == "S")
				limpa()
				escreva("Total a pagar: ",vf2,"\n")
				real pagamento
				escreva("Valor pago pelo cliente: ")
				leia(pagamento)
				limpa()
				arquivo_ven_prd = Arquivos.abrir_arquivo("D:/vendas_"+ ano + "-" + mes + "-" + dia + "_" + hora + "-" + minuto + "-" + sec + ".txt", 2)
				Arquivos.escrever_linha( "-------------------------------------\n\n" , arquivo_ven_prd)
				
				
				Arquivos.escrever_linha( "-------------------------------------\n\n" , arquivo_ven_prd)
				Arquivos.escrever_linha("Total a pagar :"+vf2, arquivo_ven_prd)
				Arquivos.escrever_linha( "-------------------------------------\n\n" , arquivo_ven_prd)
				Arquivos.escrever_linha("Total pago :"+pagamento, arquivo_ven_prd)
				Arquivos.escrever_linha( "-------------------------------------\n\n" , arquivo_ven_prd)
				Arquivos.escrever_linha(ano + "/" + mes + "/" + dia + "_" + hora + ":" + minuto + ":" + sec ,arquivo_ven_prd )
				Arquivos.fechar_arquivo(arquivo_ven_prd)
				limpa()
				escreva("FATURAMENTO REALIZADO COM SUCESSO!\n")
				pare

				
				
			caso 4:
				escreva("Saindo do sistema...")
				pare
				
			caso contrario:
				escreva("Opcão Inválida!")
	
		}
	}enquanto(opcao!=4)
}}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5882; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */