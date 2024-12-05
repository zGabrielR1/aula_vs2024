Imports MeuProjeto.banco

Public Class FormVendas
    ' Criando o objeto `banco` da classe banco
    Dim banco As New BancoDeDados
    Private Sub Form_Vendas_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = False
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen

        Dim sql As String

        ' Preencher ComboBox Cliente
        Try
            banco.Conectar()
            sql = "SELECT id_cliente, nome FROM clientes ORDER BY nome ASC"
            Dim clientes As DataTable = banco.Consultar(sql)
            For Each row As DataRow In clientes.Rows
                cbx_cliente.Items.Add(New With {.Text = row("nome"), .Value = row("id_cliente")})
            Next
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            banco.Desconectar()
        End Try
        cbx_cliente.DisplayMember = "Text"
        cbx_cliente.ValueMember = "Value"
        cbx_cliente.DropDownStyle = ComboBoxStyle.DropDownList

        ' Preencher ComboBox Produto
        Try
            banco.Conectar()
            sql = "SELECT id_produto, descricao FROM produtos ORDER BY descricao ASC"
            Dim produtos As DataTable = banco.Consultar(sql)
            For Each row As DataRow In produtos.Rows
                cbx_produto.Items.Add(New With {.Text = row("descricao"), .Value = row("id_produto")})
            Next
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            banco.Desconectar()
        End Try
        cbx_produto.DisplayMember = "Text"
        cbx_produto.ValueMember = "Value"
        cbx_produto.DropDownStyle = ComboBoxStyle.DropDownList

        ' Desativar 
        Formatar.Desativar(Me)
        GroupBox.Enabled = False
        txt_id.ReadOnly = True

        ' Atualizar listagem
        Listar.Vendas()
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar 
        Formatar.Limpar(Me)
        Formatar.Ativar(Me)
        GroupBox.Enabled = True
        txt_id.Text = "NOVO"
    End Sub

    Private Sub btn_adicionar_Click(sender As Object, e As EventArgs) Handles btn_adicionar.Click
        ' Validação
        If (cbx_produto.SelectedIndex = -1 Or txt_qtd.Text = Nothing) Then
            MsgBox("Por favor informe o produto e a quantidade!")
            Exit Sub
        End If

        ' Pegar dados
        Dim id_produto As Integer = cbx_produto.SelectedItem.Value
        Dim nome_produto As String = cbx_produto.SelectedItem.Text
        Dim qtd_produto As Double = txt_qtd.Text

        ' Validação da qtd em estoque
        Try
            banco.Conectar()
            Dim sql As String = "SELECT estoque FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = banco.Consultar(sql, id_produto)
            Dim estoque_produto As Integer = dados(0)("estoque")

            ' Verificar se a quantidade no estoque é suficiente para a venda
            If (qtd_produto > estoque_produto) Then
                MsgBox("Estoque insuficiente para este produto!")
                Exit Sub ' Encerar o algoritmo
            End If
        Catch erro As Exception
            MsgBox("Houve uma exceção com o Banco de Dados: " & erro.Message)
        Finally
            banco.Desconectar()
        End Try

        ' Pegar o preço do produto
        Dim preco_produto As Double
        Try
            banco.Conectar()
            Dim sql As String = "SELECT preco FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = banco.Consultar(sql, id_produto)
            preco_produto = dados.Rows(0)("preco")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            banco.Desconectar()
        End Try

        ' Calcular o valor total do produto
        Dim total_produto As Double = qtd_produto * preco_produto

        ' Adicionar os dados na listagem
        Dim listItem As New ListViewItem(id_produto)
        listItem.SubItems.Add(nome_produto)
        listItem.SubItems.Add(Format(preco_produto, "#,##0.00"))
        listItem.SubItems.Add(qtd_produto)
        listItem.SubItems.Add(Format(total_produto, "#,##0.00"))
        list_produtos_adicionados.Items.Add(listItem)
        list_produtos_adicionados.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas

        'Atuaizar total da venda
        label_valor_total.Text = Format(CDbl(label_valor_total.Text) + total_produto, "#,##0.00")

        ' Limpar os inputs
        cbx_produto.SelectedIndex = -1
        txt_qtd.Text = Nothing
    End Sub

    Private Sub btn_sair_Click(sender As Object, e As EventArgs) Handles btn_sair.Click
        Me.Close()
    End Sub

    Private Sub btn_remover_Click(sender As Object, e As EventArgs) Handles btn_remover.Click
        ' Validação
        If (list_produtos_adicionados.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub
        End If

        ' Confirmação
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja remover este item da venda?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o indice da linha selecionada
            Dim linha_selecionada As Integer = list_produtos_adicionados.SelectedIndices(0)

            ' Pegar o valor total do produto
            Dim total_produto As Double = list_produtos_adicionados.Items(linha_selecionada).SubItems(4).Text

            ' Remover da listagem
            list_produtos_adicionados.Items.RemoveAt(linha_selecionada)

            'Atuaizar total da venda
            label_valor_total.Text = Format(CDbl(label_valor_total.Text) - total_produto, "#,##0.00")
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação
        If (cbx_cliente.SelectedIndex = -1 Or list_produtos_adicionados.Items.Count = 0) Then
            MsgBox("Por favor informe o cliente e/ou os produtos da venda!")
            Exit Sub
        End If

        ' Confirmação
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja gravar esta venda?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Dim sql As String

            ' Pegar os dados
            Dim id_cliente As Integer = cbx_cliente.SelectedItem.Value
            Dim data_atual As Date = Format(Now(), "yyyy-MM-dd")
            Dim total_venda As Double = label_valor_total.Text
            Dim id_usuario As Integer = FormLogin.usuario.Id

            Try
                banco.Conectar()

                ' Iniciar Transação
                banco.IniciarTransacao()

                ' Trancar tabela para outro usuário não gravar uma venda até esta terminar
                banco.TrancarTabela("vendas")

                ' Gravar a venda
                sql = "INSERT INTO vendas (data, valor_total, cancelado, id_cliente, id_usuario) VALUES (?,?,'N',?,?)"
                banco.Executar(sql, data_atual, total_venda, id_cliente, id_usuario)

                ' Pegar o ID da venda recém gravada
                sql = "SELECT MAX(id_venda) AS ultimo_id FROM vendas"
                Dim dados As DataTable = banco.Consultar(sql)
                Dim id_venda As Integer = dados.Rows(0)("ultimo_id")

                ' Gravar os produtos nos detalhes da venda
                Dim i As Integer = 0
                While (i < list_produtos_adicionados.Items.Count)
                    Dim id_produto As Integer = list_produtos_adicionados.Items(i).Text
                    Dim qtd_produto As Integer = list_produtos_adicionados.Items(i).SubItems(3).Text
                    Dim total_produto As Double = list_produtos_adicionados.Items(i).SubItems(4).Text

                    sql = "INSERT INTO detalhes (qtd_total, valor_total, id_produto, id_venda) VALUES (?,?,?,?)"
                    banco.Executar(sql, qtd_produto, total_produto, id_produto, id_venda)

                    ' Atualizar a quantidade de estoque do produto na tabela produtos
                    sql = "UPDATE produtos SET estoque = estoque - ? WHERE id_produto = ?"
                    banco.Executar(sql, qtd_produto, id_produto)

                    ' Incrementar o contador para avançar o produto na listagem
                    i = i + 1
                End While

                ' Comitar Transação
                banco.ConfirmarTransacao()

                ' Sucesso
                MsgBox("Venda registrada com sucesso!")
            Catch erro As Exception
                ' Voltar Transação
                banco.VoltarTransacao()
                MsgBox("Houve um problema com a operação no banco de dados: " & erro.Message)
            Finally
                banco.Desconectar()
            End Try

            ' Limpar e desativar
            list_produtos_adicionados.Items.Clear()
            cbx_cliente.SelectedIndex = -1
            Formatar.Limpar(Me)
            Formatar.Desativar(Me)
            GroupBox.Enabled = False

            ' Atualizar listagem
            Listar.Vendas()

            ' Resetar valor da venda
            label_valor_total.Text = "0,00"
        End If
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Validação
        If (list_vendas.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione uma venda!")
            Exit Sub
        End If

        ' Confirmação
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja cancelar esta venda?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o indice da linha selecionada
            Dim linha_selecionada As Integer = list_vendas.SelectedIndices(0)

            ' Pegar os id da venda
            Dim id_venda As Integer = list_vendas.Items(linha_selecionada).Text

            ' Atualizar o valor no banco
            Try
                banco.Conectar()
                Dim sql As String = "UPDATE vendas SET cancelado = 'S' WHERE id_venda = ?"
                banco.Executar(sql, id_venda)

                ' Sucesso
                MsgBox("Venda cancelada com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com a operação no banco de dados: " & erro.Message)
            Finally
                banco.Desconectar()
            End Try

            ' Atualizar listagem
            Listar.Vendas()
        End If
    End Sub

    Private Sub GroupBox_Enter(sender As Object, e As EventArgs) Handles GroupBox.Enter

    End Sub
End Class