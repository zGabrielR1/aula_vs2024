Imports MeuProjeto.Produto
Public Class FormProdutos
    ' Criando o objeto 'produto' da classe Produto
    Dim produto As New Produto
    Private Sub FormProdutos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
        Formatar.Desativar(Me)
        txt_id.ReadOnly = True

        ' Preencher a ListView
        Listar.Produtos()

        ' Total
        label_total.Text = "Total: " & list_produtos.Items.Count
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar Form
        Formatar.Limpar(Me)
        Formatar.Ativar(Me)
        txt_id.Text = "Novo"
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
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
        Formatar.Ativar(Me)
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
            produto.Id = list_produtos.Items(linha_selecionada).Text

            ' Excluir o produto
            produto.excluir()

            ' Atualizar a ListView
            Listar.Produtos()

            ' Total
            label_total.Text = "Total: " & list_produtos.Items.Count
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação Campos
        If (Not Formatar.ValidouCampos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        produto.Id = IIf(txt_id.Text = "Novo", 0, txt_id.Text)
        produto.Descricao = txt_descricao.Text
        Produto.Preco = txt_preco.Text
        Produto.Estoque = txt_estoque.Text

        ' Verificar se deve inserir ou atualizar o produto
        If (produto.Id = 0) Then
            produto.Inserir()
        Else
            produto.Atualizar()
        End If

        ' Atualizar a ListView
        Listar.Produtos()

        ' Total
        label_total.Text = "Total: " & list_produtos.Items.Count

        ' Limpar e Desativar Form
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub
End Class