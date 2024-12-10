Public Class Formatar
    ' Atributos
    ' ...nenhum

    ' Método Estático Limpar
    Shared Sub Limpar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Text = ""
            End If
        Next
    End Sub

    ' Método Estático Desativar
    Shared Sub Desativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = False
            End If
        Next
    End Sub

    ' Método Estático Ativar
    Shared Sub Ativar(formulario As Form)
        Dim controle As Control
        For Each controle In formulario.Controls
            If (TypeOf controle Is TextBox Or TypeOf controle Is ComboBox) Then
                controle.Enabled = True
            End If
        Next
    End Sub

    ' Método Estático Validar
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
