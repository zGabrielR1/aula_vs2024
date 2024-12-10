Imports Hospital_3.Usuario
Public Class FormLogin
    ' Criando o objeto `usuario` da classe Usuario
    Public usuario As New Usuario
    Private Sub btn_entrar_Click(sender As Object, e As EventArgs) Handles btn_entrar.Click
        ' Validação dos dados
        If (Not Formatar.ValidouCampos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        usuario.User = txt_usuario.Text
        usuario.Senha = txt_senha.Text

        ' Autenticar usuário chamando classe Usuario e seus atributos
        If (usuario.FazerLogin()) Then
            FormPrincipal.Show()
            Me.Close()
        Else
            MsgBox("Usuário ou senha incorretos!")
        End If
    End Sub

    Private Sub FormLoginLoad(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class
