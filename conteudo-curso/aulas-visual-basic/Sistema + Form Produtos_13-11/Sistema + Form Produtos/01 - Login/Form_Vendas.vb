Public Class Form_Vendas
    Private Sub Form_Vendas_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        ' Preencher ComboBox Cliente
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT id_cliente, nome FROM clientes ORDER BY nome"
            Dim clientes As DataTable = BancoDeDados.consultar(sql)
            For Each cliente As DataRow In clientes.Rows
                cbx_cliente.Items.Add(New With {.Text = cliente("nome"), .Value = cliente("id_cliente")})
            Next
        Catch erro As Exception
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
        cbx_cliente.DisplayMember = "Text"
        cbx_cliente.ValueMember = "Value"

        ' Preencher ComboBox Produto
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT id_produto, descricao FROM produtos ORDER BY descricao"
            Dim produtos As DataTable = BancoDeDados.consultar(sql)
            For Each produto As DataRow In produtos.Rows
                cbx_produto.Items.Add(New With {.Text = produto("descricao"), .Value = produto("id_produto")})
            Next
        Catch erro As Exception
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
        cbx_produto.DisplayMember = "Text"
        cbx_produto.ValueMember = "Value"
    End Sub

    Private Sub btn_adicionar_Click(sender As Object, e As EventArgs) Handles btn_adicionar.Click
        ' Validação de campos
        If (cbx_produto.SelectedIndex = -1 Or txt_qtd.Text = "") Then
            MsgBox("Por favor informe o produto e a quantidade!")
            Exit Sub ' Encerrar o algoritmo
        End If

        ' Pegar os dados
        Dim id_produto As Integer = cbx_produto.SelectedItem.Value
        Dim nome_produto As String = cbx_produto.SelectedItem.Text
        Dim qtd_produto As Integer = txt_qtd.Text

        ' Validação da qtd em estoque
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT estoque FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = BancoDeDados.consultar(sql, id_produto)
            Dim estoque_produto As Integer = dados(0)("estoque")

            ' Verificar se a quantidade no estoque é suficiente para a venda
            If (qtd_produto > estoque_produto) Then
                MsgBox("Estoque insuficiente para este produto!")
                Exit Sub ' Encerar o algoritmo
            End If
        Catch erro As Exception
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try

        ' Consultar o preço no banco de dados
        Dim preco_produto As Double
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT preco FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = BancoDeDados.consultar(sql, id_produto)
            preco_produto = dados(0)("preco")
        Catch erro As Exception
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try

        ' Calcular o valor total do produto
        Dim total_produto As Double = preco_produto * qtd_produto

        ' Adicionar os dados do produto no ListView
        Dim list_item As New ListViewItem(id_produto)
        list_item.SubItems.Add(nome_produto)
        list_item.SubItems.Add(preco_produto)
        list_item.SubItems.Add(qtd_produto)
        list_item.SubItems.Add(total_produto)
        list_produtos_adicionados.Items.Add(list_item)

        ' Atualizar o valor total da venda na label
        label_valor_total.Text = CDbl(label_valor_total.Text) + total_produto

        ' Limpar os campos
        cbx_produto.SelectedIndex = -1
        txt_qtd.Text = ""
    End Sub

    Private Sub btn_remover_Click(sender As Object, e As EventArgs) Handles btn_remover.Click
        ' Validação
        If (list_produtos_adicionados.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub ' Encerrar algoritmo
        End If

        ' Confirmação
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja remover este produto?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o índice do produto selecionado na ListView
            Dim linha_selecionada As Integer = list_produtos_adicionados.SelectedIndices(0)

            ' Pegar o valor total do produto e decrementar do valor da venda
            Dim total_produto As Double = list_produtos_adicionados.Items(linha_selecionada).SubItems(4).Text
            label_valor_total.Text = CDbl(label_valor_total.Text) - total_produto

            ' Remover da ListView
            list_produtos_adicionados.Items(linha_selecionada).Remove()
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação
        If (cbx_cliente.SelectedIndex = -1 Or list_produtos_adicionados.Items.Count = 0) Then
            MsgBox("Por favor informe o cliente ou informe o(s) produto(s)")
            Exit Sub ' Encerrar o algoritmo
        End If

        ' Pegar os dados para a tabela vendas
        Dim data_venda As Date = Format(Now(), "yyyy-MM-dd")
        Dim total_venda As Double = label_valor_total.Text
        Dim id_cliente As Integer = cbx_cliente.SelectedItem.Value
        Dim id_usuario As Integer = Globais.id_usuario

        ' Gravar os dados no banco
        Try
            BancoDeDados.conectar()

            ' Inicio da transação
            BancoDeDados.iniciar_transação()

            ' Inserir os dados na tabela vendas
            Dim sql As String = "INSERT INTO vendas (data, valor_total, id_cliente, id_usuario) VALUES (?,?,?,?)"
            BancoDeDados.executar(sql, data_venda, total_venda, id_cliente, id_usuario)

            ' Travar a tabela vendas, para negar a inserção de dados nela por outros usuários, até a venda termiar
            BancoDeDados.travar_tabela("vendas")

            ' Inserir os dados na tabela detalhes
            Dim i As Integer = 0
            While (i < list_produtos_adicionados.Items.Count)
                Dim id_produto As Integer = list_produtos_adicionados.Items(i).Text
                Dim qtd_produto As Integer = list_produtos_adicionados.Items(i).SubItems(3).Text
                Dim total_produto As Double = list_produtos_adicionados.Items(i).SubItems(4).Text

                sql = "INSERT INTO detalhes (qtd_total, valor_total, id_produto, id_venda) VALUES (?,?,?,(SELECT FIRST 1 id_venda FROM vendas ORDER BY id_venda DESC))"
                BancoDeDados.executar(sql, qtd_produto, total_produto, id_produto)

                ' Atualizar a quantidade de estoque do produto na tabela produtos
                sql = "UPDATE produtos SET estoque = estoque - ? WHERE id_produto = ?"
                BancoDeDados.executar(sql, qtd_produto, id_produto)

                ' Incrementear o contador apra avançar o produto na listagem
                i = i + 1
            End While

            ' Confirmar a transação
            BancoDeDados.confirmar_transacao()
        Catch erro As Exception
            ' Deu erro em alguma opração com o banco, deve voltar a transação
            BancoDeDados.voltar_transacao()
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub

    Private Sub GroupBox_Enter(sender As Object, e As EventArgs) Handles GroupBox.Enter

    End Sub
End Class