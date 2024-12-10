Imports Atividade3A.Livro
Public Class Listar
    Protected banco As New BancoDeDados
    Protected livro As New Livro
    Public Sub Livros()
        Try
            Dim dados As DataTable = livro.SelecionarTodos()
            FormCadastro.list_livros.Items.Clear()
            For Each row As DataRow In dados.Rows
                Dim listItem As New ListViewItem(row("id_livro").ToString())
                listItem.SubItems.Add(row("titulo"))
                listItem.SubItems.Add(row("ano"))
                listItem.SubItems.Add(row("autor"))
                listItem.SubItems.Add(row("disponivel"))
                FormCadastro.list_livros.Items.Add(listItem)
            Next
            FormCadastro.list_livros.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub
End Class
