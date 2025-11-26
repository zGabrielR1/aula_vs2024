Public Class Form_Menu
    Private Sub Form_Menu_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = True
        Me.MaximizeBox = False
        Me.WindowState = FormWindowState.Normal         ' Mantenha o estado normal para poder ajustar o tamanho
        Me.Bounds = Screen.PrimaryScreen.WorkingArea    ' Ajusta o tamanho para a área de trabalho, sem a barra de tarefas

        ' Definir Data Barra de Status
        Dim data_atual As Date = Format(Now, "dd-MM-yyyy")
        label_data.Text = "Data: " & data_atual
    End Sub

    Private Sub item_sair_Click(sender As Object, e As EventArgs) Handles item_sair.Click
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja fechar a aplicação?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Application.Exit()
        End If
    End Sub

    Private Sub item_clientes_Click(sender As Object, e As EventArgs) Handles item_clientes.Click
        Form_Clientes.Show()
    End Sub

    Private Sub item_produtos_Click(sender As Object, e As EventArgs) Handles item_produtos.Click
        Form_Produtos.Show()

    End Sub
End Class