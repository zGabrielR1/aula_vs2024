﻿Imports FirebirdSql.Data.FirebirdClient

Module Listas
    ' Lista de clientes
    Public Sub clientes()
        ' Limpar a listagem
        Form_Clientes.list_clientes.Items.Clear()

        ' Banco de Dados
        Dim conexao As New FbConnection
        Dim dados As FbDataReader
        Try
            Dim caminho As String = Application.StartupPath
            Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"

            conexao.ConnectionString = str_conexao
            conexao.Open()

            ' 2 - Definir comando
            Dim comando As New FbCommand
            comando.Connection = conexao
            Dim sql As String = "SELECT clientes.*, planos.descricao FROM clientes INNER JOIN planos ON clientes.id_plano = planos.id_plano"
            comando.CommandText = sql


            ' 3) Executar Comando

            dados = comando.ExecuteReader

            ' Imprimir os dados na ListView
            Dim i As Integer = 0
            While (dados.Read())
                Form_Clientes.list_clientes.Items.Add(dados("id_cliente"))
                Form_Clientes.list_clientes.Items(i).SubItems.Add(dados("nome"))
                Form_Clientes.list_clientes.Items(i).SubItems.Add(dados("cpf"))
                Form_Clientes.list_clientes.Items(i).SubItems.Add(dados("nascimento"))
                Form_Clientes.list_clientes.Items(i).SubItems.Add(dados("sexo"))
                Form_Clientes.list_clientes.Items(i).SubItems.Add(dados("descricao"))
                dados.NextResult()
                i = i + 1
            End While
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' 4) Desconectar
            dados.Close()
            conexao.Close()
        End Try
    End Sub
End Module
