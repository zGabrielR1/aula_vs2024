Imports System.Security.Cryptography.Pkcs

Public Class Form_Cliente
    Private Sub Label5_Click(sender As Object, e As EventArgs) Handles Label5.Click

    End Sub

    Private Sub cbx_plano_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbx_plano.SelectedIndexChanged

    End Sub

    Private Sub label_total_Click(sender As Object, e As EventArgs) Handles label_total.Click

    End Sub

    Private Sub Form_Cliente_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        ' Popular o ComboBox
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

    Private Sub btn_salvar_Click(sender As Object, e As EventArgs) Handles btn_salvar.Click
        ' Validação dos dados
        If (txt_nome.Text = "" Or txt_cpf.Text = "" Or cbx_plano.SelectedIndex = -1) Then
            MsgBox("Existe(m) campo(s) vazio(s)")
            Exit Sub            ' Comando para encerrar o procedimento
        End If

        ' Continuando após a validação


        ' Entrada dos dados
        Dim nome As String = txt_nome.Text
        Dim cpf As String = txt_cpf.Text
        Dim nascimento As Date = date_nascimento.Value
        Dim sexo As String = IIf(rbt_feminino.Checked, "f", "m") ' Usando ShortIf

        'If (rbt_feminino.Checked) Then
        '    sexo = "f"
        'Else
        '    sexo = "m"
        'End If
        Dim plano As Integer = cbx_plano.SelectedItem.Value

        ' Processando a idade do cliente
        Dim idade As Double = DateDiff(DateInterval.Day, nascimento, Now()) / 365.25


        ' Salvando os dados no ListView
        list_clientes.Items.Add(i + 1)
        list_clientes.Items(i).SubItems.Add(nome)
        list_clientes.Items(i).SubItems.Add(cpf)
        list_clientes.Items(i).SubItems.Add(Format(nascimento, "dd/MM/yyyy"))
        list_clientes.Items(i).SubItems.Add(Format(idade, "0"))
        list_clientes.Items(i).SubItems.Add(sexo)
        list_clientes.Items(i).SubItems.Add(plano)
        i = i + 1
        ' Sucesso
        MsgBox("Cliente cadastrado com sucesso!")

    End Sub
End Class