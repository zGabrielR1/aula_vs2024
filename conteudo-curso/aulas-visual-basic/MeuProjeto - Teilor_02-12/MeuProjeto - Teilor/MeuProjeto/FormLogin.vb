Imports MeuProjeto.Usuario

Public Class FormLogin
    ' Criando o objeto `usuario` da classe Usuario
    Public usuario As New Usuario

    Private Sub FormLogin_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = False
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen
    End Sub

    Private Sub bn_entrar_Click(sender As Object, e As EventArgs) Handles bn_entrar.Click
        ' Validação dos dados
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        usuario.User = txt_usuario.Text
        usuario.Senha = txt_senha.Text

        ' Autenticar usuário
        If (usuario.FazerLogin()) Then
            Form_Menu.label_bemvindo.Text = "Bem-vindo " & usuario.Nome
            Form_Menu.Show()
            Me.Close()
        Else
            MsgBox("Usuário ou senha incorretos!")
        End If
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deeja fechar a aplicação?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Application.Exit()
        End If
    End Sub
End Class
