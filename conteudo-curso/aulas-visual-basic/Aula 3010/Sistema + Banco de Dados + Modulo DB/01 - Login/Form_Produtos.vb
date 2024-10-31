Imports System.Data.SqlTypes

Public Class Form_Produtos
    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles lbl_id_produto.Click

    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles txt_id.TextChanged

    End Sub

    Private Sub Form_Produtos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen

        ' ListView Configurações
        lv_produtos.View = View.Details
        lv_produtos.GridLines = True
        lv_produtos.FullRowSelect = True
        lv_produtos.MultiSelect = False
        lv_produtos.Columns.Add("ID")
        lv_produtos.Columns.Add("Descrição")
        lv_produtos.Columns.Add("Preço")
        lv_produtos.Columns.Add("Estoque")

        ' Atualizar a lista de produtos
        Listas.produtos()

        txt_id.Enabled = False

    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub

    Private Sub lv_produtos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lv_produtos.SelectedIndexChanged

    End Sub

    Private Sub btn_novo_produto_Click(sender As Object, e As EventArgs) Handles btn_novo_produto.Click
        ' Limpar e formatar
        Formatar.limpar(Me)
        Formatar.ativar(Me)
        txt_id.ReadOnly = True
        txt_id.Text = "Novo"

    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.limpar(Me)
    End Sub

    Private Sub btn_alterar_pdt_Click(sender As Object, e As EventArgs) Handles btn_alterar_pdt.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (lv_produtos.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = lv_produtos.SelectedIndices(0)

        ' Passar os dados da linha selecionada do ListView para o formulário
        txt_id.Text = lv_produtos.Items(linha_selecionada).SubItems(0).Text
        txt_descricao.Text = lv_produtos.Items(linha_selecionada).SubItems(1).Text
        txt_preco.Text = lv_produtos.Items(linha_selecionada).SubItems(2).Text
        txt_qdt_estoque.Text = lv_produtos.Items(linha_selecionada).SubItems(3).Text

    End Sub

    Private Sub btn_excluir_pdt_Click(sender As Object, e As EventArgs) Handles btn_excluir_pdt.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (lv_produtos.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um produto!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = lv_produtos.SelectedIndices(0)
        ' Confirmar se o usuário realmente deseja excluir o cliente
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja remover este produto?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o ID do Cliente
            Dim id_produto As Integer = lv_produtos.Items(linha_selecionada).Text

            Try
                BancoDeDados.conectar()

                Dim sql As String = "DELETE FROM produtos WHERE id_produto = ?"

                BancoDeDados.executar(sql, id_produto)

                MsgBox("Produto excluido com sucesso")
            Catch erro As Exception
                MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)

            Finally
                BancoDeDados.desconectar()
            End Try

            Listas.produtos()
        End If
    End Sub

    Private Sub btn_salvar_pdt_Click(sender As Object, e As EventArgs) Handles btn_salvar_pdt.Click
        ' Validação Campos
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If
        ' Entrada dos dados
        Dim id As String = txt_id.Text
        Dim descricao As String = txt_descricao.Text
        Dim preco As Double = txt_preco.Text
        Dim estoque As Integer = txt_qdt_estoque.Text

        Try
            BancoDeDados.conectar()
            Dim sql As String
            Dim msg As String
            If (id = "Novo") Then
                sql = "INSERT INTO produtos (descricao, preco, estoque) VALUES (?,?,?)"
                BancoDeDados.executar(sql, descricao, preco, estoque)
                msg = "Produto cadastrado com sucesso!"
            Else
                sql = "UPDATE produtos SET descricao = ?, preco = ?, estoque = ? WHERE id_produto = ?"
                BancoDeDados.executar(sql, descricao, preco, estoque)
                msg = "Produto alterado com sucesso!"
            End If

            MsgBox(msg)
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try


        Listas.produtos()

        ' Limpar e Desativar Form
        Formatar.limpar(Me)
    End Sub
End Class