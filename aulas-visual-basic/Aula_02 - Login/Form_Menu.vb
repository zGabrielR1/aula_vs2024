﻿Public Class Form_Menu
    Private Sub ToolStripStatusLabel1_Click(sender As Object, e As EventArgs) Handles label_data.Click

    End Sub

    Private Sub Form_Menu_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Definir data atual no rodapé
        Dim data_atual As Date = Format(Now(), "dd/MM/yyyy")
        label_data.Text = data_atual
    End Sub
End Class