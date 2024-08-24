programa{
	inclua biblioteca Arquivos
	inclua biblioteca Calendario
	inclua biblioteca Tipos
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
//////////////////////////////////////////////////////////////////////

	funcao MENU (){
		escreva("######### BEM VINDO AO SISTEMA #########\n",
			   "#########    MENU DE OPÇÕES    #########\n",
			   "[1] Cadastrar Produto\n",
			   "[2] Ver Produtos\n",
			   "[3] Nova Venda\n",
			   "[4] Sair\n---> ")
		
	}
//////////////////////////////////////////////////////////////////////

	funcao logico validacao(cadeia produto,real preco){
		se(produto!="" e preco>0){
			retorne verdadeiro 
		}retorne falso
	}
//////////////////////////////////////////////////////////////////////

	
		
	
	funcao inicio()	{

//////////////VARIAVEIS//////////////////////////////////////////////////////////////////////////////////////////////////

		cadeia produto = "" , valor, busca ,incluir , valor_pago, nome_faturamento ="", quer
		inteiro opcao = 1,arquivo_valores, arquivo_produtos = 0, i=0, produtos_contagem = -1 , arquivo_nome, arquivo_valor
		real preco = 0.0 , soma = 0.0 ,soma_2 = 0.0, valor_faturamento = 0.0, pagar = 0.0, valor_cliente
		logico aberto , final ,pode , continuar, fatura

///////////MENU/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		enquanto(opcao ==1 ou opcao==2 ou opcao==3){
			MENU()
			leia(opcao)
	
			limpa()
	
			escolha(opcao){
				

/////////CADASTRAR O PRODUTO/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


				caso 1:
				
					pode = verdadeiro
					enquanto(nao validacao(produto,preco) ou pode){
						escreva("######### CADASTRO EM ANDAMENTO ######### ")
						escreva("\nInforme o nome do produto: ")
						leia(produto)
							
						escreva("Informe o valor do produto: ")
						leia(preco)
						limpa()
		
						se(nao validacao(produto,preco)){
							escreva("   DÁDOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
						}senao{
							pode= falso
						}
					}
				
					valor = Tipos.real_para_cadeia(preco)
					se(Arquivos.arquivo_existe("D:/produtos.txt")){
						arquivo_produtos = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
						Arquivos.escrever_linha(produto, arquivo_produtos)
						Arquivos.fechar_arquivo(arquivo_produtos)
						
					}senao{
						arquivo_produtos = Arquivos.abrir_arquivo("D:/produtos.txt", 1)
						Arquivos.escrever_linha(produto, arquivo_produtos)
						Arquivos.fechar_arquivo(arquivo_produtos)
						
					}
					
					se(Arquivos.arquivo_existe("D:/valores.txt")){
						arquivo_valores = Arquivos.abrir_arquivo("D:/valores.txt", 2)
						Arquivos.escrever_linha(valor, arquivo_valores)
						Arquivos.fechar_arquivo(arquivo_valores)
					
						
					}senao{
						arquivo_valores = Arquivos.abrir_arquivo("D:/valores.txt", 1)
						Arquivos.escrever_linha(valor, arquivo_valores)
						Arquivos.fechar_arquivo(arquivo_valores)
					}
					escreva("  NOVO PRODUTO GRAVADO COM SUCESSO!\n")    
					pare
					
				
///////////////VER PRODUTOS//////////////////////////////////////////////////////////////////////////////////////////////////////////

					
				caso 2:
					
					final = falso
					arquivo_produtos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
					arquivo_valores = Arquivos.abrir_arquivo("D:/valores.txt", 0)

					escreva("####### CONSULTA DE ESTOQUE #######\n")
					escreva("PRODUTO\t\t |\tPREÇO R$\n")
					
					enquanto(nao final){
						
						
						cadeia resposta_produtos = Arquivos.ler_linha(arquivo_produtos)
						escreva("",resposta_produtos,"\t")
						se(nao Arquivos.fim_arquivo(arquivo_produtos)){
							escreva(" | ")
						}
						
						cadeia resposta_valor = Arquivos.ler_linha(arquivo_valores)
						escreva("\t",resposta_valor,"\n")
						
						se(resposta_valor!=""){
							real valor_soma = Tipos.cadeia_para_real(resposta_valor)
							soma = soma + valor_soma
						}

						produtos_contagem++

						se(Arquivos.fim_arquivo(arquivo_produtos)){
							final = verdadeiro
							Arquivos.fechar_arquivo(arquivo_valores)
							Arquivos.fechar_arquivo(arquivo_produtos)
						}	
					}
					escreva("\nQuantida de produtos em estoque: ",produtos_contagem)
					escreva("\nValor total do estoque: R$", soma)
					inteiro consultar
					escreva("\n\n[1] Voltar para o Menu Principal\n")
					escreva("[2] Consultar produto pelo NOME\n")
					leia(consultar)

					escolha(consultar){
						caso 1:
						limpa()
							pare
						caso 2:
							limpa()
							escreva("###### BUSCA DE PRODUTO ######\n")
							escreva("Informe o nome do produto: ")
							leia(busca)
							
							arquivo_produtos = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
							logico achei = falso
							enquanto(nao Arquivos.fim_arquivo(arquivo_produtos) e nao achei){
								cadeia igual = Arquivos.ler_linha(arquivo_produtos)
								se(igual==busca){
									limpa()
									escreva("\tPRODUTO LOCALIZADO\n")
									achei =verdadeiro
								}senao{
									limpa()
									escreva("\tPRODUTO INEXISTENTE\n")
								}
							}Arquivos.fechar_arquivo(arquivo_produtos)
							
							pare
						caso contrario:
						limpa()
						escreva("Opção Inválida!")
						opcao = 6
					}

				
					pare
					

//////////////////////NOVA VENDA////////////////////////////////////////////////////////////////////////////////////////////////////


				caso 3:
					fatura=verdadeiro
					enquanto(fatura){
						limpa()
						escreva("##### VENDA EM ANDAMENTO #####\n")
						escreva("Informe o nome do produto: ")
						leia(nome_faturamento)
						escreva("Informe o valor do produto:")
						leia(valor_faturamento)
						pagar = pagar + valor_faturamento

						se(nome_faturamento != "" e valor_faturamento >0){
							escreva("\nDeseja incluir mais um produto a venda?\n")
							escreva("[S] Sim\n[N] Não\n--->")
							leia(quer)
							se(quer=="S" ou quer=="s"){
								fatura=verdadeiro
							}senao{
								fatura=falso
							}
							limpa()
						}
					}

					arquivo_valor = Arquivos.abrir_arquivo("D:/000.txt", 0)
					enquanto(Arquivos.fim_arquivo(arquivo_valor)){
						cadeia resposta_valor = Arquivos.ler_linha(arquivo_valor)
						real transforma = Tipos.cadeia_para_real(resposta_valor)
						pagar = pagar + transforma
					}
					Arquivos.fechar_arquivo(arquivo_valor)
					
					
					
					
					
					valor = Tipos.real_para_cadeia(valor_faturamento)
					se(Arquivos.arquivo_existe("D:/00.txt")){
						arquivo_nome = Arquivos.abrir_arquivo("D:/00.txt", 2)
						Arquivos.escrever_linha(nome_faturamento, arquivo_nome)
						Arquivos.fechar_arquivo(arquivo_nome)
						
					}senao{
						arquivo_nome = Arquivos.abrir_arquivo("D:/00.txt", 1)
						Arquivos.escrever_linha(nome_faturamento, arquivo_nome)
						Arquivos.fechar_arquivo(arquivo_nome)
						
					}
					se(Arquivos.arquivo_existe("D:/000.txt")){
						arquivo_valor = Arquivos.abrir_arquivo("D:/000.txt", 2)
						Arquivos.escrever_linha(valor, arquivo_valor)
						Arquivos.fechar_arquivo(arquivo_valor)
					}senao{
						arquivo_valor = Arquivos.abrir_arquivo("D:/000.txt", 1)
						Arquivos.escrever_linha(valor, arquivo_valor)
						Arquivos.fechar_arquivo(arquivo_valor)
						
					}
					

					final = falso
					arquivo_nome = Arquivos.abrir_arquivo("D:/00.txt", 0)
					arquivo_valor = Arquivos.abrir_arquivo("D:/000.txt", 0)
					escreva("\t##### FATURAMENTO #####\n")
					escreva("   PRODUTO\t |\tPREÇO R$\n")
					
					enquanto(nao final){
						
							cadeia resposta_produto = Arquivos.ler_linha(arquivo_nome)
						se(resposta_produto!=""){
							escreva("\t",resposta_produto,"\t")
						}
						se(resposta_produto!=""){	
							se(nao Arquivos.fim_arquivo(arquivo_nome)){
								escreva(" | ")
							}
						}
							
							cadeia resposta_valor = Arquivos.ler_linha(arquivo_valor)
						se(resposta_produto!=""){	
							escreva("\t",resposta_valor,"\n")
						}

						se(Arquivos.fim_arquivo(arquivo_nome)){
							final = verdadeiro
							Arquivos.fechar_arquivo(arquivo_valor)
							Arquivos.fechar_arquivo(arquivo_nome)
						}	
					}
					 
					escreva("\nTotal a ser pago: ",pagar)
					escreva("\nInforme o valor pago pelo cliente: ")
					leia(valor_cliente)

					inteiro ano = Calendario.ano_atual()
					inteiro mes = Calendario.mes_atual()
					inteiro dia = Calendario.dia_mes_atual()
					inteiro hora = Calendario.hora_atual(falso)
					inteiro min = Calendario.minuto_atual()
					inteiro seg = Calendario.segundo_atual()
					cadeia nome_final =Tipos.inteiro_para_cadeia(ano,10)+"-"+Tipos.inteiro_para_cadeia(mes,10)+"-"+Tipos.inteiro_para_cadeia(dia,10)+"_"+Tipos.inteiro_para_cadeia(hora,10)+"-"+Tipos.inteiro_para_cadeia(min,10)+"-"+Tipos.inteiro_para_cadeia(seg,10)
		
					inteiro data = Arquivos.abrir_arquivo("D:/"+nome_final+".txt", 1)
					cadeia preco_produto = "   PRODUTO\t-\tPREÇO R$\n"
					Arquivos.escrever_linha(preco_produto, data)

					final=verdadeiro
					arquivo_nome = Arquivos.abrir_arquivo("D:/00.txt", 0)
					arquivo_valor = Arquivos.abrir_arquivo("D:/000.txt", 0)
					
					enquanto(final){
						cadeia nome = Arquivos.ler_linha(arquivo_nome)
						cadeia custa = Arquivos.ler_linha(arquivo_valor)
						se(nome!=""){
							cadeia escrever = "\t"+nome +"\t-\t"+custa+" R$"
							Arquivos.escrever_linha(escrever, data)
						}

						se(Arquivos.fim_arquivo(arquivo_nome)){
							final=falso
							Arquivos.fechar_arquivo(arquivo_nome)
							Arquivos.fechar_arquivo(arquivo_valor)
						}
						
					}
					
					cadeia escrever_2 = "\n\nValor total da venda: "+pagar
					Arquivos.escrever_linha(escrever_2, data)
					cadeia escrever_3 = "Valor pago pelo cliente: "+valor_cliente
					Arquivos.escrever_linha(escrever_3, data)

					Arquivos.fechar_arquivo(data)

					limpa()

					escreva("  FATURAMENTO REALIZADO COM SUCESSO!\n")

					
					pare
					

///////////////////SAIR DO SISTEMA//////////////////////////////////////////////////////////////////////////////////////////////


				caso 4:
					escreva("Saindo do Sistema...")
					pare


///////////////////////CASO CONTRARIO///////////////////////////////////////////////////////////////////////////////////////////////


				caso contrario:
					escreva("Opção inválida!")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9864; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */