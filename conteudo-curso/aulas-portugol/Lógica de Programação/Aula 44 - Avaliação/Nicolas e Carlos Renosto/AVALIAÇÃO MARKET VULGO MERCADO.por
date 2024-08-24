programa
{
	inclua biblioteca Arquivos
	inclua biblioteca Tipos
	inclua biblioteca Texto
	inclua biblioteca Calendario
	funcao imprimir_menu(){ 
		escreva("######### BEM VINDO AO SISTEMA #########\n")
		escreva("   ######### MENU DE OPÇÕES #########\n")
		escreva("[1] Cadastrar Produto\n")
		escreva("[2] Ver produtos\n")
		escreva("[3] Nova Venda\n")
		escreva("[4] Sair\n")}
	
	funcao inicio(){
		
		inteiro opc, opc_v
		cadeia produto, valor_f
		real valor = 0.0, valor_t = 0.0
		inteiro qtd_produtos = 0
			
		faca{
		imprimir_menu()
		leia(opc)
		
			escolha(opc){
				caso 1:
					inteiro arquivo_p = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
					inteiro arquivo_v = Arquivos.abrir_arquivo("D:/valores.txt", 2)
			
			
						faca{
							escreva("\n######### CADASTRO EM ANDAMENTO #########\n")
							escreva("Informe o nome do produto: ")
							leia(produto)
							escreva("\nInforme o valor do produto: ")
							leia(valor)
							valor_f= Tipos.real_para_cadeia(valor)
			
						}enquanto(produto == "" ou valor <= 0.0)
			
				se(produto == "" ou valor <= 0.0){
					escreva("DADOS INVALIDOS!\n")
				}senao {
					Arquivos.escrever_linha(produto, arquivo_p)
					Arquivos.escrever_linha(valor_f, arquivo_v)
					escreva("PRODUTO CADASTRADO COM SUCESSO\n")}
					qtd_produtos++
					valor_t = valor + valor_t
					limpa()
				
					Arquivos.fechar_arquivo(arquivo_p)
					Arquivos.fechar_arquivo(arquivo_v)
			
			pare

			caso 2:		
				limpa()
				inteiro arquivo_pp = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
				inteiro arquivo_vp = Arquivos.abrir_arquivo("D:/valores.txt", 0)

				escreva("\n######### CONSULTA ESTOQUE #########\n")
				escreva("PRODUTO\t\t|\t\tPREÇO R$ \n")
			
				enquanto(nao Arquivos.fim_arquivo(arquivo_pp)){
					cadeia lista_p = Arquivos.ler_linha(arquivo_pp)

					escreva(lista_p)
				se (lista_p == ""){
					pare
					}
					
				inteiro cc = Texto.numero_caracteres(lista_p)
				se (cc > 7 e cc < 14){
					escreva("\t|")
				}senao se (cc > 15 e cc < 24){
					escreva("\t|")
				}senao {
					escreva("\t\t|")
					escreva("\t\t", Arquivos.ler_linha(arquivo_vp),"\n")}
				}
				escreva ("Total de produtos no estoque: " ,qtd_produtos,"\n")
				escreva ("Preço total do estoque: R$ " ,"\n")
				Arquivos.fechar_arquivo(arquivo_pp)
				Arquivos.fechar_arquivo(arquivo_vp)
				inteiro opcao
				escreva ("\n[1] Voltar para o Menu Principal")
				escreva ("\n[2] Consultar produto pelo NOME\n")
				leia(opc_v)
				limpa()
			pare

			caso 3:
				limpa()
				inteiro preco_produto, valor_venda, valor_pago
				cadeia opc_incluir = "n"
				real total = 0.0
				cadeia produto_venda
				cadeia data = Calendario.ano_atual() + "-" + Calendario.mes_atual() + "-" + Calendario.dia_mes_atual()
				cadeia hora = Calendario.hora_atual(falso) + "-" + Calendario.minuto_atual()
				cadeia arquivo = data + "_" + hora	
				inteiro arquivo_venda = Arquivos.abrir_arquivo("C:/Users/carlos_renosto/Documents/Nova pasta/"+"venda_"+arquivo+".txt", 1)
				
					
				faca {
					escreva ("\n######## VENDA EM ANDAMENTO ########\n")
					escreva("\nInforme o nome do produto: ")
					leia(produto_venda)
					escreva("Informe o valor do produto: R$ ")
					leia(preco_produto)
					
					se (produto_venda!= "" e valor<= 0){
						Arquivos.escrever_linha("\n"+produto_venda+"\t\tR$ "+preco_produto, arquivo_venda)	
											
					} senao{
						escreva ("DADOS INVÁLIDOS, POR FAVOR VERIFQUE!\n")
					}

					total = total + preco_produto
					escreva ("\nDeseja incluir mais um produto na venda?")
					escreva("\n[S] Sim")
					escreva("\n[N] Não\n")
					leia(opc_incluir)
					
				}enquanto (opc_incluir == "S" ou opc_incluir == "s")
					Arquivos.fechar_arquivo(arquivo_venda)
					escreva ("\n######## FATURAMENTO ########\n")
					escreva ("PRODUTO\t\tPREÇO R$")
					arquivo_venda = Arquivos.abrir_arquivo("C:/Users/carlos_renosto/Documents/Nova pasta/"+"venda_"+arquivo+".txt", 0)
					
				faca{
						escreva("\n" ,Arquivos.ler_linha(arquivo_venda))
				} enquanto ( nao Arquivos.fim_arquivo(arquivo_venda))

					Arquivos.fechar_arquivo(arquivo_venda)
					arquivo_venda = Arquivos.abrir_arquivo("C:/Users/carlos_renosto/Documents/Nova pasta/"+"venda_"+arquivo+".txt", 2)
					escreva ("\nTotal a se pago: R$ " ,total,"\n")
					escreva ("Informe o valor pago pelo cliente R$ ")
					leia(valor_pago)
					Arquivos.escrever_linha("\n\nValor pago pelo cliente R$"+valor_pago, arquivo_venda)	
					Arquivos.fechar_arquivo(arquivo_venda)
					limpa()
					escreva ("  FATURAMENTO REALIZADO COM SUCESSO!","\n")	
			pare

			caso 4:
				escreva("encerando sistema...")

			pare
			caso contrario:
				escreva("Opção Invalida!!!")
			pare

	
		
			}
		}enquanto (opc != 4)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4389; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */