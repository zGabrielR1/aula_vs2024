Imports MeuProjeto.BancoDeDados

Public Class Usuario
    ' Atributos
    Private _id As Integer
    Private _nome As String
    Private _user As String
    Private _senha As String
    Private banco As New BancoDeDados

    ' Getters e Setters
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


    ' Método do login
    Public Function FazerLogin() As Boolean
        ' Consultar no banco
        Dim dados As DataTable
        Try
            Me.banco.Conectar()
            Dim sql As String = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?"
            dados = Me.banco.Consultar(sql, Me.User, Me.Senha)
        Catch erro As Exception
            MsgBox("Houve uma excessão no banco de dados: " & erro.Message)
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
