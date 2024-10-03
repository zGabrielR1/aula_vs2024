Imports System.Windows.Forms

Public Class Form1
    Private Sub txt_usuario_TextChanged(sender As Object, e As EventArgs) Handles txt_usuario.TextChanged
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
    End Sub

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
            usuarios.Add(New With {.nome = "Teilor Golunski", .usuario = "teilor.g", .senha = "123!@#"})
            usuarios.Add(New With {.nome = "Mônica Prior", .usuario = "monica.p", .senha = "hjnaotemaula"})
            usuarios.Add(New With {.nome = "Cícero Nicodem", .usuario = "cicero.n", .senha = "botafogo100titulo"})


            ' Login
            Dim autenticou As Boolean = False
            For Each linha In usuarios
                If (usuario = linha.usuario And senha = linha.senha) Then
                    autenticou = True
                    Exit For
                End If
            Next

            If (autenticou) Then
                Form2.Show()
                Me.Hide()
            Else
                MsgBox("Usuário ou senha incorretos!")
            End If
        End If
    End Sub

    Private Sub txt_usuario_KeyDown(sender As Object, e As KeyEventArgs) Handles txt_usuario.KeyDown
        If e.KeyCode = Keys.Enter Then
            btn_entrar_Click(sender, e)
        End If
    End Sub

    Private Sub txt_senha_KeyDown(sender As Object, e As KeyEventArgs) Handles txt_senha.KeyDown
        If e.KeyCode = Keys.Enter Then
            btn_entrar_Click(sender, e)
        End If
    End Sub
End Class