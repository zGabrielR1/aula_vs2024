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
        Try
            ' Conectar
            BancoDeDados.conectar()

            ' Definir 
            Dim sql As String = "SELECT * FROM planos"
            Dim retorno As DataTable = BancoDeDados.consultar(sql)

            ' Imprimir os dados no ComboBox
            For Each linha In retorno.Rows
                cbx_plano.Items.Add(New With {.Text = linha("descricao"), .Value = linha("id_plano")})
            Next
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' Desconectar
            BancoDeDados.desconectar()
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
        txt_cpf.Text = list_clientes.Items(linha_selecionada).SubItems(2).Text
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
        resposta = MsgBox("Tem certeza que deseja remover este cliente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            ' Pegar o ID do Cliente
            Dim id_cliente As Integer = list_clientes.Items(linha_selecionada).Text

            ' Banco de Dados
            Try
                ' Conectar
                BancoDeDados.conectar()

                ' Definir 
                Dim sql As String = "DELETE FROM clientes WHERE id_cliente = ?"

                ' Executar Comando
                BancoDeDados.executar(sql, id_cliente)

                ' Sucesso
                MsgBox("Cliente removido com sucesso!")
            Catch erro As Exception
                MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
            Finally
                ' Desconectar
                BancoDeDados.desconectar()
            End Try

            ' Atualizar a Listagem
            Listas.clientes()
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
        Dim cpf As String = txt_cpf.Text
        Dim nascimento As Date = date_nascimento.Value
        Dim sexo As String = IIf(rbt_feminino.Checked, "f", "m")
        Dim plano As Integer = cbx_plano.SelectedItem.Value

        ' Banco de Dados
        Try
            ' Conectar
            BancoDeDados.conectar()

            ' Definir Comando
            ' Vericar se deve inserir novo cliente ou alterar existente
            Dim sql As String
            Dim msg As String
            If (id = "Novo") Then
                sql = "INSERT INTO clientes (nome, cpf, nascimento, sexo, id_plano) VALUES (?,?,?,?,?)"
                BancoDeDados.executar(sql, nome, cpf, Format(nascimento, "yyyy-MM-dd"), sexo, plano)
                msg = "Cliente cadastrado com sucesso!"
            Else
                sql = "UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ?, id_plano = ? WHERE id_cliente = ?"
                BancoDeDados.executar(sql, nome, cpf, Format(nascimento, "yyyy-MM-dd"), sexo, plano, id)
                msg = "Cliente alterado com sucesso!"
            End If

            ' Sucesso
            MsgBox(msg)
        Catch erro As Exception
            MsgBox("Ocorreu uma exceção no Banco de Dados: " & erro.Message)
        Finally
            ' Desconectar
            BancoDeDados.desconectar()
        End Try

        ' Atualizar a ListView
        Listas.clientes()

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

    Private Sub list_clientes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list_clientes.SelectedIndexChanged

    End Sub

    Private Sub gbox_sexo_Enter(sender As Object, e As EventArgs) Handles gbox_sexo.Enter

    End Sub
End Class


'ColumnContent