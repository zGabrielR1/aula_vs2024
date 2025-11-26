Imports FirebirdSql.Data.FirebirdClient
Module BancoDeDados
    ' Váriaveis
    Private conexao As New FbConnection
    Private comando As New FbCommand

    ' Conectar
    Public Sub conectar()
        Dim caminho As String = Application.StartupPath
        Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_SISTEMA.gdb;DataSource=localhost;"
        conexao.ConnectionString = str_conexao
        conexao.Open()
    End Sub

    ' Executar insert, update, delete
    Public Sub executar(sql As String, ParamArray parametros() As Object)
        comando.Connection = conexao
        comando.CommandText = sql

        ' Limpar os parametros do Firebird
        comando.Parameters.Clear()

        ' Adicionando os parametros fornecidos
        For Each posicao In parametros
            comando.Parameters.Add(New FbParameter With {.Value = posicao})
        Next

        comando.ExecuteNonQuery()
    End Sub

    ' Consultar select
    Public Function consultar(sql As String, ParamArray parametros() As Object) As DataTable
        comando.Connection = conexao
        comando.CommandText = sql

        ' Limpar os parametros do Firebird
        comando.Parameters.Clear()

        ' Adicionando os parametros fornecidos
        For Each posicao In parametros
            comando.Parameters.Add(New FbParameter With {.Value = posicao})
        Next

        ' Executa a consulta e obtém os dados
        Dim dados As FbDataReader = comando.ExecuteReader()

        ' Criar um DataTable para armazenar os resultados
        Dim tabela As New DataTable
        tabela.Load(dados)

        ' Fechar o DataReader
        dados.Close()

        ' Retorna os dados como DataTable
        Return tabela
    End Function

    ' Desconectar
    Public Sub desconectar()
        conexao.Close()
    End Sub
End Module
