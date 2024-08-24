programa
{
    cadeia produtos[100][2]
    real precos[100]
    inteiro qtde_produtos = 0
    real valor_total_estoque = 0.0

    funcao inteiro menu_principal()
    {
        inteiro opcao
        escreva("\n\n###### BEM VINDO AO SISTEMA ######\n")
        escreva("[1] Cadastrar Produto\n")
        escreva("[2] Consultar Produto\n")
        escreva("[3] Nova Venda\n")
        escreva("[4] Sair\n")
        leia(opcao)
        retorne opcao
    }

    funcao cadastrar_produto()
    {
        cadeia nome_produto
        real preco_produto
        escreva("\n\n####### CADASTRO EM ANDAMENTO #######\n")
        escreva("Informe o nome do produto: ")
        leia(nome_produto)
        escreva("Informe o valor do produto: ")
        leia(preco_produto)

        se (nome_produto == "" e preco_produto <= 0)
        {
            escreva("DADOS INVÁLIDOS. POR FAVOR VERIFIQUE!\n")
            cadastrar_produto()
        }
        senao
        {
            produtos[qtde_produtos][0] = nome_produto
            produtos[qtde_produtos][1] = preco_produto
            precos[qtde_produtos] = preco_produto
            qtde_produtos++
            valor_total_estoque += preco_produto
            escreva("NOVO PRODUTO GRAVADO COM SUCESSO\n")
        }
    }

    funcao consultar_produto()
    {
        inteiro opcao
        escreva("\n\n###### CONSULTA DE ESTOQUE ######\n")
        para(inteiro i = 0; i < qtde_produtos; i++)
        {
            escreva(i + 1, ". ", produtos[i][0], "\t\t\t", "PREÇO: R$ ", precos[i], "\n")
        }
        escreva("Qtd de produtos em estoque: ", qtde_produtos, "\n")
        escreva("Valor total do estoque: R$ ", valor_total_estoque, "\n")
        escreva("\n[1] Voltar para o Menu Principal\n")
        escreva("[2] Consultar produto pelo Nome\n")
        leia(opcao)

        se(opcao == 1)
        {
            programa_principal()
        }
        senao se(opcao == 2)
        {
            cadeia nome_produto
            escreva("Informe o nome do produto: ")
            leia(nome_produto)
            buscar_produto(nome_produto)
        }
        senao
        {
            escreva("Opção Inválida!\n")
            consultar_produto()
        }
    }
    funcao buscar_produto(cadeia nome)
    {
        logico encontrado = falso
        para(inteiro i = 0; i < qtde_produtos; i++)
        {
            se (produtos[i][0] == nome)
            {
                escreva("PRODUTO LOCALIZADO: ", produtos[i][0], "\t PREÇO: R$ ", precos[i], "\n")
                encontrado = verdadeiro
            }
        }
        se (encontrado == falso)
        {
            escreva("PRODUTO INEXISTENTE\n")
        }
    }

    funcao nova_venda()
    {
        cadeia nome_produto
        real preco_produto
        real valor_total_venda = 0.0
        inteiro opcao

        escreva("\n\n####### VENDA EM ANDAMENTO #######\n")

        faca
        {
            escreva("Informe o nome do produto: ")
            leia(nome_produto)
            escreva("Informe o valor do produto: ")
            leia(preco_produto)

            se (nome_produto == "" e preco_produto <= 0)
            {
                escreva("DADOS INVÁLIDOS. POR FAVOR VERIFIQUE!\n")
            }
            senao
            {
                valor_total_venda += preco_produto
                escreva("Deseja incluir mais um produto na venda? (1-Sim / 0-Não): ")
                leia(opcao)
            }
        } enquanto (opcao == 1)

        escreva("\nInforme o valor pago pelo cliente: ")
        real valor_pago
        leia(valor_pago)

        escreva("\n###### FATURAMENTO ######\n")
        escreva("Valor total da venda: R$ ", valor_total_venda, "\n")
        escreva("Valor pago pelo cliente: R$ ", valor_pago, "\n")
        escreva("Troco: R$ ", valor_pago - valor_total_venda, "\n")
        escreva("FATURAMENTO REALIZADO COM SUCESSO\n")
    }

    funcao programa_principal()
    {
        inteiro opcao
        faca
        {
            opcao = menu_principal()
            escolha(opcao)
            {
                caso 1:
                    cadastrar_produto()
                    pare
                caso 2:
                    consultar_produto()
                    pare
                caso 3:
                    nova_venda()
                    pare
                caso 4:
                    escreva("Saindo do sistema.\n")
                    pare
                caso 5:
                    escreva("Opção Inválida!\n")
            }
        } enquanto (opcao != 5)
    }

    funcao inicio()
    {
        programa_principal()
    }
}