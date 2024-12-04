Public Class Form_Login
    Private Sub btn_entrar_Click(sender As Object, e As EventArgs) Handles btn_entrar.Click
        ' Validação dos dados
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If
        Try
            ' Entrada dos dados
            Dim usuario As String = txt_usuario.Text
            Dim senha As String = txt_senha.Text

            BancoDeDados.conectar()
            Dim sql As String = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?"
            Dim dados As DataTable = BancoDeDados.consultar(sql, usuario, senha)

            ' Login
            If (dados.Rows.Count > 0) Then
                Form_Principal.Show()
                Me.Hide()
            Else
                MsgBox("Usuário ou senha inválidos!")
            End If
        Catch erro As Exception
            MsgBox("Ocorreu um erro no banco de dados" & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try

    End Sub
End Class
