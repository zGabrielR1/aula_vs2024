programa{
	inclua biblioteca Texto 
	inclua biblioteca Arquivos --> A
	inclua biblioteca Matematica 
	inclua biblioteca Tipos --> T
	inclua biblioteca Calendario --> C

	inteiro hora = Calendario.hora_atual(falso)
	inteiro minutos = Calendario.minuto_atual()
	inteiro segundos = Calendario.segundo_atual()
	inteiro ano = Calendario.ano_atual()
	inteiro mes = Calendario.mes_atual()
	inteiro dia = Calendario.dia_mes_atual() 
	inteiro opcao
	cadeia arquivo_valores_str = ""
	

	funcao menu (){
	
		escreva("########## BEM VINDO AO SISTEMA ##########\n")
		escreva("##########    MENU DE OPÇÕES    ##########\n ")
		escreva("[1] Cadastrar produtos\n ")
		escreva("[2] Ver produtos\n ")
		escreva("[3] Nova venda\n ")
		escreva("[4] Sair\n ")
	}

	funcao nova_venda(){
		
		cadeia data = C.ano_atual() + "-" + C.mes_atual() + "-" + C.dia_mes_atual()
		cadeia hora = C.hora_atual(falso)+ "-" + C.minuto_atual()
		cadeia nome_arquivo = data+ "_"+ hora

		inteiro arquivo = A.abrir_arquivo("D:/venda_"+ nome_arquivo + ".txt", 2)

		
		cadeia op_inserir_produto = ""
		cadeia produto_venda = ""
		real valor_venda = 0
		real total_valor_venda = 0

		faca{
			
			escreva("#########   VENDA EM ANDAMENTO   #########\n")
			escreva("Informe o nome do produto: ")
			leia(produto_venda)
			
			se(produto_venda != ""){
				limpa()
				escreva("#########   VENDA EM ANDAMENTO   #########\n")
				escreva("Informe o nome do produto: ",produto_venda)
				escreva("\nInforme o valor do produto: ")
				leia(valor_venda)

				arquivo_valores_str = T.real_para_cadeia(valor_venda)
				cadeia nome = produto_venda
				inteiro caracteres
				
				caracteres = Texto.numero_caracteres(nome)
				
				se(caracteres > 7 e caracteres < 16){
				A.escrever_linha(produto_venda+"\t\t|\t"+arquivo_valores_str, arquivo)
				}senao se(caracteres > 15 e caracteres < 24){
				A.escrever_linha(produto_venda+"\t|\t"+arquivo_valores_str, arquivo)
				}senao se(caracteres < 8){
				A.escrever_linha(produto_venda+"\t\t\t|\t"+arquivo_valores_str, arquivo)
				}senao se(caracteres >=24){
					A.escrever_linha(produto_venda+"|\t"+arquivo_valores_str, arquivo)
				}
				total_valor_venda = total_valor_venda + valor_venda
			
				escreva("\nDeseja incluir mais um produto na venda?\n")
				escreva("[S] Sim\n")
				escreva("[N] Não\n")
				leia(op_inserir_produto)
				
				op_inserir_produto = Texto.caixa_alta(op_inserir_produto)
				
			}senao{
				limpa()
				escreva("Não é possível incluir produto sem nome!\n")
				op_inserir_produto = "S"
				
			}
			
		}enquanto(op_inserir_produto == "S") 

		A.fechar_arquivo(arquivo)
		A.abrir_arquivo("D:/venda_"+ nome_arquivo + ".txt", 0)
		limpa()
		escreva("#########    FATURAMENTO    #########\n")
		escreva("PRODUTO\t\t\t|\tPREÇO R$\n")
		enquanto( nao A.fim_arquivo(arquivo)){
			escreva(A.ler_linha(arquivo),"\n")
		}
		A.fechar_arquivo(arquivo)
		A.abrir_arquivo("D:/venda_"+ nome_arquivo + ".txt", 2)
		cadeia valor_pago = ""
		escreva("\nTotal a ser pago: ", total_valor_venda)
		escreva("\nInforme o valor pago pelo cliente: ")
		leia(valor_pago)
		A.escrever_linha("Total da Venda: "+ total_valor_venda, arquivo)
		A.escrever_linha("Valor pago pelo cliente: "+valor_pago, arquivo)
		limpa()
		escreva("   FATURAMENTO REALIZADO COM SUCESSO!\n")
		A.fechar_arquivo(arquivo)
	}

	funcao logico validacao (cadeia teste, real numero){
		se ( teste == "" ou numero <= 0){
			retorne falso
		}
		retorne verdadeiro 
	}
	
	


	
	funcao inicio(){
		

	faca{
		menu()
		leia(opcao)
		escolha(opcao){
			caso 1:
limpa()
				cadeia produto, linha_produto
				real valor, linha_valor
				logico certo = falso 
				
				faca{
					escreva("########## CADASTRO EM ANDAMENTO ##########\n\n")
					escreva("Informe o nome do produto: ")
					leia(produto)
					escreva("Informe o valor do produto: ")
					leia(valor)

					se(validacao(produto, valor)){
						certo = verdadeiro 
						inteiro arquivo_produto = Arquivos.abrir_arquivo("D:/Produtos.txt", 2)
							
							linha_produto = produto
						Arquivos.escrever_linha(linha_produto, arquivo_produto)
		
						Arquivos.fechar_arquivo(arquivo_produto)
//--------------------------------------------------------------------------------------------------------------------------------------------
		
						
					
						inteiro arquivo_valor = Arquivos.abrir_arquivo("D:/Valores.txt", 2)
						
							linha_valor = valor 	
							cadeia conversao = Tipos.real_para_cadeia(linha_valor)
							
						Arquivos.escrever_linha(conversao, arquivo_valor)
		
						Arquivos.fechar_arquivo(arquivo_valor)
limpa()
						escreva("       PRODUTO GRAVADO COM SUCESSO\n")
						
					}senao {
						limpa()
						escreva(" DADOS INVALIDOS, POR FAVOR VERIFIQUE!\n")
					}
					
				}enquanto(certo == falso)	
				
				pare

			caso 2:
limpa()
			escreva("########## CONSULTA DO ESTOQUE ##########\n")
			escreva("Produtos:\t|\t Preço: \n")
				
				
				
				logico cheio = falso 
				inteiro contagem = -1
				real soma = 0.0
				inteiro qtd = -1 
				

			faca{
					cadeia produto_linha
					inteiro produtos_estoque = Arquivos.abrir_arquivo("D:/Produtos.txt", 0)
					cadeia lugar_produto[20]
					inteiro k = 0 
					
					enquanto(nao Arquivos.fim_arquivo(produtos_estoque)){
					produto_linha = Arquivos.ler_linha(produtos_estoque)
					lugar_produto[k] = produto_linha
					k++
					contagem++
					qtd++
					}
					
				Arquivos.fechar_arquivo(produtos_estoque)
				
			
//-----------------------------------------------------------------------------------------------------------------------------
				
				cadeia valor_linha
				inteiro valor_estoque = Arquivos.abrir_arquivo("D:/Valores.txt", 0)
				cadeia lugar_valor[10] = {"0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0"}
				inteiro k_k = 0 
				real conversao = 0
				cadeia convertido
				
					enquanto(nao Arquivos.fim_arquivo(valor_estoque)){
					valor_linha = Arquivos.ler_linha(valor_estoque)

					se(valor_linha != ""){
						lugar_valor[k_k] = valor_linha
						conversao = Tipos.cadeia_para_real(valor_linha)
						soma = soma + conversao
					}
					k_k++ 
					
					}
					
					cheio = verdadeiro 
						
						
		
				Arquivos.fechar_arquivo(valor_estoque)


				para(inteiro p = 0; p < contagem; p++){
					escreva(lugar_produto[p], "\t\t|\t  ",lugar_valor[p],"\n")		
				}
				escreva("\n")
				escreva(" Qtd produtos em estoque é: ", qtd,"\n")
				escreva(" Valor total é de: ", soma, "\n\n")

				inteiro opcao2
				escreva("[1] Voltar ao menu principal\n")
				escreva("[2] Buscar pelo nome\n")
				leia(opcao)



				escolha(opcao){


					caso 1:
					limpa()
						pare

					caso 2:
					
						pare
				}
//-----------------------------------------------------------------------------------------------------------------------------
		}enquanto(cheio == falso)
				
				

				pare

			caso 3:
				limpa()
				nova_venda()
				
				pare


			
			caso 4:
limpa()
				escreva("Saindo do sistema.....\n")
				
				pare

			caso contrario:
limpa()
				escreva("Opção invalida........\n ")

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
 * @POSICAO-CURSOR = 6648; 
 * @DOBRAMENTO-CODIGO = [17, 27, 108];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */