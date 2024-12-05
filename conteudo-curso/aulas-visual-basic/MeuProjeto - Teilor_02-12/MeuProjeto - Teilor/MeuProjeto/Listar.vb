Imports MeuProjeto.BancoDeDados
Imports MeuProjeto.Cliente
Imports MeuProjeto.Produto

Public Class Listar
    ' Atributos


    ' Método estático para listar Clientes
    Shared Sub Clientes()
        Dim cliente As New Cliente
        Dim dados As DataTable = cliente.SelecionarTodos()

        FormClientes.list_clientes.Items.Clear()
        For Each row As DataRow In dados.Rows
            Dim listItem As New ListViewItem(row("id_cliente").ToString())
            listItem.SubItems.Add(row("nome"))
            listItem.SubItems.Add(Util.FormatarCPF(row("cpf")))
            listItem.SubItems.Add(Format(row("nascimento"), "dd/MM/yyyy"))
            listItem.SubItems.Add(row("sexo"))
            FormClientes.list_clientes.Items.Add(listItem)
        Next
        FormClientes.list_clientes.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
    End Sub

    ' Método Estático para listar Produtos
    Shared Sub Produtos()
        Dim produto As New Produto
        Dim dados As DataTable = produto.SelecionarTodos
        FormProdutos.list_produtos.Items.Clear()
        For Each row As DataRow In dados.Rows
            Dim listItem As New ListViewItem(row("id_produto").ToString())
            listItem.SubItems.Add(row("descricao"))
            listItem.SubItems.Add(Format(row("preco"), "#,##0.00"))
            listItem.SubItems.Add(row("estoque"))
            FormProdutos.list_produtos.Items.Add(listItem)
        Next
        FormProdutos.list_produtos.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
    End Sub

    ' Método Estático para listar Vendas
    Shared Sub Vendas()
        Dim Banco As New BancoDeDados
        Try
            banco.Conectar()
            Dim sql As String = "SELECT vendas.*, clientes.nome AS cliente, usuarios.nome AS usuario FROM vendas INNER JOIN clientes ON vendas.id_cliente = clientes.id_cliente INNER JOIN usuarios ON vendas.id_usuario = usuarios.id_usuario ORDER BY vendas.id_venda"
            Dim dados As DataTable = Banco.Consultar(sql)
            FormVendas.list_vendas.Items.Clear()
            For Each row As DataRow In dados.Rows
                Dim listItem As New ListViewItem(row("id_venda").ToString())
                listItem.SubItems.Add(row("data"))
                listItem.SubItems.Add(Format(row("valor_total"), "#,##0.00"))
                listItem.SubItems.Add(row("cliente"))
                listItem.SubItems.Add(row("usuario"))
                listItem.SubItems.Add(row("cancelado"))
                FormVendas.list_vendas.Items.Add(listItem)
            Next
            FormVendas.list_vendas.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent) ' Ajustar Largura das Colunas
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Banco.Desconectar()
        End Try
    End Sub
End Class
