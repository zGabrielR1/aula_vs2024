Module Formatar
    ' Limpar
    Public Sub limpar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox) Then
                controle.Text = ""
            End If
        Next
    End Sub

    ' Desativar
    Public Sub desativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = False
            End If
        Next
    End Sub

    ' Ativar
    Public Sub ativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = True
            End If
        Next
    End Sub
End Module
