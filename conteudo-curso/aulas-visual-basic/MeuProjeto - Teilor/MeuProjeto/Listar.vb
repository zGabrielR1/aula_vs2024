Module Listar
    ' CLientes
    Public Sub clientes()
        Dim dados As DataTable = Cliente.selecionar_todos()
        Form_Clientes.list_clientes.Items.Clear()
        For Each row As DataRow In dados.Rows
            Dim listItem As New ListViewItem(row("id_cliente").ToString())
            listItem.SubItems.Add(row("nome"))
            listItem.SubItems.Add(Util.Formatar_CPF(row("cpf")))
            listItem.SubItems.Add(Format(row("nascimento"), "dd/MM/yyyy"))
            listItem.SubItems.Add(row("sexo"))
            Form_Clientes.list_clientes.Items.Add(listItem)
        Next
        Form_Clientes.list_clientes.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
    End Sub

    ' Produtos
    Public Sub produtos()
        Dim dados As DataTable = Produto.selecionar_todos()
        Form_Produtos.list_produtos.Items.Clear()
        For Each row As DataRow In dados.Rows
            Dim listItem As New ListViewItem(row("id_produto").ToString())
            listItem.SubItems.Add(row("descricao"))
            listItem.SubItems.Add(Format(row("preco"), "#,##0.00"))
            listItem.SubItems.Add(row("estoque"))
            Form_Produtos.list_produtos.Items.Add(listItem)
        Next
        Form_Produtos.list_produtos.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
    End Sub

    ' Vendas
    Public Sub vendas()
        Try
            BancoDeDados.conectar()
            Dim sql As String = "SELECT vendas.*, clientes.nome AS cliente, usuarios.nome AS usuario FROM vendas INNER JOIN clientes ON vendas.id_cliente = clientes.id_cliente INNER JOIN usuarios ON vendas.id_usuario = usuarios.id_usuario ORDER BY vendas.id_venda"
            Dim dados As DataTable = BancoDeDados.consultar(sql)
            Form_Vendas.list_vendas.Items.Clear()
            For Each row As DataRow In dados.Rows
                Dim listItem As New ListViewItem(row("id_venda").ToString())
                listItem.SubItems.Add(row("data"))
                listItem.SubItems.Add(Format(row("valor_total"), "#,##0.00"))
                listItem.SubItems.Add(row("cliente"))
                listItem.SubItems.Add(row("usuario"))
                listItem.SubItems.Add(row("cancelado"))
                Form_Vendas.list_vendas.Items.Add(listItem)
            Next
            Form_Vendas.list_vendas.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub
End Module
