Imports System.Drawing.Text
Imports Atividade3A.Listar
Public Class FormCadastro
    Private listar As New Listar
    Private Sub FormCadastro_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Limpar e desativar
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
        group_disponivel.Enabled = False

        ' Carregar listagem
        listar.Livros()

        ' Total
        label_total.Text = "Total: " & list_livros.Items.Count
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e ativar
        Formatar.Limpar(Me)
        Formatar.Ativar(Me)
        group_disponivel.Enabled = True
        txt_id.Text = "Novo"
    End Sub

    Private Sub btn_alterar_Click(sender As Object, e As EventArgs) Handles btn_alterar.Click
        ' Validação
        If (list_livros.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um livro!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = list_livros.SelectedIndices(0)

        ' Pegar dados
        txt_id.Text = list_livros.Items(linha_selecionada).SubItems(0).Text
        txt_titulo.Text = list_livros.Items(linha_selecionada).SubItems(1).Text
        txt_ano.Text = list_livros.Items(linha_selecionada).SubItems(2).Text
        txt_autor.Text = list_livros.Items(linha_selecionada).SubItems(3).Text

        ' Selecionar radio
        If (list_livros.Items(linha_selecionada).SubItems(4).Text = "Sim") Then
            rbt_sim.Checked = True
        Else
            rbt_nao.Checked = True
        End If

        ' Ativar Form
        Formatar.Ativar(Me)
        group_disponivel.Enabled = True
    End Sub

    Private Sub btn_remover_Click(sender As Object, e As EventArgs) Handles btn_remover.Click
        ' Validação
        If (list_livros.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um livro!")
            Exit Sub
        End If

        ' Confirmação
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja remover este livro?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Dim linha_selecionada As Integer = list_livros.SelectedIndices(0)
            Livro.Id = list_livros.Items(linha_selecionada).Text

            ' Excluir
            Livro.Excluir()

            ' Atualizar listagem
            Listar.Livros()

            ' Total
            label_total.Text = "Total: " & list_livros.Items.Count
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Existem campos vázios. Verifique!")
            Exit Sub
        End If

        ' Entrada dos dados
        Livro.Id = IIf(txt_id.Text = "Novo", 0, txt_id.Text)
        Livro.Titulo = txt_titulo.Text
        Livro.Ano = txt_ano.Text
        Livro.Autor = txt_autor.Text
        Livro.Disponivel = IIf(rbt_sim.Checked, "Sim", "Não")

        ' Verificar se deve inserir ou atualizar
        If (Livro.Id = 0) Then
            Livro.Inserir()
        Else
            Livro.Atualizar()
        End If

        ' Atualizar listagem
        Listar.Livros()

        ' Total
        label_total.Text = "Total: " & list_livros.Items.Count

        ' Limpar e desativar Form
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
        group_disponivel.Enabled = False
    End Sub
End Class
