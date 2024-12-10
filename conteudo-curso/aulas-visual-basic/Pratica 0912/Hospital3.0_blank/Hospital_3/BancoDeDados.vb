' Importação da Biblioteca do Firebird
Imports FirebirdSql.Data.FirebirdClient

Public Class BancoDeDados
    ' Atributos
    Private conexao As New FbConnection
    Private comando As New FbCommand
    Private caminho As String = Application.StartupPath & "\DB_HOSPITAL.GDB"
    Private transacao As FbTransaction

    ' Método Conectar
    Public Sub Conectar()
        Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & ";DataSource=localhost;Port=3050;"
        me.conexao.ConnectionString = str_conexao
        Me.conexao.Open()
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

    ' Método Desconectar
    Public Sub Desconectar()
        Me.conexao.Close()
    End Sub
End Class
