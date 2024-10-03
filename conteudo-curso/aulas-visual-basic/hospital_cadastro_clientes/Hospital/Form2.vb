Imports System
Imports System.Windows.Forms

Public Class Form2

    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        cbx_medico.Enabled = False
        rbt_normal.Checked = True
    End Sub

    Private Sub rbt_plano_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_health_on_demand.CheckedChanged, rbt_top_saude.CheckedChanged, rbt_convenio_joao.CheckedChanged
        cbx_medico.Items.Clear()
        cbx_medico.Enabled = True

        If rbt_health_on_demand.Checked Then
            cbx_medico.Items.AddRange({"Mel Gibson", "Tom Hanks", "Angelina Jolie"})
        ElseIf rbt_top_saude.Checked Then
            cbx_medico.Items.AddRange({"Scarlett Johansson", "Sylvester Stallone", "Julia Roberts"})
        ElseIf rbt_convenio_joao.Checked Then
            cbx_medico.Items.AddRange({"Puff Daddy", "Jeffrey Epstein"})
        End If

        cbx_medico.SelectedIndex = -1
    End Sub

    Private Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_cadastrar.Click
        If Not ModuloFormatar.ValidarCampos(txt_nome.Text, txt_cpf.Text, date_nascimento.Value, cbx_medico.SelectedItem, rbt_normal.Checked, rbt_urgente.Checked) Then
            Return
        End If

        Dim idade As Integer = ModuloCalcularIdade.CalcularIdade(date_nascimento.Value)
        Dim plano As String = ""
        If rbt_health_on_demand.Checked Then plano = "Health On Demand"
        If rbt_top_saude.Checked Then plano = "Top Saúde"
        If rbt_convenio_joao.Checked Then plano = "Convênio João de Deus"

        Dim lvi As New ListViewItem(New String() {txt_nome.Text, txt_cpf.Text, idade.ToString(), plano, cbx_medico.SelectedItem.ToString(), If(rbt_urgente.Checked, "Urgente", "Normal")})

        If rbt_urgente.Checked OrElse idade > 60 Then
            ListView1.Items.Insert(0, lvi)
        Else
            ListView1.Items.Add(lvi)
        End If

        ModuloFormatar.LimparCampos(Me)
        MsgBox("Paciente registrado com sucesso!")
    End Sub

    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        ModuloFormatar.LimparCampos(Me)
    End Sub

    Private Sub btn_atender_Click(sender As Object, e As EventArgs) Handles btn_next.Click
        If ListView1.Items.Count > 0 Then
            Dim paciente As String = ListView1.Items(0).SubItems(0).Text
            ListView1.Items.RemoveAt(0)
            MsgBox("Paciente " & paciente & " atendido.")
        Else
            MsgBox("Não há pacientes na fila.")
        End If
    End Sub

    Private Sub ListView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListView1.SelectedIndexChanged

    End Sub
End Class