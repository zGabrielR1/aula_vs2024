Imports System.Net.Mime.MediaTypeNames

Public Class Form1
    Private Sub ListView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list_livros.SelectedIndexChanged

    End Sub

    Private Sub lbl_titulo_Click(sender As Object, e As EventArgs) Handles lbl_titulo.Click

    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Marcar o Não por padrão
        rbt_nao.Checked = True
    End Sub

    ' Variável para controlar os itens (linha) do ListView
    Dim i As Integer = 0

    Private Sub btn_cadastrar_Click(sender As Object, e As EventArgs) Handles btn_cadastrar.Click
        'Validação de todos os campos TextBox
        If Not ValidateInputs() Then
            Exit Sub 'Sai da sub-rotina se a validação falhar
        End If

        ' Entrada dos dados APÓS a validação
        Dim titulo As String = txt_title.Text
        Dim ano As Short

        ' It's good practice to validate and convert the input (already done in ValidateInputs)
        If Not Short.TryParse(txt_Year.Text, ano) Then
            'This should not happen as validation is already done. Included for safety.
            MessageBox.Show("Por favor, insira um ano válido.")
            Exit Sub
        End If

        Dim autor As String = txt_author.Text
        Dim disp As Boolean = rbt_sim.Checked

        ' Cria um novo ListViewItem com o título
        Dim item As New ListViewItem(titulo)

        ' Adiciona subitens para Ano e Autor
        item.SubItems.Add(ano)
        item.SubItems.Add(autor)
        item.SubItems.Add(disp)

        ' Adiciona o item ao ListView
        list_livros.Items.Add(item)
        i = i + 1

    End Sub

    'Função para validar as entradas
    Private Function ValidateInputs() As Boolean
        'Verifica se o título está vazio
        If String.IsNullOrWhiteSpace(txt_title.Text) Then
            MessageBox.Show("Por favor informe o nome do livro.", "Erro de validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txt_title.Focus()
            Return False
        End If

        'Verifica se o ano está vazio ou não é um número
        If String.IsNullOrWhiteSpace(txt_Year.Text) Then
            MessageBox.Show("Por favor, insira o ano.", "Erro de validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txt_Year.Focus()
            Return False
        End If

        Dim ano As Short
        If Not Short.TryParse(txt_Year.Text, ano) Then
            MessageBox.Show("Por favor, insira um número válido para o ano.", "Valor Inválido", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txt_Year.Focus()
            txt_Year.SelectAll()
            Return False
        End If

        'Verifica se o autor está vazio
        If String.IsNullOrWhiteSpace(txt_author.Text) Then
            MessageBox.Show("Por favor informe o nome do autor.", "Erro de validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txt_author.Focus()
            Return False
        End If

        'Se todos os testes passarem, retorna True
        Return True
    End Function
End Class