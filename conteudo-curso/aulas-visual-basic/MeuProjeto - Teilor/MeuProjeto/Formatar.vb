Public Class Formatar
    ' Método Limpar
    Shared Sub Limpar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Text = ""
            End If
        Next
    End Sub

    ' Método Desativar
    Shared Sub Desativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = False
            End If
        Next
    End Sub

    ' Método Ativar
    Shared Sub Ativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = True
            End If
        Next
    End Sub

    ' Método Validar
    Shared Function ValidouCampos(formulario As Form) As Boolean
        Dim controle As Control
        For Each controle In formulario.Controls
            If (controle.Tag = "obrigatório" And controle.Text = "") Then
                Return False
            End If
        Next
        Return True
    End Function
End Class
