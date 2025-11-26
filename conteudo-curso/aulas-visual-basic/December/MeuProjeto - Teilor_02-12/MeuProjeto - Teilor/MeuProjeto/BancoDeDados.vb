' Importação da Biblioteca do Firebird
Imports FirebirdSql.Data.FirebirdClient

Public Class BancoDeDados
    ' Atributos
    Private conexao As New FbConnection
    Private comando As New FbCommand
    Private caminho As String = Application.StartupPath & "\DB_SISTEMA.GDB"
    Private transacao As FbTransaction

    ' Método Conectar
    Public Sub Conectar()
        Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & Me.caminho & ";DataSource=localhost;Port=3050;"
        Me.conexao.ConnectionString = str_conexao
        Me.conexao.Open()
    End Sub

    ' Método Iniciar Transação
    Public Sub IniciarTransacao()
        Me.transacao = Me.conexao.BeginTransaction()
        Me.comando.Transaction = Me.transacao
    End Sub

    ' Método Confirmar Transação
    Public Sub ConfirmarTransacao()
        Me.transacao.Commit()
    End Sub

    ' Método Voltar Transação
    Public Sub VoltarTransacao()
        Me.transacao.Rollback()
    End Sub

    ' Método Trancar Tabela (commit libera)
    Public Sub TrancarTabela(tabela As String)
        Me.comando.Connection = Me.conexao
        Me.comando.CommandText = "SELECT * FROM " & tabela & " WITH LOCK"
        Me.comando.ExecuteNonQuery()
    End Sub

    ' Método Executar
    Public Sub Executar(sql As String, ParamArray parametros() As Object)
        Me.comando.Connection = Me.conexao
        Me.comando.CommandText = sql
        Me.comando.Parameters.Clear()
        For Each parametro In parametros
            Me.comando.Parameters.Add(New FbParameter With {.Value = parametro})
        Next
        Me.comando.ExecuteNonQuery()
    End Sub

    ' Método Consultar
    Public Function Consultar(sql As String, ParamArray parametros() As Object) As DataTable
        Me.comando.Connection = Me.conexao
        Me.comando.CommandText = sql
        Me.comando.Parameters.Clear()
        For Each parametro In parametros
            Me.comando.Parameters.Add(New FbParameter With {.Value = parametro})
        Next
        Dim dados As FbDataReader = Me.comando.ExecuteReader()
        Dim tabela As New DataTable
        tabela.Load(dados)
        dados.Close()
        Return tabela
    End Function

    ' Desconectar
    Public Sub Desconectar()
        Me.conexao.Close()
    End Sub
End Class
