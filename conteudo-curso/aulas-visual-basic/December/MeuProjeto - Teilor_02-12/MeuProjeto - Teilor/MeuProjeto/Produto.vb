Imports MeuProjeto.BancoDeDados

Public Class Produto
    ' Atributos
    Private _id As Integer
    Private _descricao As String
    Private _preco As Double
    Private _estoque As Integer
    Private banco As New BancoDeDados

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Descricao As String
        Get
            Return _descricao
        End Get
        Set(value As String)
            _descricao = value
        End Set
    End Property

    Public Property Preco As Double
        Get
            Return _preco
        End Get
        Set(value As Double)
            _preco = value
        End Set
    End Property

    Public Property Estoque As Integer
        Get
            Return _estoque
        End Get
        Set(value As Integer)
            _estoque = value
        End Set
    End Property

    ' Método Inserir
    Public Sub Inserir()
        Try
            Me.banco.Conectar()
            Dim sql As String = "INSERT INTO 


s (descricao, preco, estoque) VALUES (?, ?, ?)"
            Me.banco.Executar(sql, Me.Descricao, Me.Preco, Me.Estoque)
            MsgBox("Produto cadastrado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try '
    End Sub

    ' Método Atualizar
    Public Sub Atualizar()
        Try
            Me.banco.Conectar()
            Dim sql As String = "UPDATE produtos SET descricao = ?, preco = ?, estoque = ? WHERE id_produto = ?"
            Me.banco.Executar(sql, Me.Descricao, Me.Preco, Me.Estoque, Me.Id)
            MsgBox("Produto alterado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub

    ' Excluir
    Public Sub excluir()
        Try
            Me.banco.Conectar()
            Dim sql As String = "DELETE FROM produtos WHERE id_produto = ?"
            Me.banco.Executar(sql, Me.Id)
            MsgBox("Produto removido com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub


    ' Selecionar por ID (Retonar um VETOR de dados DataRow)
    Public Function SelecionarPorId() As DataRow
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = Me.banco.Consultar(sql, Me.Id)
            Return dados(0)     ' Retornando a primeira e única linha da consulta (DataTable)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            Me.banco.Desconectar()
        End Try
    End Function

    ' Selecionar Todos
    Public Function SelecionarTodos() As DataTable
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM produtos"
            Return Me.banco.Consultar(sql)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            Me.banco.Desconectar()
        End Try
    End Function
End Class
