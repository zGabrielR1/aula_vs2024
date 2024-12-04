Imports MeuProjeto.Cliente
Imports MeuProjeto.Formatar

Public Class FormClientes
    ' Criando o objeto `cliente` da classe Cliente
    Dim cliente As New Cliente

    Private Sub FormClientes_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
        Formatar.Desativar(Me)
        txt_id.ReadOnly = True

        ' Preencher a ListView
        Listar.clientes()

        ' Total
        label_total.Text = "Total: " & list_clientes.Items.Count
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Limpar e Ativar Form
        Formatar.Limpar(Me)
        Formatar.Ativar(Me)
        txt_id.Text = "Novo"
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Limpar e Desativar Form
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
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
        Formatar.Ativar(Me)
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
            cliente.Id = list_clientes.Items(linha_selecionada).Text

            ' Excluir o cliente
            cliente.Excluir()

            ' Atualizar a ListView
            Listar.clientes()

            ' Total
            label_total.Text = "Total: " & list_clientes.Items.Count
        End If
    End Sub

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação Campos
        If (Not Formatar.ValidouCampos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Entrada dos dados
        cliente.Id = IIf(txt_id.Text = "Novo", 0, txt_id.Text)
        cliente.Nome = txt_nome.Text
        cliente.Cpf = txt_cpf.Text
        cliente.Nascimento = date_nascimento.Value
        cliente.Sexo = IIf(rbt_feminino.Checked, "f", "m")

        ' Verificar se deve inserir ou atualizar o cliente
        If (cliente.Id = 0) Then
            cliente.Inserir()
        Else
            cliente.Atualizar()
        End If

        ' Atualizar a ListView
        Listar.clientes()

        ' Total
        label_total.Text = "Total: " & list_clientes.Items.Count

        ' Limpar e Desativar Form
        Formatar.Limpar(Me)
        Formatar.Desativar(Me)
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub
End Class