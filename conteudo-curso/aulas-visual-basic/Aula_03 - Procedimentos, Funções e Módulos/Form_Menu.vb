Public Class Form_Menu
    Private Sub Form_Menu_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Definir data atual no rodapé
        Dim data_atual As Date = Format(Now(), "dd/MM/yyyy")
        label_data.Text = data_atual

    End Sub

    Private Sub btn_clientes_Click(sender As Object, e As EventArgs) Handles btn_clientes.Click
        Form_Cliente.Show()
    End Sub
End Class