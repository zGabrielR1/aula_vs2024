Imports FirebirdSql.Data.FirebirdClient

Module BancoDeDados
    ' Propriedades/variáveis do módulo
    Private conexao As New FbConnection
    Private comando As New FbCommand
    Private caminho As String = Application.StartupPath

    ' Conectar
    Public Sub conectar()
        Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"
        conexao.ConnectionString = str_conexao
        conexao.Open()
    End Sub


    ' Executar comandos
    Public Sub executar(sql As String, ParamArray parametros() As Object)
        comando.Connection = conexao
        comando.CommandText = sql
        ' Adicionando os parâmetros fornecidos
        For Each posicao In parametros
            comando.Parameters.Add(New FbParameter With {.Value = posicao()})
        Next

        comando.ExecuteNonQuery()
    End Sub
    ' Consultar
    ' Desconectar
End Module
