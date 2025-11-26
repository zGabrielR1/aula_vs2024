' Importação da Biblioteca do Firebird
Imports FirebirdSql.Data.FirebirdClient

Module BancoDeDados
    ' Variáveis
    Private conexao As New FbConnection
    Private comando As New FbCommand
    Private caminho As String = Application.StartupPath & "\DB_SISTEMA.GDB"
    Private transacao As FbTransaction

    ' Conectar
    Public Sub conectar()
        Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & ";DataSource=localhost;Port=3050;"
        conexao.ConnectionString = str_conexao
        conexao.Open()
    End Sub

    ' Iniciar Transação
    Public Sub iniciar_transação()
        transacao = conexao.BeginTransaction
        comando.Transaction = transacao
    End Sub
    ' Salvar Transação
    Public Sub confirmar_transacao()
        transacao.Commit()
    End Sub
    ' Voltar Transação
    Public Sub voltar_transacao()
        transacao.Rollback()
    End Sub
    ' Travar tabela
    Public Sub travar_tabela(tabela As String)
        comando.Connection = conexao
        comando.CommandText = "SELECT * FROM " & tabela & " WITH LOCK"
        comando.ExecuteNonQuery()
    End Sub
    ' Executar
    Public Sub executar(sql As String, ParamArray parametros() As Object)
        comando.Connection = conexao
        comando.CommandText = sql
        comando.Parameters.Clear()
        For Each parametro In parametros
            comando.Parameters.Add(New FbParameter With {.Value = parametro})
        Next
        comando.ExecuteNonQuery()
    End Sub

    ' Consultar
    Public Function consultar(sql As String, ParamArray parametros() As Object) As DataTable
        comando.Connection = conexao
        comando.CommandText = sql
        comando.Parameters.Clear()
        For Each parametro In parametros
            comando.Parameters.Add(New FbParameter With {.Value = parametro})
        Next
        Dim dados As FbDataReader = comando.ExecuteReader()
        Dim tabela As New DataTable
        tabela.Load(dados)
        dados.Close()
        Return tabela
    End Function

    ' Desconectar
    Public Sub desconectar()
        conexao.Close()
    End Sub
End Module
