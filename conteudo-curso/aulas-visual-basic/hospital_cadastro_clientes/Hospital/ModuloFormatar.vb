Module ModuloFormatar
    Public Function ValidarCampos(nome As String, cpf As String, nascimento As Date, medico As Object, normal As Boolean, urgente As Boolean) As Boolean
        If String.IsNullOrEmpty(nome) OrElse String.IsNullOrEmpty(cpf) OrElse medico Is Nothing OrElse (Not normal And Not urgente) Then
            MsgBox("Todos os campos são obrigatórios. Verifique e tente novamente.")
            Return False
        End If
        Return True
    End Function

    Public Sub LimparCampos(form As Form)
        For Each control In form.Controls
            If TypeOf control Is TextBox Then
                DirectCast(control, TextBox).Clear()
            ElseIf TypeOf control Is ComboBox Then
                DirectCast(control, ComboBox).SelectedIndex = -1
            ElseIf TypeOf control Is RadioButton Then
                DirectCast(control, RadioButton).Checked = False
            End If
        Next
    End Sub
End Module