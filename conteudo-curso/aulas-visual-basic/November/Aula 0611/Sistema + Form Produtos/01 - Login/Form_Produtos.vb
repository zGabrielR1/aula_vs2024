Public Class Form_Produtos
    Private Sub Form_Produtos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = False
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen

        ' Confirgurando a ListView
        list_produtos.View = View.Details
        list_produtos.GridLines = True
        list_produtos.FullRowSelect = True
        list_produtos.MultiSelect = False
        list_produtos.Columns.Add("ID")
        list_produtos.Columns.Add("Descrição")
        list_produtos.Columns.Add("Preço")
        list_produtos.Columns.Add("Estoque")

        ' Desativar Form
        Formatar.desativar(Me)
        txt_id.ReadOnly = True

        ' Preencher a ListView
        Listas.produtos()
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar Form
        Formatar.limpar(Me)
        Formatar.ativar(Me)
        txt_id.Text = "Novo"
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
    End Sub

    Private Sub btn_alterar_Click(sender As Object, e As EventArgs) Handles btn_alterar.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (list_produtos.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = list_produtos.SelectedIndices(0)

        ' Passar os dados da linha selecionada do ListView para o formulário
        txt_id.Text = list_produtos.Items(linha_selecionada).SubItems(0).Text
        txt_descricao.Text = list_produtos.Items(linha_selecionada).SubItems(1).Text
        txt_preco.Text = list_produtos.Items(linha_selecionada).SubItems(2).Text
        txt_estoque.Text = list_produtos.Items(linha_selecionada).SubItems(3).Text

        ' Ativar Form
        Formatar.ativar(Me)
    End Sub

    Private Sub btn_excluir_Click(sender As Object, e As EventArgs) Handles btn_excluir.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (list_produtos.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub
        End If

        ' Confirmar se o usuário realmente deseja excluir o cliente
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem erteza que deseja remover este produto?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Dim linha_selecionada As Integer = list_produtos.SelectedIndices(0)
            Dim id_produto As Integer = list_produtos.Items(linha_selecionada).Text

            'Banco de Dados
            Try
                BancoDeDados.conectar()
                Dim sql As String = "DELETE FROM produtos WHERE id_produto = ?"
                BancoDeDados.executar(sql, id_produto)

                ' Sucesso
                MsgBox("Produto removido com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Finally
                BancoDeDados.desconectar()
            End Try

            ' Atualizar a ListView
            Listas.produtos()

            ' Total
            label_total.Text = "Total: " & list_produtos.Items.Count
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação Campos
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        Dim id As String = txt_id.Text
        Dim descricao As String = txt_descricao.Text
        Dim preco As Double = txt_preco.Text
        Dim estoque As Integer = txt_estoque.Text

        ' Banco de Dados
        Try
            BancoDeDados.conectar()

            ' Vericar se deve inserir novo cliente ou alterar existente
            Dim sql As String
            Dim mensagem As String
            If (id = "Novo") Then
                sql = "INSERT INTO produtos (descricao, preco, estoque) VALUES (?, ?, ?)"
                BancoDeDados.executar(sql, descricao, preco, estoque)
                mensagem = "Produto cadastrado com sucesso!"
            Else
                sql = "UPDATE produtos SET descricao = ?, preco = ?, estoque = ? WHERE id_produto = ?"
                BancoDeDados.executar(sql, descricao, preco, estoque, id)
                mensagem = "Produto alterado com sucesso!"
            End If

            ' Sucesso
            MsgBox(mensagem)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try

        ' Atualizar a ListView
        Listas.produtos()

        ' Total
        label_total.Text = "Total: " & list_produtos.Items.Count

        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub
End Class