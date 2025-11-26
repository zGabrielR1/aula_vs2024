Imports Hospital_3.Paciente

Public Class FormPrincipal
    Public paciente As New Paciente
    ' Variáveis públicas
    Dim plano_a() As String = {"Mel Gibson", "Tom Hanks", "Anelina Jolie"}                      ' Array para armazenar os médicos do plano Health On Demand
    Dim plano_b() As String = {"Scarlett Johansson", "Sylvester Stallone", "Julia Roberts"}     ' Array para armazenar os médicos do plano Top Saúde
    Dim plano_c() As String = {"Puff Daddy", "Jeffrey Epstein"}                                 ' Array para armazenar os médicos do plano Convênio João de Deus
    Dim plano_selecionado As String                                                             ' Variável para armazenar o nome do plano selecionado nos Radios

    Private Sub FormPrincipal_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Marcar o RadioButton do plano Health On Demand por padrão
        rbt_planoA_CheckedChanged(rbt_planoA, EventArgs.Empty)
    End Sub

    ' Selecionar o RadioButton do Plano Health On Demand
    Private Sub rbt_planoA_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_planoA.CheckedChanged
        cbx_medico.DataSource = plano_a             ' Definir os médicos do plano
        plano_selecionado = "Health On Demand"      ' Pegar o nome do plano selecionado
    End Sub

    ' Selecionar o RadioButton do Plano Top Saúde
    Private Sub rbt_planoB_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_planoB.CheckedChanged
        cbx_medico.DataSource = plano_b             ' Definir os médicos do plano
        plano_selecionado = "Plano Top Saúde"       ' Pegar o nome do plano selecionado
    End Sub

    ' Selecionar o RadioButton do Convênio João de Deus
    Private Sub rbt_planoC_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_planoC.CheckedChanged
        cbx_medico.DataSource = plano_c             ' Definir os médicos do plano
        plano_selecionado = "Convênio João de Deus" ' Pegar o nome do plano selecionado
    End Sub

    ' Botão Cancelar
    Private Sub btn_cancelar_Click(sender As Object, e As EventArgs) Handles btn_cancelar.Click
        Formatar.Limpar(Me)                 ' Limpar os campos
    End Sub

    ' Botão Cadastrar Paciente
    Private Sub btn_cadastrar_Click(sender As Object, e As EventArgs) Handles btn_cadastrar.Click
        ' Validação
        If (Not Formatar.ValidouCampos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Pegar os dados
        Me.paciente.Nome = txt_nome.Text
        Me.paciente.Cpf = txt_cpf.Text
        Me.paciente.Nascimento = date_nascimento.Value
        Me.paciente.Plano = plano_selecionado
        Me.paciente.Medico = cbx_medico.Text


        paciente.AdicionarNaFila(list_fila)

        ' Ajustar Largura das Colunas
        list_fila.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)


        ' Limpar campos
        Formatar.Limpar(Me)
    End Sub

    ' Botão Atender Paciente
    Private Sub btn_atender_Click(sender As Object, e As EventArgs) Handles btn_atender.Click
        ' Validação
        If (list_fila.Items.Count = 0) Then
            MsgBox("A fila de atendimentos não possui nenhum paciente cadastrado!")
            Exit Sub
        End If

        ' Atender paciente
        paciente.RemoverDaFila()
    End Sub
End Class