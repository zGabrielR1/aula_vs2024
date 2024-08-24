programa {
	//BIBLIOTECAS
	inclua biblioteca Tipos
	inclua biblioteca Arquivos
	inclua biblioteca Calendario

	//FUNÇÕES E PROCEDIMENTOS
	funcao  imprima_menu() {
		
			escreva("\n\n############################\tBEM VINDO AO SISTEMA\t############################\n############################\tMENU DE OPÇÕES\t\t############################")
			escreva("\n[1] Cadastrar Produto\n[2] Ver Produtos\n[3] Nova venda\n[4] Sair\n")

	}

	funcao  imprima_menu_cadastro() {
		
			cadeia str_nome_produto = ""
			cadeia str_valor_produto = ""
			inteiro arquivo_nomes_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\produtos.txt", 2)
			inteiro arquivos_valores_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\valores.txt", 2)
			inteiro i = 0

			faca {
			
				escreva("\n\n##################\tCADASTRO EM ANDAMENTO\t##################\n")
				escreva("\nInforme o nome do produto: ")
				leia(str_nome_produto)
				
				escreva("\nInforme o valor do produto: ")
				leia(str_valor_produto)

				limpa()
				
				se (validacao_menu_cadastro(str_valor_produto) == verdadeiro e validacao_menu_cadastro(str_nome_produto ) == verdadeiro) {
					
					se (Tipos.cadeia_e_real(str_valor_produto) == verdadeiro ou Tipos.cadeia_e_inteiro(str_valor_produto,10)){

					Arquivos.escrever_linha("\n"+str_nome_produto, arquivo_nomes_produtos)
					Arquivos.escrever_linha(str_valor_produto, arquivos_valores_produtos)
					i = 1
					
					escreva("\n\n\t\t\tNOVO PRODUTO GRAVADO COM SUCESSO!\n")

					}senao{
						
						escreva("Valor informado é invalido")
						
					}
					
					
				} senao {
					
					limpa()
					
					escreva("\nDados Inválidos, Por Favor Verifique!")
					i = 0
					
				}
				
			}enquanto (i == 0)
			
			Arquivos.fechar_arquivo(arquivo_nomes_produtos)
			Arquivos.fechar_arquivo(arquivos_valores_produtos)		
	}
	
	funcao ler_produtos() {
		
		inteiro arquivo_nomes_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\produtos.txt", 0)
		inteiro arquivos_valores_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\valores.txt", 0),opc
		real i=0.0, o=0.0
		cadeia str_valor1 = "",str_nome1 = "",procura_produto 
		real valor_1 = 0.0,valor_total = 0.0
		
		limpa()
		
		escreva("############## CONSULTA DE ESTOQUE ##############\nPRODUTO\t\t\t\t\t\t\tPREÇO R$")
		
		faca {
			
			str_valor1 = Arquivos.ler_linha(arquivos_valores_produtos)
			str_nome1 = Arquivos.ler_linha(arquivo_nomes_produtos)
			
			se (str_valor1 != "" ou str_nome1 != "") {
				
				valor_1 = Tipos.cadeia_para_real(str_valor1)
				valor_total = valor_total + valor_1
				i++

				escreva("\n",str_nome1,"\t\t\t\t\t|","\t\t",valor_1)
				
			}senao{

				o++
				
			}
		
		}enquanto(o != 1)

		o--
		escreva("\n\nQuantidade de produtos em estoque: ",i,"\n")
		escreva("Valor total de estoque: R$ ",valor_total,"\n")
		escreva("\n[1] Voltar para o menu principal\n[2] Consultar produto pelo nome\n")
		leia(opc)


		Arquivos.fechar_arquivo(arquivo_nomes_produtos)
		Arquivos.fechar_arquivo(arquivos_valores_produtos)

		buscar_produto(opc)
	}

	funcao cadeia buscar_produto(inteiro x){

		inteiro arquivo_nomes_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\produtos.txt", 0)
		inteiro arquivos_valores_produtos = Arquivos.abrir_arquivo("D:\\Luiz\\Prova\\valores.txt", 0)
		real i=0.0, o=0.0
		cadeia str_valor1 = "",str_nome1 = "",procura_produto="", A = ""

		escolha(x){

		caso 1:

			Arquivos.fechar_arquivo(arquivo_nomes_produtos)
			Arquivos.fechar_arquivo(arquivos_valores_produtos)

			limpa()
			
			retorne A

		caso 2:

			limpa()

			escreva("######### BUSCAR PRODUTO #########\nInforme nome do produto: ")
			leia(procura_produto)

			faca{

				str_nome1 = Arquivos.ler_linha(arquivo_nomes_produtos)
				str_valor1 = Arquivos.ler_linha(arquivos_valores_produtos)

				se(str_nome1 == ""){

					limpa()

					A = "############################ PRODUTO NÃO ENCONTRADO ############################"

					o++
				
				}senao se(procura_produto == str_nome1){

					limpa()

					A = "############################ PRODUTO ENCONTRADO ############################"
					
					o++
		
				}
				
			}enquanto(o != 1)

			Arquivos.fechar_arquivo(arquivo_nomes_produtos)
			Arquivos.fechar_arquivo(arquivos_valores_produtos)
			
			escreva(A)
			retorne A
				
		caso contrario:

			Arquivos.fechar_arquivo(arquivo_nomes_produtos)
			Arquivos.fechar_arquivo(arquivos_valores_produtos)

			A ="Opção invalida"
			
			escreva(A)	
			retorne A
			
		
		}
	}

	funcao venda(){
		
		cadeia nome_p,str_nota
		real preco, valor_total = 0.0, valor_pagar
		inteiro o = 0, opc
		cadeia str_ano = Tipos.inteiro_para_cadeia(Calendario.ano_atual(),10)
		cadeia str_mes = Tipos.inteiro_para_cadeia(Calendario.mes_atual(), 10)
		cadeia str_dia = Tipos.inteiro_para_cadeia(Calendario.dia_mes_atual(), 10)
		cadeia str_hora = Tipos.inteiro_para_cadeia(Calendario.hora_atual(falso), 10)
		cadeia str_minuto = Tipos.inteiro_para_cadeia(Calendario.minuto_atual(), 10)
		cadeia a = "D:\\Luiz\\Prova\\Vendas\\Nota "+str_ano+"-"+str_mes+"-"+str_dia+"-"+str_hora+"-"+str_minuto+".txt"
		inteiro arquivo_venda = Arquivos.abrir_arquivo(a, 1)
		
		faca{	
			
			escreva("#########  VENDA EM ANDAMENTO #########\nInsira o nome do produto: ")
			leia(nome_p)
			escreva("\nInsira o valor do produto: ")
			leia(preco)

			valor_total = valor_total + preco

			Tipos.real_para_cadeia(preco)
			
			Arquivos.escrever_linha(nome_p+" "+preco+" R$", arquivo_venda)
			
			escreva("\n\n######### DESEJA INSERIR MAIS ALGUM PRODUTO? #########\n[1] Inserir mais um produto\n[2] Faturar\n")
			leia(opc)

			escolha(opc){
			
			caso 1:

				Arquivos.fechar_arquivo(arquivo_venda)
				Arquivos.abrir_arquivo(a, 2)
			
				limpa()
			
			pare
			
			caso 2:

			limpa()

			Arquivos.fechar_arquivo(arquivo_venda)
			Arquivos.abrir_arquivo(a, 0)

				faca {
			
					str_nota = Arquivos.ler_linha(arquivo_venda)
			
					se (str_nota != "") {
				
						escreva(str_nota,"\n")
				
					}senao{

					o++
				
					}
		
				}enquanto(o != 1)

				Arquivos.fechar_arquivo(arquivo_venda)
				Arquivos.abrir_arquivo(a, 2)
			
				escreva("\nTotal a pagar: ",valor_total,"\nValor pago pelo cliente: ")
				leia(valor_pagar)

				Arquivos.escrever_linha("", arquivo_venda)
				Arquivos.escrever_linha("Total a pagar: "+valor_total+"    Valor pago: "+valor_pagar, arquivo_venda)

				o++

				Arquivos.fechar_arquivo(arquivo_venda)
			pare
			
			
			}
			
		}enquanto(o == 0)
			
	}

	funcao logico validacao_menu_cadastro(cadeia teste) {
		
		se (teste != "") {
			
			retorne verdadeiro
			
		} senao {
			
			retorne falso
			
		}
		
	}
	
	funcao inicio() {
		
		//VARIAVEIS
		inteiro opcao = 0
		cadeia nome_produto
		real valor_produto
		
		faca {
			
			imprima_menu()
			leia(opcao)

			escolha (opcao)  {
				
			caso 1: 
			
			limpa()
			
			imprima_menu_cadastro()
			
			pare

			caso 2:

			limpa()
			
			ler_produtos()
			
			pare

			caso 3:

			limpa()

			venda()

			limpa()
			
			pare

			caso 4:
			
				escreva("\nSaindo do sistema...")
				
			pare

			caso contrario :
			
			limpa() 	
			
				escreva("Opção Inválida!")
			
			}
			
		} enquanto (opcao != 4)
				
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3494; 
 * @DOBRAMENTO-CODIGO = [7, 14, 181, 265];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */