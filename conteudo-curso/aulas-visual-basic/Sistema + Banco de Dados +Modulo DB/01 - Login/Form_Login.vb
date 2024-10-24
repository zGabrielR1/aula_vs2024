Imports FirebirdSql.Data.Client
Imports FirebirdSql.Data.FirebirdClient

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

        ' Login
        Try
            ' 1) Conectar
            BancoDeDados.conectar()

            ' 2) Define o Comando
            Dim sql As String = "SELECT id_usuario, nome FROM usuarios WHERE usuario = ? AND senha = ?"
            Dim retorno As DataTable = BancoDeDados.consultar(sql, usuario, senha)

            ' Realizar autenticação
            If (retorno.Rows.Count > 0) Then
                Variaveis_Publicas.id_usuario = retorno.Rows(0)("id_usuario")
                Form_Menu.label_bemvindo.Text = "Bem-Vindo " & retorno.Rows(0)("nome")
                Form_Menu.Show()
                Me.Close()
            Else
                MsgBox("Usuário ou senha incorretos!")
            End If

        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no banco de dados: " & erro.Message)
        Finally
            ' 4) Desconectar
            BancoDeDados.desconectar()
        End Try
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem certeza que deeja fechar a aplicação?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Application.Exit()
        End If
    End Sub
End Class
