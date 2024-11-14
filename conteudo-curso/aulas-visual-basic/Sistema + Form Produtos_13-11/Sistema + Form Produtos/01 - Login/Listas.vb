Module Listas
    ' CLientes
    Public Sub clientes()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT * FROM clientes ORDER BY id_cliente"
            Dim dados As DataTable = BancoDeDados.consultar(sql)
            Form_Clientes.list_clientes.Items.Clear()
            For Each row As DataRow In dados.Rows
                Dim listItem As New ListViewItem(row("id_cliente").ToString())
                listItem.SubItems.Add(row("nome"))
                listItem.SubItems.Add(Util.Formatar_CPF(row("cpf")))
                listItem.SubItems.Add(Format(row("nascimento"), "dd/MM/yyyy"))
                listItem.SubItems.Add(row("sexo"))
                Form_Clientes.list_clientes.Items.Add(listItem)
            Next
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub

    ' Produtos
    Public Sub produtos()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT * FROM produtos ORDER BY id_produto"
            Dim dados As DataTable = BancoDeDados.consultar(sql)
            Form_Produtos.list_produtos.Items.Clear()
            For Each row As DataRow In dados.Rows
                Dim listItem As New ListViewItem(row("id_produto").ToString())
                listItem.SubItems.Add(row("descricao"))
                listItem.SubItems.Add(row("preco"))
                listItem.SubItems.Add(row("estoque"))
                Form_Produtos.list_produtos.Items.Add(listItem)
            Next
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub
End Module
