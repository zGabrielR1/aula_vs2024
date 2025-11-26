Public Class Form_Principal
    ' Variáveis públicas
    Dim plano_a() As String = {"Mel Gibson", "Tom Hanks", "Anelina Jolie"}                      ' Array para armazenar os médicos do plano Health On Demand
    Dim plano_b() As String = {"Scarlett Johansson", "Sylvester Stallone", "Julia Roberts"}     ' Array para armazenar os médicos do plano Top Saúde
    Dim plano_c() As String = {"Puff Daddy", "Jeffrey Epstein"}                                 ' Array para armazenar os médicos do plano Convênio João de Deus
    Dim plano_selecionado As String                                                             ' Variável para armazenar o nome do plano selecionado nos Radios

    Dim modo_escuro As Boolean = False                                                          ' Controlar se o modo escuro está ativado

    ' Alternar modo escuro quando o botão é clicado
    Private Sub btn_modo_escuro_Click(sender As Object, e As EventArgs) Handles btn_modo_escuro.Click
        AlternarModoEscuro()
    End Sub

    ' Método para alternar entre modo claro e escuro
    Private Sub AlternarModoEscuro()
        If modo_escuro Then
            ' Definir Modo Claro
            Me.BackColor = Color.White
            ForeColor = Color.Black
            DefinirCoresControles(Color.White, Color.Black)
        Else
            ' Definir Modo Escuro
            Me.BackColor = Color.FromArgb(45, 45, 48)
            ForeColor = Color.White
            DefinirCoresControles(Color.FromArgb(45, 45, 48), Color.White)
        End If
        modo_escuro = Not modo_escuro
    End Sub

    ' Método para definir cores para todos os controles do formulário
    Private Sub DefinirCoresControles(corFundo As Color, corTexto As Color)
        For Each ctrl As Control In Me.Controls
            If TypeOf ctrl Is Button Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
                CType(ctrl, Button).FlatStyle = FlatStyle.Flat
                CType(ctrl, Button).FlatAppearance.BorderSize = 0
            ElseIf TypeOf ctrl Is TextBox Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is Label Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is ComboBox Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is RadioButton Then
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is ListView Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is GroupBox Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
                DefinirCoresControlesFilhos(ctrl, corFundo, corTexto)
            End If
        Next
    End Sub

    ' Método para definir cores dos controles dentro de GroupBoxes
    Private Sub DefinirCoresControlesFilhos(container As Control, corFundo As Color, corTexto As Color)
        For Each ctrl As Control In container.Controls
            If TypeOf ctrl Is Button Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
                CType(ctrl, Button).FlatStyle = FlatStyle.Flat
                CType(ctrl, Button).FlatAppearance.BorderSize = 0
            ElseIf TypeOf ctrl Is TextBox Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is Label Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is ComboBox Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is RadioButton Then
                ctrl.ForeColor = corTexto
            ElseIf TypeOf ctrl Is ListView Then
                ctrl.BackColor = corFundo
                ctrl.ForeColor = corTexto
            End If
        Next
    End Sub

    Private Sub Form_Principal_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
        Formatar.limpar(Me)                 ' Limpar os campos
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
        Dim medico As String = cbx_medico.Text
        Dim tipo As String = IIf(rbt_normal.Checked And Paciente.calcular_idade(nascimento) < 60, "Normal", "Urgente")

        Try
            ' Conectar e iniciar transação
            BancoDeDados.conectar()
            BancoDeDados.iniciar_transação()

            ' Inserir paciente no banco
            Dim sql As String = "INSERT INTO PACIENTES " &
                               "(NOME, CPF, NASCIMENTO, PLANO, MEDICO, TIPO, ATENDIDO) " &
                               "VALUES (?, ?, ?, ?, ?, ?, 'NAO')"
            BancoDeDados.executar(sql, nome, cpf, nascimento, plano_selecionado, medico, tipo)

            ' Confirmar transação
            BancoDeDados.confirmar_transacao()

            ' Criar item da ListView
            Dim item As New ListViewItem(nome)
            item.SubItems.Add(cpf)
            item.SubItems.Add(nascimento.ToShortDateString())
            item.SubItems.Add(Paciente.calcular_idade(nascimento).ToString())
            item.SubItems.Add(plano_selecionado)
            item.SubItems.Add(medico)
            item.SubItems.Add(tipo)


            ' Adicionar à fila conforme prioridade
            If (tipo = "Urgente" Or Paciente.calcular_idade(nascimento) >= 60) Then
                list_fila.Items.Insert(0, item)
            Else
                list_fila.Items.Add(item)
            End If

            ' Ajustar colunas e limpar campos
            list_fila.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
            Formatar.limpar(Me)

        Catch ex As Exception
            BancoDeDados.voltar_transacao()
            MsgBox("Erro ao cadastrar paciente: " & ex.Message)
        Finally
            BancoDeDados.desconectar()
        End Try
    End Sub

    ' Botão Atender Paciente
    Private Sub btn_atender_Click(sender As Object, e As EventArgs) Handles btn_atender.Click
        If (list_fila.Items.Count = 0) Then
            MsgBox("A fila de atendimentos não possui nenhum paciente cadastrado!")
            Exit Sub
        End If

        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja atender o paciente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Try
                ' Conectar e iniciar transação
                BancoDeDados.conectar()
                BancoDeDados.iniciar_transação()

                ' Travar tabela de pacientes
                BancoDeDados.travar_tabela("PACIENTES")

                ' Atualizar status do paciente
                Dim cpf As String = list_fila.Items(0).SubItems(1).Text
                Dim sql As String = "UPDATE PACIENTES SET ATENDIDO = 'SIM' WHERE CPF = ?"
                BancoDeDados.executar(sql, cpf)

                ' Confirmar transação
                BancoDeDados.confirmar_transacao()

                ' Remover da ListView
                list_fila.Items(0).Remove()
                MsgBox("Paciente atendido com sucesso!")

            Catch ex As Exception
                BancoDeDados.voltar_transacao()
                MsgBox("Erro ao atender paciente: " & ex.Message)
            Finally
                BancoDeDados.desconectar()
            End Try
        End If
    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub
End Class