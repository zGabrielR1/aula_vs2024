programa
{
	inclua biblioteca Calendario
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Arquivos
	funcao imprimir_menu() {
		escreva("########## BEM VINDO AO SISTEMA ##########\n")
		escreva("##########	MENU DE OPCOES	##########\n")
		escreva("[1] Cadastrar Produto\n[2] Ver Produtos\n[3] Nova Venda\n[4] Sair\n")
	}

	funcao logico e_correto_nome(cadeia nomezinho){
		se(nomezinho==""){
			retorne falso
		}senao{
			retorne verdadeiro
		}
	}

	
	funcao logico e_correto_valor(real numero){
		se(numero==0){
			retorne falso
		}senao{
			retorne verdadeiro
		}
	}
	funcao logico produto_localizado(cadeia tem_nome){
		inteiro arquivo_nome = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
		enquanto (nao Arquivos.fim_arquivo(arquivo_nome)) {
			cadeia achou_nome = Arquivos.ler_linha(arquivo_nome)
			se(tem_nome == achou_nome){
				Arquivos.fechar_arquivo(arquivo_nome)
				retorne verdadeiro
			}
		}
		Arquivos.fechar_arquivo(arquivo_nome)
		retorne falso
	}

	funcao inicio()
	{
		cadeia nome,str_valor,nomes,valores
		inteiro arquivo_valor=0,arquivo_nome=0,qtd_nomes=0
		inteiro opcao=0,escolhas=0,i=10+1
		real dbl_valor, dbl_valores,soma=0
		logico correto1=falso,correto2=falso,sair=falso,localizado=falso
		i++
		faca{
			imprimir_menu()leia(opcao)limpa()
			escolha(opcao){
				caso 1:
					faca{
						escreva("##########	CADASTRO EM ANDAMENTO	##########\n")
						escreva("Informe o nome do produto:	")leia(nome)
						correto1=e_correto_nome(nome)		
						escreva("Informe o valor do produto: R$")leia(dbl_valor)
						correto2=e_correto_valor(dbl_valor)
						se(correto1==falso ou correto2==falso){
							limpa()escreva("DADOS INVÁLIDOS, POR FAVOR VERIFIQUE!\n")
						}senao se(correto1==verdadeiro e correto2==verdadeiro){
							arquivo_nome = Arquivos.abrir_arquivo("D:/produtos.txt", 2)
							Arquivos.escrever_linha(nome, arquivo_nome)
							Arquivos.fechar_arquivo(arquivo_nome)
							arquivo_valor = Arquivos.abrir_arquivo("D:/valores.txt", 2)
							str_valor = Tipos.real_para_cadeia(dbl_valor)
							Arquivos.escrever_linha(str_valor, arquivo_valor)
							Arquivos.fechar_arquivo(arquivo_valor)
							limpa()escreva(" NOVO PRODUTO GRAVADO COM SUCESSO!\n")
							sair=verdadeiro
						}
					}enquanto(sair!=verdadeiro)
					pare
				caso 2:
					faca{
						qtd_nomes=0
						soma=0
						limpa()escreva("##########	CONSULTA DE ESTOQUE	##########\n")
						escreva("PRODUTO			|		PREÇO R$\n\n")
						arquivo_nome = Arquivos.abrir_arquivo("D:/produtos.txt", 0)
						arquivo_valor = Arquivos.abrir_arquivo("D:/valores.txt", 0)
						enquanto (nao Arquivos.fim_arquivo(arquivo_nome)) {
							nomes = Arquivos.ler_linha(arquivo_nome)
							se(nomes!=""){	
								qtd_nomes++
							}
							valores = Arquivos.ler_linha(arquivo_valor)
							se(valores!=""){	
								dbl_valores = Tipos.cadeia_para_real(valores)
								soma=soma+dbl_valores
							}
							escreva(nomes,"\t\t\t",valores,"\n")
						}
						escreva("-----------------------------------\nQtd de produtos em estoque:	",qtd_nomes)
						escreva("\nValor total do estoque:		",soma,"\n")
						Arquivos.fechar_arquivo(arquivo_valor)
						Arquivos.fechar_arquivo(arquivo_nome)
						escreva("-----------------------------------\n[1] Voltar Para o menu principal\n[2] Consultar produto pelo nome\n")leia(escolhas)limpa()limpa()
						se(escolhas==2){
							escreva("##########	BUSCA DE PRODUTO	##########\n")
							escreva("Informe o nome do produto:	")leia(nome)limpa()
							localizado=produto_localizado(nome)
							se(localizado){
								escreva("	PRODUTO EXISTENTE!\n")
								escolhas=1
							}senao{
								escreva("	PRODUTO INEXISTENTE!\n")
								escolhas=1
							}
						}
						se(escolhas>2){
							limpa()escreva("Opção Inválida!")
							opcao=4
							escolhas=1
						}
												
					}enquanto(escolhas!=1)
					pare
				caso 3:
					real valor_pago
					cadeia str_ano = Tipos.inteiro_para_cadeia(Calendario.ano_atual(),10)
					cadeia str_mes = Tipos.inteiro_para_cadeia(Calendario.mes_atual(), 10)
					cadeia str_dia = Tipos.inteiro_para_cadeia(Calendario.dia_mes_atual(), 10)
					cadeia str_hora = Tipos.inteiro_para_cadeia(Calendario.hora_atual(falso), 10)
					cadeia str_minuto = Tipos.inteiro_para_cadeia(Calendario.minuto_atual(), 10)
					sair=falso
					cadeia nome_arquivo = "D:\\venda_"+str_ano+"-"+str_mes+"-"+str_dia+"_"+str_hora+"-"+str_minuto+".txt"
					inteiro arquivo = Arquivos.abrir_arquivo(nome_arquivo, 1)
					
					faca{
						
						cadeia str_opcao
						escreva("##########	VENDA EM ANDAMENTO	##########\n")
						escreva("Informe o nome do produto:	")leia(nome)
						escreva("Informe o valor do produto: R$")leia(dbl_valor)
						arquivo_nome = Arquivos.abrir_arquivo("D:/produtos_venda"+i+".txt", 2)
						Arquivos.escrever_linha(nome, arquivo_nome)
						Arquivos.fechar_arquivo(arquivo_nome)
						arquivo_valor = Arquivos.abrir_arquivo("D:/valores_venda"+i+".txt", 2)
						str_valor = Tipos.real_para_cadeia(dbl_valor)
						Arquivos.escrever_linha(str_valor, arquivo_valor)
						Arquivos.fechar_arquivo(arquivo_valor)
						escreva("\nDeseja incluir mais um produto na venda?\n")
						escreva("[S] Sim\n[N] Não\n")leia(str_opcao)limpa()
						str_opcao=Texto.caixa_alta(str_opcao)
						se(str_opcao=="S"){
							sair=falso
						}senao{
							real soma2=0
							arquivo_nome = Arquivos.abrir_arquivo("D:/produtos_venda"+i+".txt", 0)
							arquivo_valor = Arquivos.abrir_arquivo("D:/valores_venda"+i+".txt", 0)
							escreva("##########	FATURAMENTO	##########\n")
							escreva("PRODUTO			|		PREÇO R$\n")
							enquanto (nao Arquivos.fim_arquivo(arquivo_nome)) {
							nomes = Arquivos.ler_linha(arquivo_nome)
							valores = Arquivos.ler_linha(arquivo_valor)
							se(valores!=""){	
								dbl_valores = Tipos.cadeia_para_real(valores)
								soma2=soma2+dbl_valores
							}
							escreva(nomes,"\t\t\t",valores,"\n")
						}
						escreva("-----------------------------------\nTotal valor a ser pago:		",soma2,"\n")
						escreva("Informe o valor pago pelo cliente:	")leia(valor_pago)
						Arquivos.fechar_arquivo(arquivo_nome)
						Arquivos.fechar_arquivo(arquivo_valor)
						Arquivos.escrever_linha("##########	FATURAMENTO	##########", arquivo)
						Arquivos.escrever_linha("PRODUTO			|		PREÇO R$", arquivo)
						Arquivos.escrever_linha("", arquivo)
						arquivo_nome = Arquivos.abrir_arquivo("D:/produtos_venda"+i+".txt", 0)
						arquivo_valor = Arquivos.abrir_arquivo("D:/valores_venda"+i+".txt", 0)
						i++
						enquanto (nao Arquivos.fim_arquivo(arquivo_nome)) {
							nomes = Arquivos.ler_linha(arquivo_nome)
							valores = Arquivos.ler_linha(arquivo_valor)
							Arquivos.escrever_linha(nomes+"\t\t\t\t"+valores, arquivo)
							Arquivos.escrever_linha("", arquivo)
						}	
						Arquivos.escrever_linha("Total valor a ser pago:		"+soma2, arquivo)
						Arquivos.escrever_linha("Informe o valor pago pelo cliente:	"+valor_pago, arquivo)
						Arquivos.fechar_arquivo(arquivo_nome)
						Arquivos.fechar_arquivo(arquivo_valor)
						Arquivos.fechar_arquivo(arquivo)
						sair=verdadeiro
						limpa()escreva("	FATURAMENTO REALIZADO COM SUCESSO	\n")
						}	
						
					}enquanto(sair!=verdadeiro)
					

					pare
				caso 4:
					escreva("Saindo do Sistema...")
					pare
				caso contrario:
					escreva("Opção Inválida!")
					opcao=4
					pare
			}
		}enquanto (opcao!=4 ou opcao<4)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2448; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */