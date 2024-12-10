Public Class FormPrincipal
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
        If (Not Formatar.validou_campos(Me)) Then
            MsgBox("Por favor preencha todos os campos!")
            Exit Sub
        End If

        ' Pegar os dados
        Dim nome As String = txt_nome.Text
        Dim cpf As String = txt_cpf.Text
        Dim nascimento As Date = date_nascimento.Value
        Dim plano As String = plano_selecionado
        Dim medico As String = cbx_medico.Text

        ' Calcular a idade
        Dim idade As Integer = Paciente.calcular_idade(nascimento)

        ' Pegar o tipo de atenimento
        Dim tipo As String = IIf(rbt_normal.Checked And idade < 60, "Normal", "Urgente")

        ' Criar um novo item da ListView com os dados do paciente
        Dim item As New ListViewItem(nome)
        item.SubItems.Add(cpf)
        item.SubItems.Add(nascimento.ToShortDateString())
        item.SubItems.Add(idade.ToString())
        item.SubItems.Add(plano)
        item.SubItems.Add(medico)
        item.SubItems.Add(tipo)

        ' Verificar as regras de negócio da fila
        If (tipo = "Urgente" Or idade >= 60) Then
            list_fila.Items.Insert(0, item)     ' Urgente, começo da fila
        Else
            list_fila.Items.Add(item)           ' Normal, final da fila
        End If

        ' Ajustar Largura das Colunas
        list_fila.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)

        ' Gravar os dados no banco
        Try
            BancoDeDados.Conectar()
            Dim sql As String = "INSERT INTO pacientes (nome, cpf, nascimento, plano, medico, tipo, atendido) VALUES (?,?,?,?,?,?,'não')"
            BancoDeDados.Executar(sql, nome, cpf, Format(nascimento, "yyyy-MM-dd"), plano, medico, tipo)
            MsgBox("Paciente registrado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            BancoDeDados.Desconectar()
        End Try

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

        ' Confirmação
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja atender o paciente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Try
                BancoDeDados.Conectar()

                ' Pegar o CPF do paciente para usar como critério no sql
                Dim cpf As String = list_fila.Items(0).SubItems(1).Text

                ' Alterar a situação
                Dim sql As String = "UPDATE pacientes SET atendido = 'sim' WHERE cpf = ?"
                BancoDeDados.Executar(sql, cpf)

                ' Remove o primero item da ListView
                list_fila.Items(0).Remove()

                ' Sucesso
                MsgBox("Paciente atendido com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Finally
                BancoDeDados.Desconectar()
            End Try
        End If
    End Sub

    Private Sub txt_nome_TextChanged(sender As Object, e As EventArgs) Handles txt_nome.TextChanged

    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub

    Private Sub Label2_Click(sender As Object, e As EventArgs) Handles Label2.Click

    End Sub
End Class