Public Class Form_Login
    Private Sub btn_entrar_Click(sender As Object, e As EventArgs) Handles btn_entrar.Click
        ' Validação dos Campos
        If (txt_usuario.Text = "" Or txt_senha.Text = "") Then
            MsgBox("Existem campos vázios!" & vbCrLf & "Verifique.") ' vbCrlf quebra linha
        Else
            ' Entrada
            Dim usuario As String = txt_usuario.Text
            Dim senha As String = txt_senha.Text

            ' Definir os usuários do aplicativo
            Dim usuarios As New ArrayList
            usuarios.Add(New With {.nome = "Administrador", .usuario = "admin", .senha = "123"})
            usuarios.Add(New With {.nome = "Teilor Golunski", .usuario = "teilor.g", .senha = "!@#"})
            usuarios.Add(New With {.nome = "Cícero Nicodem", .usuario = "cicero.n", .senha = "botafogo100titulo"})
            usuarios.Add(New With {.nome = "Mônica Prior", .usuario = "monica.p", .senha = "lovecebolinha"})

            ' Login
            Dim autenticou As Boolean = False
            For Each linha In usuarios
                If (usuario = linha.usuario And senha = linha.senha) Then
                    autenticou = True
                    Form_Menu.label_bemvindo.Text = "Bem vindo " & linha.nome
                    Exit For
                End If
            Next

            If (autenticou) Then
                Form_Menu.Show()
                Me.Close()
            Else
                MsgBox("Usuário ou senha incorretos!")
            End If
        End If
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deseja fechar o aplicativo?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Application.Exit()
        End If
    End Sub
End Class