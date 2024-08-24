programa{
	inclua biblioteca Arquivos
	inclua biblioteca Calendario
	inclua biblioteca Tipos

	inteiro opcao, qtd_produtos, i = 0
	real valor, valor_total, soma_precos = 0
	cadeia produto , preco_texto, nome
	logico dados_validos = falso, final = falso


	funcao logico busca (cadeia busca_nome){
		cadeia linha
		inteiro arquivo = Arquivos.abrir_arquivo("D:/produtos", 0)
			linha = Arquivos.ler_linha(arquivo)
			se (linha == busca_nome){
				Arquivos.fechar_arquivo(arquivo)
				retorne verdadeiro
			}
		Arquivos.fechar_arquivo(arquivo)
		retorne falso
	}
	
	funcao logico validacao (cadeia nome_prod, real valor_prod){
		se (nome_prod == "" ou valor_prod <= 0){
			retorne falso
		}senao{
			retorne verdadeiro
		}
	}

	funcao menu(){

	escreva("###### BEM VINDO AO SISTEMA ###### \n")
	escreva("#### MENU DE OPÇÕES #### \n")
	escreva("[1] Cadastrar Produto \n")
	escreva("[2] Ver Produtos \n")
	escreva("[3] Nova Venda \n")
	escreva("[4] Sair \n")
	leia(opcao)
	limpa()
		
	}
	
	funcao inicio(){


		menu()

		escolha(opcao) {
			caso 1:

			faca{

			escreva("##### CADASTRO EM ANDAMENTO ##### \n")
			escreva("informe o nome do produto: ")
			leia(produto)
			escreva("informe o valor: R$")
			leia(valor)

			limpa()


			dados_validos = validacao(produto, valor)

			se (dados_validos) {
			/////////////////////////////////////////////////////////////////////////
				inteiro arquivo = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
				Arquivos.escrever_linha(produto, arquivo)
				Arquivos.fechar_arquivo(arquivo)
			/////////////////////////////////////////////////////////////////////////
				inteiro arquivo2 = Arquivos.abrir_arquivo("D:/valores.txt", 2)
				Arquivos.escrever_linha(Tipos.real_para_cadeia(valor), arquivo2)
				Arquivos.fechar_arquivo(arquivo2)

				limpa()

				escreva("PRODUTO CADASTRADO!!")
			}	senao {
				limpa()
				escreva("DADOS INVALIDOS, VERIFIQUE!! \n")	
				}
			}enquanto (nao dados_validos)

				
			pare

			caso 2:

			inteiro arquivo = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
			
			inteiro arquivo2 = Arquivos.abrir_arquivo("D:/valores.txt", 0)

			
			faca{

				
			escreva("######## CONSULTA AO ESTOQUE ######## \n")
			escreva("PRODUTO \t | \t PREÇO R$ \n")
			
				
				enquanto (nao final){

			escreva(Arquivos.ler_linha(arquivo), "\t | ",Arquivos.ler_linha(arquivo2), "\n")

			preco_texto = Arquivos.ler_linha(arquivo2)
			se (preco_texto != "") {
				
			real preco = Tipos.cadeia_para_real(preco_texto)
			soma_precos = soma_precos + preco
			}

			se (Arquivos.fim_arquivo(arquivo)){

				
				
				final=verdadeiro
				
				Arquivos.fechar_arquivo(arquivo)
				Arquivos.fechar_arquivo(arquivo2)

				
			}
			
				i++
				}

			
			escreva("\n")
			escreva("Qtd de produtos em estoque: ","\n")
			escreva("valor total de estoque: ", soma_precos, "\n")
			

			inteiro sub_opcao

				faca {
        		escreva("\n[1] Voltar ao menu principal\n")
        		escreva("[2] Consultar produto pelo nome\n")
        		escreva("Escolha uma opção: ")
        		leia(sub_opcao)


        		escolha (sub_opcao){
        			caso 1:
        			
        			
        			pare
        			caso 2:
        			limpa()
				escreva("informe o nome: ")
				leia(nome)
				busca(nome)

			inteiro opcao2
			escreva("	deseja incluir mais algum produto?")
			escreva("[1] Sim")
			escreva("[2] não")
			leia(opcao2)

			escolha(opcao2){
				caso 1:

				limpa()
				escreva("informe o nome: ")
				leia(nome)
				busca(nome)
				
				pare
				caso 2:

				escreva("compra feita")	
				
				pare
			}
				
        			pare
        		}
				}enquanto (verdadeiro)
			} enquanto (arquivo2 > 0)

			pare

			caso 3:

			inteiro sub_menu
	
			faca{

			escreva("##### VENDA EM ANDAMENTO ##### \n")
			escreva("informe o nome do produto: ")
			leia(produto)
			escreva("informe o valor: R$")
			leia(valor)

			escreva(" #####VENDA EM ANDAMENTO##### \n")
			escreva("DESEJA INCLUIR MAIS UM PRODUTO NA VENDA?? \n")
			escreva("[1] SIM \n")
			escreva("[2] NÃO \n")
			
			
			leia(sub_menu)
			escolha (sub_menu) {
			
			
			caso 1:
			se( sub_menu == 1)
				escreva(" #####VENDA EM ANDAMENTO##### \n")
				escreva("DESEJA INCLUIR MAIS UM PRODUTO NA VENDA?? \n")
				escreva("[1] SIM \n")
				escreva("[2] NÃO \n")
				
				validacao(produto,valor) 
			pare 

			caso 2 :
			se( sub_menu == 2)
				escreva("#####FATURAMENTO#####")
				escreva("")

			
			pare
			

			}
			}enquanto(nao(dados_validos))


			pare

			caso 4:
			escreva("Saindo do sistema...")

			pare

			caso contrario:
			escreva("escolha uma opção valida!!")
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3540; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */