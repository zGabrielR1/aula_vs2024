Public Class Cliente
    Inherits Pessoa ' Mesma coisa que `Extends`, ou seja, Cliente é uma subclasse de Pessoa

    ' Atributos
    Private _cpf As String
    Private _nascimento As Date
    Private _sexo As String

    ' Getters e Setters
    Public Property Cpf As String
        Get
            Return _cpf
        End Get
        Set(value As String)
            _cpf = value
        End Set
    End Property

    Public Property Nascimento As Date
        Get
            Return _nascimento
        End Get
        Set(value As Date)
            _nascimento = value
        End Set
    End Property

    Public Property Sexo As String
        Get
            Return _sexo
        End Get
        Set(value As String)
            _sexo = value
        End Set
    End Property

    ' Método Inserir
    Public Sub Inserir()
        Try
            Me.banco.Conectar()
            Dim sql As String = "INSERT INTO clientes (nome, cpf, nascimento, sexo, id_plano) VALUES (?, ?, ?, ?, 1)"
            Me.banco.Executar(sql, Me.Nome, Me.Cpf, Format(Me.Nascimento, "dd-MM-yyyy"), Me.Sexo)
            MsgBox("Cliente cadastrado com sucesso")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub

    ' Método Atualizar
    Public Sub Atualizar()
        Try
            Me.banco.Conectar()
            Dim sql As String = "UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ? WHERE id_cliente = ?"
            Me.banco.Executar(sql, Me.Nome, Me.Cpf, Format(Me.Nascimento, "dd-MM-yyyy"), Me.Sexo, Me.Id)
            MsgBox("Cliente atualizado com sucesso")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub

    ' Método Excluir
    Public Sub Excluir()
        Try
            Me.banco.Conectar()
            Dim sql As String = "DELETE FROM clientes WHERE id_cliente = ?"
            Me.banco.Executar(sql, Me.Id)
            MsgBox("Cliente removido com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub


    ' Método Selecionar por ID (Retonar um VETOR de dados DataRow)
    Public Function SelecionarPorId() As DataRow
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM clientes WHERE id_cliente = ?"
            Dim dados As DataTable = Me.banco.Consultar(sql, Me.Id)
            Return dados(0)     ' Retornando a primeira e única linha da consulta (DataTable)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            Me.banco.Desconectar()
        End Try
    End Function

    ' Método Selecionar Todos
    Public Function SelecionarTodos() As DataTable
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM clientes"
            Return Me.banco.Consultar(sql)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            Me.banco.Desconectar()
        End Try
    End Function
End Class
