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

        ' SELECT id_usuario, nome FROM usuarios WHERE usuario = '' AND senha = 

        ' Validação dos dados
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        Dim usuario As String = txt_usuario.Text
        Dim senha As String = txt_senha.Text
        Dim conexao As New FbConnection
        Dim dados As FbDataReader
        ' Login
        Try
            ' 1) Conectar
            Dim caminho As String = Application.StartupPath
            Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"

            conexao.ConnectionString = str_conexao
            conexao.Open()


            ' 2) Define o Comando
            Dim sql As String = "SELECT id_usuario, nome FROM usuarios WHERE usuario = ? AND senha = ?"
            Dim comando As New FbCommand
            comando.Parameters.Add(New FbParameter With {.Value = usuario})
            comando.Parameters.Add(New FbParameter With {.Value = senha})
            comando.Connection = conexao
            comando.CommandText = sql

            ' 3) Executa SQL

            dados = comando.ExecuteReader()

            ' Realizar autenticação
            If (dados.Read()) Then
                Variaveis_Publicas.id_usuario = dados("id_usuario")
                Form_Menu.label_bemvindo.Text = "Bem-Vindo " & dados("nome")
                Form_Menu.Show()
                Me.Close()
            Else
                MsgBox("Usuário ou senha incorretos!")
            End If

        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no banco de dados: " & erro.Message)
        Finally
            ' 4) Desconectar
            dados.Close()
            conexao.Close()
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
