Public Class Form_Clientes
    Private Sub Form_Clientes_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedSingle
        Me.ControlBox = False
        Me.MaximizeBox = False
        Me.StartPosition = FormStartPosition.CenterScreen

        ' Marcar um Radio padrão
        rbt_feminino.Checked = True

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

        ' Desativar Form
        Formatar.desativar(Me)
        txt_id.ReadOnly = True

        ' Preencher a ListView
        Listas.clientes()
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar Form
        Formatar.limpar(Me)
        Formatar.ativar(Me)
        txt_id.Text = "Novo"
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
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

        ' Selecionar o Radio do sexo
        If (list_clientes.Items(linha_selecionada).SubItems(4).Text = "f") Then
            rbt_feminino.Checked = True
        Else
            rbt_masculino.Checked = True
        End If

        ' Ativar Form
        Formatar.ativar(Me)
    End Sub

    Private Sub btn_excluir_Click(sender As Object, e As EventArgs) Handles btn_excluir.Click
        ' Validar se usuário selecionou uma linha da ListView
        If (list_clientes.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um cliente!")
            Exit Sub
        End If

        ' Confirmar se o usuário realmente deseja excluir o cliente
        Dim resposta As MsgBoxResult
        resposta = MsgBox("Tem erteza que deseja remover este cliente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Dim linha_selecionada As Integer = list_clientes.SelectedIndices(0)
            Dim id_cliente As Integer = list_clientes.Items(linha_selecionada).Text

            'Banco de Dados
            Try
                BancoDeDados.conectar()
                Dim sql As String = "DELETE FROM clientes WHERE id_cliente = ?"
                BancoDeDados.executar(sql, id_cliente)

                ' Sucesso
                MsgBox("Cliente removido com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Finally
                BancoDeDados.desconectar()
            End Try

            ' Atualizar a ListView
            Listas.clientes()

            ' Total
            label_total.Text = "Total: " & list_clientes.Items.Count
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

        ' Banco de Dados
        Try
            BancoDeDados.conectar()

            ' Vericar se deve inserir novo cliente ou alterar existente
            Dim sql As String
            Dim mensagem As String
            If (id = "Novo") Then
                sql = "INSERT INTO clientes (nome, cpf, nascimento, sexo) VALUES (?, ?, ?, ?)"
                BancoDeDados.executar(sql, nome, cpf, Format(nascimento, "dd-MM-yyyy"), sexo)
                mensagem = "Cliente cadastrado com sucesso!"
            Else
                sql = "UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ? WHERE id_cliente = ?"
                BancoDeDados.executar(sql, nome, cpf, Format(nascimento, "dd-MM-yyyy"), sexo, id)
                mensagem = "Cliente alterado com sucesso!"
            End If

            ' Sucesso
            MsgBox(mensagem)
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.desconectar()
        End Try

        ' Atualizar a ListView
        Listas.clientes()

        ' Total
        label_total.Text = "Total: " & list_clientes.Items.Count

        ' Limpar e Desativar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub
End Class


'ColumnContent