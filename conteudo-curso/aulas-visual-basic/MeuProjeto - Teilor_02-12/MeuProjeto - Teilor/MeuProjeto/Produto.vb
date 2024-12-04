Module Produto
    ' Variáveis
    Public id As Object
    Public descricao As String
    Public preco As Double
    Public estoque As Integer

    ' Inserir
    Public Sub inserir()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "INSERT INTO produtos (descricao, preco, estoque) VALUES (?, ?, ?)"
            BancoDeDados.executar(sql, descricao, preco, estoque)
            MsgBox("Produto cadastrado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try '
    End Sub

    ' Atualizar
    Public Sub atualizar()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "UPDATE produtos SET descricao = ?, preco = ?, estoque = ? WHERE id_produto = ?"
            BancoDeDados.executar(sql, descricao, preco, estoque, id)
            MsgBox("Produto alterado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub

    ' Excluir
    Public Sub excluir()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "DELETE FROM produtos WHERE id_produto = ?"
            BancoDeDados.executar(sql, id)
            MsgBox("Produto removido com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub


    ' Selecionar por ID (Retonar um VETOR de dados DataRow)
    Public Function selecionar_por_id() As DataRow
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT * FROM produtos WHERE id_produto = ?"
            Dim dados As DataTable = BancoDeDados.consultar(sql, id)
            Return dados(0)     ' Retornando a primeira e única linha da consulta (DataTable)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            BancoDeDados.desconectar()
        End Try
    End Function

    ' Selecionar Todos
    Public Function selecionar_todos() As DataTable
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT * FROM produtos"
            Return BancoDeDados.consultar(sql)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Return Nothing
        Finally
            BancoDeDados.desconectar()
        End Try
    End Function
End Module
