' Subclasse `Usúario`, filho da superclasse (classe pai) Pessoa
Public Class Usuario
    Inherits Pessoa ' Mesma coisa que `Extends`, ou seja, Cliente é uma subclasse de Pessoa
    ' Atributos 
    Private _user As String
    Private _senha As String

    ' Get e Set
    Public Property User As String
        Get
            Return _user
        End Get
        Set(value As String)
            _user = value
        End Set
    End Property

    Public Property Senha As String
        Get
            Return _senha
        End Get
        Set(value As String)
            _senha = value
        End Set
    End Property

    ' Método login
    Public Function FazerLogin() As Boolean
        Dim dados As DataTable
        ' Consultar usuário no banco
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?"
            dados = Me.banco.Consultar(sql, Me.User, Me.Senha)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return False    ' Retornado falso, pq deu erro
        Finally
            Me.banco.Desconectar()
        End Try

        ' Verificar resultado
        If (dados.Rows.Count > 0) Then
            Me.Id = dados.Rows(0)("id_usuario")
            Me.Nome = dados.Rows(0)("nome")
            Return True     ' Retornando verdadeiro, pq o login deu certo
        Else
            Return False    ' Retornado falso, pq o login não deu certo
        End If
    End Function
End Class
