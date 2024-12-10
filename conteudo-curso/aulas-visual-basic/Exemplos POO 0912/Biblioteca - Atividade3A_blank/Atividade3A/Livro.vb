Public Class Livro
    ' Método Variáveis
    Private _id As Integer
    Private _titulo As String
    Private _ano As Integer
    Private _autor As String
    Private _disponivel As String
    Protected banco As New BancoDeDados

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Titulo As String
        Get
            Return _titulo
        End Get
        Set(value As String)
            _titulo = value
        End Set
    End Property

    Public Property Ano As Integer
        Get
            Return _ano
        End Get
        Set(value As Integer)
            _ano = value
        End Set
    End Property

    Public Property Autor As String
        Get
            Return _autor
        End Get
        Set(value As String)
            _autor = value
        End Set
    End Property

    Public Property Disponivel As String
        Get
            Return _disponivel
        End Get
        Set(value As String)
            _disponivel = value
        End Set
    End Property
    ' Método Inserir
    Public Sub Inserir()
        Try
            Me.banco.Conectar()
            Dim sql As String = "INSERT INTO livros (titulo, ano, autor, disponivel) VALUES (?, ?, ?, ?)"
            Me.banco.Executar(sql, Titulo, Ano, Autor, Disponivel)
            MsgBox("Livro cadastrado com sucesso!")
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
            Dim sql As String = "UPDATE livros SET titulo = ?, ano = ?, autor = ?, disponivel = ? WHERE id_livro = ?"
            Me.banco.Executar(sql, Titulo, Ano, Autor, Disponivel, Id)
            MsgBox("Livro alterado com sucesso!")
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
            Dim sql As String = "DELETE FROM livros WHERE id_livro = ?"
            Me.banco.Executar(sql, Id)
            MsgBox("Livro removido com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try
    End Sub

    ' Método Selecionar por ID
    Public Function SelecionarPorId() As DataRow
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM livros WHERE id_livro = ?"
            Dim dados As DataTable = Me.banco.Consultar(sql, Id)
            Return dados.Rows(0)
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
            Dim sql As String = "SELECT * FROM livros"
            Return Me.banco.Consultar(sql)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            Me.banco.Desconectar()
        End Try
    End Function
End Class
