' Superclasse (classe pai) das classes Usuário e Cliente
Public Class Pessoa
    ' Atributos
    Private _id As Integer
    Private _nome As String
    Protected banco As New BancoDeDados

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Nome As String
        Get
            Return _nome
        End Get
        Set(value As String)
            _nome = value
        End Set
    End Property
End Class
