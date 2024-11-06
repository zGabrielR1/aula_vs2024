Public Class Form_Login
    Private Sub Form_Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
        Dim usuario As String = txt_usuario.Text
        Dim senha As String = txt_senha.Text

        BancoDeDados.conectar()
        Dim sql As String = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?"
        Dim dados As DataTable = BancoDeDados.consultar(sql, usuario, senha)

        ' Login
        If (dados.Rows.Count > 0) Then
            Form_Menu.label_bemvindo.Text = "Bem-vindo " & dados.Rows(0)("nome")
            Form_Menu.Show()
            Me.Close()
        Else
            MsgBox("Usuário ou senha inválidos!")
        End If

        BancoDeDados.desconectar()
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deeja fechar a aplicação?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Application.Exit()
        End If
    End Sub
End Class
