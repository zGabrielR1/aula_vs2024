programa {
    inclua biblioteca Arquivos
    inclua biblioteca Tipos
    inclua biblioteca Calendario

    
    funcao logico validacao(cadeia produtos, inteiro valores) {
        se (produtos != "" e valores > 0) {
            retorne verdadeiro
        } senao {
            retorne falso
        }
    }

    funcao imprimir_menu() {
        escreva("\n#### MENU DE PRINCIPAL ####\n")
        escreva("[1] Cadastro de Produto\n")
        escreva("[2] Visualizar produtos\n")
        escreva("[3] Nova Venda\n")
        escreva("[4] Deslogar\n")
    }

    funcao logico busca(cadeia nome_produto) {
        inteiro arquivo = Arquivos.abrir_arquivo("D:/amanda/Portugol.txt", 0)
        
        enquanto (nao Arquivos.fim_arquivo(arquivo)){
            se(nome_produto == Arquivos.ler_linha(arquivo)) {
                Arquivos.fechar_arquivo(arquivo)
                retorne verdadeiro
            } 
        } 
        
        Arquivos.fechar_arquivo(arquivo)
        retorne falso
        
    }


    funcao inicio(){

        inteiro opcao, i = 0, qtd_produtos = 0, redirecionar
        cadeia produtos, buscar_produto
        real valores, valor_final = 0
        
        faca {
            
            imprimir_menu()
            leia (opcao)    
            limpa()
            
            escolha (opcao) {
                caso 1:

                    inteiro arquivo_produtos = Arquivos.abrir_arquivo("D:/amanda/Portugol.txt", 2)
                    inteiro arquivo_valores = Arquivos.abrir_arquivo("D:/amanda/Portugol.txt", 2)
                    
                    i = 0
                    enquanto (i == 0) {
                        escreva ("\n#### CADASTRO EM PROCESSAMENTO ####\n")
                        escreva ("Informe o nome do Produto: ")
                        leia (produtos)
                        escreva ("Informe o valor do Produto: R$ ")
                        leia (valores)

                        se (validacao(produtos,valores)){
                            Arquivos.escrever_linha("\n"+produtos, arquivo_produtos)
                            Arquivos.escrever_linha ("\n"+valores, arquivo_valores)
                            i++
                            qtd_produtos++
                            
                        } senao{
                            limpa()
                            escreva ("DADOS INVÁLIDOS!\n")
                        }
                    }

                    limpa()
                    escreva ("  NOVO PRODUTO CADASTRADO!")
                    
                    Arquivos.fechar_arquivo(arquivo_produtos)
                    Arquivos.fechar_arquivo(arquivo_valores)

                    pare
                caso 2:

                    qtd_produtos = -1
                    inteiro imprimir_produtos = Arquivos.abrir_arquivo("D:/amanda/Portugol.txt", 0)
                    inteiro imprimir_valores = Arquivos.abrir_arquivo("D:/amanda/Portugol.txt", 0)
                    cadeia str_soma
                    real soma, soma2 = 0
                    

                    
                    escreva ("\n#### CONSULTA DE ESTOQUE ####")
                    escreva ("\nPRODUTO\t\tPREÇO R$")
                    

                    
                    faca{

                        str_soma = (Arquivos.ler_linha(imprimir_valores))

                        se (str_soma != ""){

                            soma = Tipos.cadeia_para_real(str_soma)
                            soma2 = soma2 + soma    
                        }

                        
                        escreva("\n" ,Arquivos.ler_linha(imprimir_produtos), "\t\t", str_soma)
                        qtd_produtos++


                    } enquanto ( nao Arquivos.fim_arquivo(imprimir_valores))
                
                    escreva ("\nQuantidade de produtos em estoque: " ,qtd_produtos,"\n")
                    escreva ("Valor total do estoque: R$ " ,soma2,"\n")
                         
                    Arquivos.fechar_arquivo(imprimir_produtos)
                    Arquivos.fechar_arquivo(imprimir_valores)

                    escreva ("\n[1] Voltar para o Menu Principal")
                    escreva ("\n[2] Consultar produto pelo NOME\n")
                    leia(redirecionar)

                    escolha (redirecionar) {
                        caso 1:
                            limpa()
                            pare
                        caso 2:
                            
                            limpa()
                            escreva ("\n$$$$ BUSCA DE PRODUTO $$$$")
                            escreva("\nInforme o nome do Produto: ")
                            leia(buscar_produto)
                            busca(buscar_produto)
                            se (busca(buscar_produto) == verdadeiro) {
                                limpa()
                                escreva("\tPRODUTO LOCALIZADO!")
                            } senao {
                                limpa()
                                escreva("\tPRODUTO INEXISTENTE!")
                            }
                        
                            pare
                        caso contrario:
                            limpa()
                            escreva ("\nOpção inválida!\n")
                            opcao = 4
                    }
                    
                    pare
                    
                caso 3:

                    cadeia produto_venda
                    inteiro preco_produto, valor_pago
                    real total = 0
                    cadeia parar = "N"
                    cadeia data = Calendario.ano_atual() + "-" + Calendario.mes_atual() + "-" + Calendario.dia_mes_atual()
                    cadeia hora = Calendario.hora_atual(falso) + "-" + Calendario.minuto_atual()
                    cadeia nome_arquivo = data + "_" + hora

                    inteiro arquivo = Arquivos.abrir_arquivo("D:/amanda/Portugol/arquivos/"+"venda_"+nome_arquivo+".txt", 1)
                    
                    faca {
                        escreva ("\n#### VENDA EM ANDAMENTO ####")
                        escreva("\nInforme o nome do produto: ")
                        leia(produto_venda)
                        escreva("Informe o valor do produto: R$ ")
                        leia(preco_produto)

                        se (validacao(produto_venda,preco_produto)){
                            Arquivos.escrever_linha("\n"+produto_venda+"\t"+preco_produto, arquivo)                    
                        } senao{
                            limpa()
                            escreva ("DADOS INVÁLIDOS!\n")
                        }

                        total = total + preco_produto
                        
                        escreva ("\nDeseja incluir mais um produto na venda?")
                        escreva("\n[S] Sim")
                        escreva("\n[N] Não\n")
                        leia(parar)
                        limpa()

                    }enquanto (parar != "N" e parar != "n")

                    Arquivos.fechar_arquivo(arquivo)

                    escreva ("\n#### LUCRO #####\n")
                    escreva ("PRODUTO\t\tPREÇO R$")

                    arquivo = Arquivos.abrir_arquivo("D:/amanda/Portugol/arquivos/"+"venda_"+nome_arquivo+".txt", 0)
                    
                    faca{
                        
                        escreva("\n" ,Arquivos.ler_linha(arquivo))
                    } enquanto ( nao Arquivos.fim_arquivo(arquivo))

                    Arquivos.fechar_arquivo(arquivo)

                    arquivo = Arquivos.abrir_arquivo("D:/amanda/Portugol/arquivos/"+"venda_"+nome_arquivo+".txt", 2)
                    
                    escreva ("\nTotal a se pago: R$ " ,total,"\n")
                    escreva ("Informe o valor pago pelo cliente R$ ")
                    leia(valor_pago)
                    Arquivos.escrever_linha("\nValor pago pelo cliente R$"+valor_pago, arquivo)
                    
                        
                    Arquivos.fechar_arquivo(arquivo)
                    limpa()

                    escreva ("LUCRO REALIZADO COM SUCESSO!")
                    pare
                caso 4:
                    limpa()
                    escreva ("\nDeslogando...\n")
                    pare
                caso contrario:
                    escreva ("\nOpção inválida!\n\n")
            } 

            
        } enquanto ( opcao != 4)
        
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3128; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */