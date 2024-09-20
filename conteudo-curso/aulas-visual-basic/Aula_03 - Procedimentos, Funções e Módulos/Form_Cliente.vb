Public Class Form_Cliente

    Private Sub Form_Cliente_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Desativar Form
        Formatar.desativar(Me)
        date_nascimento.Enabled = False
        group_sexo.Enabled = False

        ' Popular o ComboBox dos Planos
        cbx_plano.Items.Add(New With {.Text = "Plano Premium", .Value = 1})
        cbx_plano.Items.Add(New With {.Text = "Plano Gold", .Value = 2})
        cbx_plano.Items.Add(New With {.Text = "Plano Básico", .Value = 3})
        cbx_plano.DisplayMember = "Text"
        cbx_plano.ValueMember = "Value"

        ' Marcar o RadioButton Feminino por padrão
        rbt_feminino.Checked = True
    End Sub

    Private Sub btn_fechar_Click(sender As Object, e As EventArgs) Handles btn_fechar.Click
        Me.Close()
    End Sub

    ' Variável para controlar os itens (linha) do ListView
    Dim i As Integer = 0
    Dim gerador_id As Integer = 1
    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação do dados
        If (txt_nome.Text = "" Or txt_cpf.Text = "" Or cbx_plano.SelectedIndex = -1) Then
            MsgBox("Existe(m) campo(s) vazio(s)")
            Exit Sub        ' Comando para encerrar o procedimento
        End If

        ' Continuando após a validação

        ' Entrada dos dados
        Dim id As Object = txt_id.Text
        Dim nome As String = txt_nome.Text
        Dim cpf As String = txt_cpf.Text
        Dim nascimento As Date = date_nascimento.Value
        Dim sexo As String = IIf(rbt_feminino.Checked, "f", "m") ' Usando ShortIf
        'If (rbt_feminino.Checked) Then
        '    sexo = "F"
        'Else
        '    sexo = "M"
        'End If
        Dim plano As Integer = cbx_plano.SelectedItem.Value

        ' Processando a idade do cliente
        Dim idade As Double = DateDiff(DateInterval.Day, nascimento, Now()) / 365.25

        ' Verificar se deve inserir um novo cliente ou alterar um cliente existente
        Dim mensagem As String = ""
        If (id = "NOVO") Then
            list_clientes.Items.Add(gerador_id)
            list_clientes.Items(i).SubItems.Add(nome)
            list_clientes.Items(i).SubItems.Add(cpf)
            list_clientes.Items(i).SubItems.Add(Format(nascimento, "dd/MM/yyyy"))
            list_clientes.Items(i).SubItems.Add(Format(idade, "0"))
            list_clientes.Items(i).SubItems.Add(sexo)
            list_clientes.Items(i).SubItems.Add(plano)
            i = i + 1                                       ' Incrementa a variável que controla as linhas da ListView
            gerador_id = gerador_id + 1                     ' Incremente o gerador de ID do sistema
            label_total.Text = "Total: " & list_clientes.Items.Count
            mensagem = "Cliente cadastrado com sucesso!"
        Else
            Dim item As ListViewItem
            For Each item In list_clientes.Items
                If (id = item.Text) Then
                    item.SubItems(1).Text = nome
                    item.SubItems(2).Text = cpf
                    item.SubItems(3).Text = Format(nascimento, "dd/MM/yyyy")
                    item.SubItems(4).Text = Format(idade, "0")
                    item.SubItems(5).Text = sexo
                    item.SubItems(6).Text = plano
                    mensagem = "Cliente alterado com sucesso!"
                    Exit For
                End If
            Next
        End If

        ' Sucesso
        MsgBox(mensagem)

        ' Desativar e Limpar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Enabled = False
        group_sexo.Enabled = False
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1
    End Sub

    Private Sub btn_novo_Click(sender As Object, e As EventArgs) Handles btn_novo.Click
        ' Ativar e Limpar Form
        Formatar.limpar(Me)
        Formatar.ativar(Me)
        date_nascimento.Enabled = True
        group_sexo.Enabled = True
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1

        ' Configurando a caixa do ID
        txt_id.ReadOnly = True
        txt_id.Text = "NOVO"
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ' Desativar e Limpar Form
        Formatar.limpar(Me)
        Formatar.desativar(Me)
        date_nascimento.Enabled = True
        group_sexo.Enabled = True
        date_nascimento.Value = Now()
        rbt_feminino.Checked = True
        cbx_plano.SelectedIndex = -1
    End Sub

    Private Sub btn_alterar_Click(sender As Object, e As EventArgs) Handles btn_alterar.Click
        ' Validar se o usuário selecionou um cliente na ListView
        If (list_clientes.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um cliente!")
            Exit Sub
        End If

        ' Continuando

        ' Pegar o índice do item (linha) selecionado na ListView
        Dim linha_selecionada As Integer = list_clientes.SelectedIndices(0)

        ' Copiar os valores da ListView no item (linha) selecionado para o formulário
        txt_id.Text = list_clientes.Items(linha_selecionada).SubItems(0).Text
        txt_nome.Text = list_clientes.Items(linha_selecionada).SubItems(1).Text
        txt_cpf.Text = list_clientes.Items(linha_selecionada).SubItems(2).Text
        date_nascimento.Value = list_clientes.Items(linha_selecionada).SubItems(3).Text
        If (list_clientes.Items(linha_selecionada).SubItems(5).Text = "f") Then
            rbt_feminino.Checked = True
        Else
            rbt_masculino.Checked = True
        End If

        ' Infelizmente a propriedade SelectedValue não funcionou (e to compreguição de descobrir o porquê)
        ' Vamos interagir com o CombBox através de uma estrutura de repetição
        ' A cada laço de repetição vamos comparar o .Value do item com o valor da ListView
        ' Encontrando o item correspondente ao valor correto, a gente seleciona
        Dim i As Integer = 0
        While (i < 3)
            If (cbx_plano.Items(i).Value = list_clientes.Items(linha_selecionada).SubItems(6).Text) Then
                cbx_plano.SelectedIndex = i
                Exit While
            End If
            i = i + 1
        End While

        ' Ativar o form
        Formatar.ativar(Me)
        date_nascimento.Enabled = True
        group_sexo.Enabled = True

        ' Configurando a caixa do ID
        txt_id.ReadOnly = True
    End Sub

    Private Sub btn_excluir_Click(sender As Object, e As EventArgs) Handles btn_excluir.Click
        ' Validar se o usuário selecionou um cliente na ListView
        If (list_clientes.SelectedIndices.Count = 0) Then
            MsgBox("Por favor selecione um cliente!")
            Exit Sub
        End If

        ' Continuando

        ' Pegar o índice do item (linha) selecionado na ListView
        Dim linha_selecionada As Integer = list_clientes.SelectedIndices(0)

        ' Confirmar se o usuário realmente deseja excluir o cliente
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja excluir este cliente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            list_clientes.Items.RemoveAt(linha_selecionada)
            i = i - 1
            label_total.Text = "Total: " & list_clientes.Items.Count
            MsgBox("Cliente removido com sucesso!")
        End If
    End Sub
End Class