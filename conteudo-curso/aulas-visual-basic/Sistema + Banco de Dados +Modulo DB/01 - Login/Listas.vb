Imports FirebirdSql.Data.FirebirdClient

Module Listas
    ' Lista de Clientes
    Public Sub clientes()
        ' Limpar a listagem
        Form_Clientes.list_clientes.Items.Clear()

        ' Banco de Dados

        Try
            ' Conectar
            BancoDeDados.conectar()
            ' Definir 
            Dim sql As String = "SELECT clientes.*, planos.descricao FROM clientes INNER JOIN planos ON clientes.id_plano = planos.id_plano"
            Dim retorno As DataTable = BancoDeDados.consultar(sql)

            ' Imprimir os dados na ListView
            For Each linha In retorno.Rows
                Dim item As New ListViewItem(linha("id_cliente").ToString)
                item.SubItems.Add(linha("nome")).ToString()
                item.SubItems.Add(linha("cpf")).ToString()
                item.SubItems.Add(Format(linha("nascimento"), "dd/MM/yyyy").ToString)
                item.SubItems.Add(linha("sexo")).ToString()
                item.SubItems.Add(linha("descricao")).ToString()

                ' Adicionar o item recém criado na Listiew
                Form_Clientes.list_clientes.Items.Add(item)
            Next

            ' Atualizar a label do total
            Form_Clientes.label_total.Text = "Total: " & Form_Clientes.list_clientes.Items.Count
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' Desconectar
            BancoDeDados.desconectar()
        End Try
    End Sub
End Module
