programa{
	
	inclua biblioteca Arquivos --> A
	inclua biblioteca Tipos --> T
	inclua biblioteca Texto
	inclua biblioteca Calendario --> C
	inteiro arquivo_produtos = 0
	inteiro arquivo_valores = 0
	cadeia arquivo_valores_str = ""
	inteiro opcao_menu
	
	funcao menu(){
		escreva("######### BEM VINDO AO SISTEMA #########\n")
		escreva("#########   MENU DE OPÇÕES\t#########\n")
		escreva("[1] Cadadstrar Produto\n")
		escreva("[2] Ver Produtos\n")
		escreva("[3] Nova Venda\n")
		escreva("[4] Sair\n")
		
	}

	funcao logico dados_validos(cadeia nome, real valor){
		se(nome != "" e valor > 0){
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}

	funcao cadastro(){
		limpa()
		logico valores_invalidos = verdadeiro
		
		faca{
			cadeia nome_produto, valor_produto_str
			real valor_produto_dbl
			inteiro arquivo_produtos = A.abrir_arquivo("D:/produtos.txt", 2)
			inteiro arquivo_valores = A.abrir_arquivo("D:/valores.txt", 2)
			
			escreva("######### CADASTRO EM ANDAMENTO #########\n")
			escreva("Informe o nome do produto: ")
			leia(nome_produto)
			escreva("Informe o valor do produto: ")
			leia(valor_produto_dbl)
			
			se(nao dados_validos(nome_produto,valor_produto_dbl)){
				limpa()
				escreva("   DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
				A.fechar_arquivo(arquivo_produtos)
				A.fechar_arquivo(arquivo_valores)
			
			}senao{
				A.escrever_linha(nome_produto, arquivo_produtos)
				valor_produto_str = T.real_para_cadeia(valor_produto_dbl)
				A.escrever_linha(valor_produto_str, arquivo_valores)
				A.fechar_arquivo(arquivo_produtos)
				A.fechar_arquivo(arquivo_valores)
				valores_invalidos = falso
			}
		}enquanto(valores_invalidos)
		limpa()
	}

	funcao ver_produtos(){
		limpa()
		escreva("######### CONSULTA DE ESTOQUE #########\n")
		escreva("PRODUTO\t\t\t|\tPREÇO R$\n")

		inteiro aux = 0
		real dql_total_valores , soma = 0
		inteiro opcao_2 
		
		arquivo_produtos = A.abrir_arquivo("D:/produtos.txt", 0)
		arquivo_valores = A.abrir_arquivo("D:/valores.txt", 0)
		
		
		cadeia nome 
		inteiro caracteres
		enquanto( nao A.fim_arquivo(arquivo_produtos)){
			
			nome = A.ler_linha(arquivo_produtos)
			se(nome != ""){
				cadeia produto = nome
				escreva(produto)
				caracteres = Texto.numero_caracteres(produto)
				se(caracteres > 7 e caracteres < 16){
				escreva("\t\t")
				}senao se(caracteres > 15 e caracteres < 24){
				escreva("\t")
				}senao se(caracteres < 8){
				escreva("\t\t\t")
				}
				
			escreva("|\t",A.ler_linha(arquivo_valores), "\n")
			aux++
			}
		}
		A.fechar_arquivo(arquivo_valores)
		A.fechar_arquivo(arquivo_produtos)
		
		arquivo_valores = A.abrir_arquivo("D:/valores.txt", 0)	
		inteiro i = 0
		
		enquanto(i <aux){
			dql_total_valores = T.cadeia_para_real(A.ler_linha(arquivo_valores))
			soma = soma + dql_total_valores
			i++
		}
		
		A.fechar_arquivo(arquivo_valores)

		escreva("\nQtd de produtos em estoque: ", aux)
		escreva("\nValor total do estoque: R$",soma)
		escreva("\n\n[1] Valtar para o Menu Principal")
		escreva("\n[2] Consultar produto pelo Nome\n")
		leia(opcao_2)

		escolha(opcao_2){
			caso 1: 
				limpa()
			pare

			caso 2:
				limpa()
				escreva("Informe o nome do produto: ")leia(nome) limpa()

				se(busca(nome)){
					escreva("\t   PRODUTO LOCALIZADO!\n")
				}senao{
					escreva("\t   PRODUTO INEXISTENTE!\n")
				}
			pare

			caso contrario:
				limpa()
				escreva("Opção Invalida!!")
				opcao_menu = 4
		}
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
	
	funcao logico busca(cadeia nome){
		arquivo_produtos = A.abrir_arquivo("D:/produtos.txt", 0)
		
		logico encontrou = falso
		enquanto (nao A.fim_arquivo(arquivo_produtos)) {
			se (nome == A.ler_linha(arquivo_produtos)) {
				encontrou = verdadeiro
			}
		}
		
		A.fechar_arquivo(arquivo_produtos)
		retorne encontrou
	}

	funcao inicio(){

		faca{
			
			menu()
			leia(opcao_menu)
			
			escolha (opcao_menu){
				
				caso 1:
					limpa()
					cadastro()
				pare
	
				caso 2:
					limpa()
					ver_produtos()
				pare

				caso 3:
					limpa()
					nova_venda()
				pare

				caso 4:
					limpa()
					escreva("Saindo do sistema...")
				pare

				caso contrario:
					limpa()
					escreva("Opção Inválida!\n")
				
			}
		}enquanto(opcao_menu != 4)	

		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4003; 
 * @DOBRAMENTO-CODIGO = [11, 21, 29, 63];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */