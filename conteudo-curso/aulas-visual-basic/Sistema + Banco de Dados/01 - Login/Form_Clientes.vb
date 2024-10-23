Imports FirebirdSql.Data.FirebirdClient

Public Class Form_Clientes
    ' Váriaveis para controlar as linhas da ListView e o id dos clientes
    Dim i As Integer = 0
    Dim gerador_id As Integer = 1

    Private Sub Form_Clientes_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = False
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen

        ' Marcar um Radio padrão
        rbt_feminino.Checked = True

        ' Preencher ComboBox
        Dim conexao As New FbConnection
        Dim dados As FbDataReader
        Try
            ' 1) Conectar
            Dim caminho As String = Application.StartupPath
            Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"
            conexao.ConnectionString = str_conexao
            conexao.Open()

            ' 2) Definir 
            Dim comando As New FbCommand
            Dim sql As String = "SELECT * FROM planos"
            comando.Connection = conexao
            comando.CommandText = sql

            ' 3) Executar Comando
            dados = comando.ExecuteReader()

            ' Imprimir os dados no ComboBox
            While (dados.Read())
                cbx_plano.Items.Add(New With {.Text = dados("descricao"), .Value = dados("id_plano")})
                dados.NextResult()
            End While
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' 4) Desconectar
            dados.Close()
            conexao.Close()
        End Try

        ' Configurar ComboBox
        cbx_plano.DisplayMember = "Text"
        cbx_plano.ValueMember = "Value"
        cbx_plano.DropDownStyle = ComboBoxStyle.DropDownList

        ' Confirgurando a ListView
        list_clientes.View = View.Details
        list_clientes.GridLines = True
        list_clientes.FullRowSelect = True
        list_clientes.MultiSelect = False
        list_clientes.Columns.Add("ID")
        list_clientes.Columns.Add("Nome")
        list_clientes.Columns.Add("CPF")
        list_clientes.Columns.Add("Nascimento")
        list_clientes.Columns.Add("Sexo")
        list_clientes.Columns.Add("Plano")

        ' Atualizar a ListView
        Listas.clientes()

        ' Desativar Form
        Formatar.desativar(Me)
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar Form
        Formatar.limpar(Me)
        Formatar.ativar(Me)
        txt_id.ReadOnly = True
        txt_id.Text = "Novo"
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1
    End Sub

    Private Sub btn_alterar_Click(sender As Object, e As EventArgs) Handles btn_alterar.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (list_clientes.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um cliente!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = list_clientes.SelectedIndices(0)

        ' Passar os dados da linha selecionada do ListView para o formulário
        txt_id.Text = list_clientes.Items(linha_selecionada).SubItems(0).Text
        txt_nome.Text = list_clientes.Items(linha_selecionada).SubItems(1).Text
        txt_CPF.Text = list_clientes.Items(linha_selecionada).SubItems(2).Text
        date_nascimento.Value = list_clientes.Items(linha_selecionada).SubItems(3).Text

        ' Identificar o sexo e selecionar o radio correspondente
        If (list_clientes.Items(linha_selecionada).SubItems(4).Text = "f") Then
            rbt_feminino.Checked = True
        Else
            rbt_masculino.Checked = True
        End If

        ' Interagir com o combobox dos planos até encontrar o texto igual ao texto selecionado na listview
        Dim i As Integer = 0
        While (i < 3)
            If (cbx_plano.Items(i).Text = list_clientes.Items(linha_selecionada).SubItems(5).Text) Then
                cbx_plano.SelectedIndex = i
                Exit While
            End If
            i = i + 1
        End While

        ' Ativar Form
        Formatar.ativar(Me)
    End Sub

    Private Sub btn_excluir_Click(sender As Object, e As EventArgs) Handles btn_excluir.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (list_clientes.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um cliente!")
            Exit Sub
        End If

        ' Pegar o indice da linha selecionada
        Dim linha_selecionada As Integer = list_clientes.SelectedIndices(0)

        ' Confirmar se o usuário realmente deseja excluir o cliente
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem erteza que deseja remover este cliente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o ID do Cliente
            Dim id_cliente As Integer = list_clientes.Items(linha_selecionada).Text

            ' Banco de Dados
            Dim conexao As New FbConnection
            Try
                ' 1) Conectar
                Dim caminho As String = Application.StartupPath
                Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"
                conexao.ConnectionString = str_conexao
                conexao.Open()

                ' 2) Definir 
                Dim comando As New FbCommand
                Dim sql As String = "DELETE FROM clientes WHERE id_cliente = ?"
                comando.Parameters.Add(New FbParameter With {.Value = id_cliente})
                comando.Connection = conexao
                comando.CommandText = sql

                ' 3) Executar Comando
                comando.ExecuteNonQuery()

                ' Sucesso
                MsgBox("Cliente removido com sucesso!")

                ' Atualizar a Listagem
                Listas.clientes()
            Catch erro As Exception
                MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
            Finally
                ' 4) Desconectar
                conexao.Close()
            End Try
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação Campos
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        Dim id As String = txt_id.Text
        Dim nome As String = txt_nome.Text
        Dim cpf As String = txt_CPF.Text
        Dim nascimento As Date = date_nascimento.Value
        Dim sexo As String = IIf(rbt_feminino.Checked, "f", "m")
        Dim plano As Integer = cbx_plano.SelectedItem.Value

        ' Banco de Dados
        Dim conexao As New FbConnection
        Try
            ' 1) Conectar
            Dim caminho As String = Application.StartupPath
            Dim str_conexao As String = "User=SYSDBA;Password=masterkey;Database=" & caminho & "\DB_CLIENTES.gdb;DataSource=localhost;"
            conexao.ConnectionString = str_conexao
            conexao.Open()

            ' 2) Definir Comando
            ' Vericar se deve inserir novo cliente ou alterar existente
            Dim comando As New FbCommand
            comando.Connection = conexao
            Dim sql As String
            Dim msg As String
            If (id = "Novo") Then
                sql = "INSERT INTO clientes (nome, cpf, nascimento, sexo, id_plano) VALUES (?,?,?,?,?)"
                comando.Parameters.Add(New FbParameter With {.Value = nome})
                comando.Parameters.Add(New FbParameter With {.Value = cpf})
                comando.Parameters.Add(New FbParameter With {.Value = Format(nascimento, "yyyy-MM-dd")})
                comando.Parameters.Add(New FbParameter With {.Value = sexo})
                comando.Parameters.Add(New FbParameter With {.Value = plano})
                msg = "Cliente cadastrado com sucesso!"
            Else
                sql = "UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ?, id_plano = ? WHERE id_cliente = ?"
                comando.Parameters.Add(New FbParameter With {.Value = nome})
                comando.Parameters.Add(New FbParameter With {.Value = cpf})
                comando.Parameters.Add(New FbParameter With {.Value = Format(nascimento, "yyyy-MM-dd")})
                comando.Parameters.Add(New FbParameter With {.Value = sexo})
                comando.Parameters.Add(New FbParameter With {.Value = plano})
                comando.Parameters.Add(New FbParameter With {.Value = id})
                msg = "Cliente alterado com sucesso!"
            End If
            comando.CommandText = sql

            ' 3) Executar Comando
            comando.ExecuteNonQuery()

            ' Sucesso
            MsgBox(msg)

            ' Atualizar a ListView
            Listas.clientes()
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' 4) Desconectar
            conexao.Close()
        End Try

        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub
End Class