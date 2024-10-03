<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form2
    Inherits System.Windows.Forms.Form

    'Descartar substituições de formulário para limpar a lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Exigido pelo Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'OBSERVAÇÃO: o procedimento a seguir é exigido pelo Windows Form Designer
    'Pode ser modificado usando o Windows Form Designer.  
    'Não o modifique usando o editor de códigos.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.lbl_nome = New System.Windows.Forms.Label()
        Me.lbl_cpf = New System.Windows.Forms.Label()
        Me.lbl_nascimento = New System.Windows.Forms.Label()
        Me.ListView1 = New System.Windows.Forms.ListView()
        Me.cheader_nome = New System.Windows.Forms.ColumnHeader()
        Me.cheader_cpf = New System.Windows.Forms.ColumnHeader()
        Me.cheader_idade = New System.Windows.Forms.ColumnHeader()
        Me.cheader_plano = New System.Windows.Forms.ColumnHeader()
        Me.cheader_medico = New System.Windows.Forms.ColumnHeader()
        Me.cheader_situacao = New System.Windows.Forms.ColumnHeader()
        Me.cbx_medico = New System.Windows.Forms.ComboBox()
        Me.gp_planoSaude = New System.Windows.Forms.GroupBox()
        Me.rbt_health_on_demand = New System.Windows.Forms.RadioButton()
        Me.rbt_convenio_joao = New System.Windows.Forms.RadioButton()
        Me.rbt_top_saude = New System.Windows.Forms.RadioButton()
        Me.date_nascimento = New System.Windows.Forms.DateTimePicker()
        Me.lbl_medico = New System.Windows.Forms.Label()
        Me.txt_cpf = New System.Windows.Forms.TextBox()
        Me.txt_nome = New System.Windows.Forms.TextBox()
        Me.btn_cadastrar = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.gp_tipo_atendimento = New System.Windows.Forms.GroupBox()
        Me.rbt_urgente = New System.Windows.Forms.RadioButton()
        Me.rbt_normal = New System.Windows.Forms.RadioButton()
        Me.btn_next = New System.Windows.Forms.Button()
        Me.gp_planoSaude.SuspendLayout()
        Me.gp_tipo_atendimento.SuspendLayout()
        Me.SuspendLayout()
        '
        'lbl_nome
        '
        Me.lbl_nome.AutoSize = True
        Me.lbl_nome.Location = New System.Drawing.Point(43, 21)
        Me.lbl_nome.Name = "lbl_nome"
        Me.lbl_nome.Size = New System.Drawing.Size(43, 15)
        Me.lbl_nome.TabIndex = 0
        Me.lbl_nome.Text = "Nome:"
        '
        'lbl_cpf
        '
        Me.lbl_cpf.AutoSize = True
        Me.lbl_cpf.Location = New System.Drawing.Point(43, 65)
        Me.lbl_cpf.Name = "lbl_cpf"
        Me.lbl_cpf.Size = New System.Drawing.Size(31, 15)
        Me.lbl_cpf.TabIndex = 1
        Me.lbl_cpf.Text = "CPF:"
        '
        'lbl_nascimento
        '
        Me.lbl_nascimento.AutoSize = True
        Me.lbl_nascimento.Location = New System.Drawing.Point(43, 107)
        Me.lbl_nascimento.Name = "lbl_nascimento"
        Me.lbl_nascimento.Size = New System.Drawing.Size(74, 15)
        Me.lbl_nascimento.TabIndex = 2
        Me.lbl_nascimento.Text = "Nascimento:"
        '
        'ListView1
        '
        Me.ListView1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.cheader_nome, Me.cheader_cpf, Me.cheader_idade, Me.cheader_plano, Me.cheader_medico, Me.cheader_situacao})
        Me.ListView1.GridLines = True
        Me.ListView1.Location = New System.Drawing.Point(359, 21)
        Me.ListView1.Name = "ListView1"
        Me.ListView1.Size = New System.Drawing.Size(531, 380)
        Me.ListView1.TabIndex = 3
        Me.ListView1.UseCompatibleStateImageBehavior = False
        Me.ListView1.View = System.Windows.Forms.View.Details
        '
        'cheader_nome
        '
        Me.cheader_nome.Text = "Nome"
        Me.cheader_nome.Width = 100
        '
        'cheader_cpf
        '
        Me.cheader_cpf.Text = "CPF"
        Me.cheader_cpf.Width = 100
        '
        'cheader_idade
        '
        Me.cheader_idade.Text = "Idade"
        Me.cheader_idade.Width = 80
        '
        'cheader_plano
        '
        Me.cheader_plano.Text = "Plano"
        Me.cheader_plano.Width = 100
        '
        'cheader_medico
        '
        Me.cheader_medico.Text = "Médico"
        Me.cheader_medico.Width = 80
        '
        'cheader_situacao
        '
        Me.cheader_situacao.Text = "Situação"
        Me.cheader_situacao.Width = 80
        '
        'cbx_medico
        '
        Me.cbx_medico.FormattingEnabled = True
        Me.cbx_medico.Location = New System.Drawing.Point(123, 270)
        Me.cbx_medico.Name = "cbx_medico"
        Me.cbx_medico.Size = New System.Drawing.Size(187, 23)
        Me.cbx_medico.TabIndex = 4
        '
        'gp_planoSaude
        '
        Me.gp_planoSaude.Controls.Add(Me.rbt_health_on_demand)
        Me.gp_planoSaude.Controls.Add(Me.rbt_convenio_joao)
        Me.gp_planoSaude.Controls.Add(Me.rbt_top_saude)
        Me.gp_planoSaude.Location = New System.Drawing.Point(43, 151)
        Me.gp_planoSaude.Name = "gp_planoSaude"
        Me.gp_planoSaude.Size = New System.Drawing.Size(267, 106)
        Me.gp_planoSaude.TabIndex = 5
        Me.gp_planoSaude.TabStop = False
        Me.gp_planoSaude.Text = "Plano de Saúde:"
        '
        'rbt_health_on_demand
        '
        Me.rbt_health_on_demand.AutoSize = True
        Me.rbt_health_on_demand.Location = New System.Drawing.Point(19, 22)
        Me.rbt_health_on_demand.Name = "rbt_health_on_demand"
        Me.rbt_health_on_demand.Size = New System.Drawing.Size(125, 19)
        Me.rbt_health_on_demand.TabIndex = 6
        Me.rbt_health_on_demand.TabStop = True
        Me.rbt_health_on_demand.Text = "Health on Demand"
        Me.rbt_health_on_demand.UseVisualStyleBackColor = True
        '
        'rbt_convenio_joao
        '
        Me.rbt_convenio_joao.AutoSize = True
        Me.rbt_convenio_joao.Location = New System.Drawing.Point(19, 72)
        Me.rbt_convenio_joao.Name = "rbt_convenio_joao"
        Me.rbt_convenio_joao.Size = New System.Drawing.Size(148, 19)
        Me.rbt_convenio_joao.TabIndex = 8
        Me.rbt_convenio_joao.TabStop = True
        Me.rbt_convenio_joao.Text = "Convênio João de Deus"
        Me.rbt_convenio_joao.UseVisualStyleBackColor = True
        '
        'rbt_top_saude
        '
        Me.rbt_top_saude.AutoSize = True
        Me.rbt_top_saude.Location = New System.Drawing.Point(19, 47)
        Me.rbt_top_saude.Name = "rbt_top_saude"
        Me.rbt_top_saude.Size = New System.Drawing.Size(79, 19)
        Me.rbt_top_saude.TabIndex = 7
        Me.rbt_top_saude.TabStop = True
        Me.rbt_top_saude.Text = "Top Saúde"
        Me.rbt_top_saude.UseVisualStyleBackColor = True
        '
        'date_nascimento
        '
        Me.date_nascimento.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.date_nascimento.Location = New System.Drawing.Point(123, 101)
        Me.date_nascimento.Name = "date_nascimento"
        Me.date_nascimento.Size = New System.Drawing.Size(187, 23)
        Me.date_nascimento.TabIndex = 9
        '
        'lbl_medico
        '
        Me.lbl_medico.AutoSize = True
        Me.lbl_medico.Location = New System.Drawing.Point(43, 270)
        Me.lbl_medico.Name = "lbl_medico"
        Me.lbl_medico.Size = New System.Drawing.Size(50, 15)
        Me.lbl_medico.TabIndex = 10
        Me.lbl_medico.Text = "Médico:"
        '
        'txt_cpf
        '
        Me.txt_cpf.Location = New System.Drawing.Point(123, 65)
        Me.txt_cpf.Name = "txt_cpf"
        Me.txt_cpf.Size = New System.Drawing.Size(187, 23)
        Me.txt_cpf.TabIndex = 11
        '
        'txt_nome
        '
        Me.txt_nome.Location = New System.Drawing.Point(123, 21)
        Me.txt_nome.Name = "txt_nome"
        Me.txt_nome.Size = New System.Drawing.Size(187, 23)
        Me.txt_nome.TabIndex = 12
        '
        'btn_cadastrar
        '
        Me.btn_cadastrar.Location = New System.Drawing.Point(43, 403)
        Me.btn_cadastrar.Name = "btn_cadastrar"
        Me.btn_cadastrar.Size = New System.Drawing.Size(120, 35)
        Me.btn_cadastrar.TabIndex = 13
        Me.btn_cadastrar.Text = "Cadastrar"
        Me.btn_cadastrar.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(187, 403)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(123, 35)
        Me.btn_cancelar.TabIndex = 14
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'gp_tipo_atendimento
        '
        Me.gp_tipo_atendimento.Controls.Add(Me.rbt_urgente)
        Me.gp_tipo_atendimento.Controls.Add(Me.rbt_normal)
        Me.gp_tipo_atendimento.Location = New System.Drawing.Point(43, 308)
        Me.gp_tipo_atendimento.Name = "gp_tipo_atendimento"
        Me.gp_tipo_atendimento.Size = New System.Drawing.Size(267, 79)
        Me.gp_tipo_atendimento.TabIndex = 15
        Me.gp_tipo_atendimento.TabStop = False
        Me.gp_tipo_atendimento.Text = "Atendimento:"
        '
        'rbt_urgente
        '
        Me.rbt_urgente.AutoSize = True
        Me.rbt_urgente.Location = New System.Drawing.Point(112, 46)
        Me.rbt_urgente.Name = "rbt_urgente"
        Me.rbt_urgente.Size = New System.Drawing.Size(67, 19)
        Me.rbt_urgente.TabIndex = 17
        Me.rbt_urgente.TabStop = True
        Me.rbt_urgente.Text = "Urgente"
        Me.rbt_urgente.UseVisualStyleBackColor = True
        '
        'rbt_normal
        '
        Me.rbt_normal.AutoSize = True
        Me.rbt_normal.Location = New System.Drawing.Point(25, 46)
        Me.rbt_normal.Name = "rbt_normal"
        Me.rbt_normal.Size = New System.Drawing.Size(65, 19)
        Me.rbt_normal.TabIndex = 16
        Me.rbt_normal.TabStop = True
        Me.rbt_normal.Text = "Normal"
        Me.rbt_normal.UseVisualStyleBackColor = True
        '
        'btn_next
        '
        Me.btn_next.Location = New System.Drawing.Point(359, 407)
        Me.btn_next.Name = "btn_next"
        Me.btn_next.Size = New System.Drawing.Size(531, 38)
        Me.btn_next.TabIndex = 16
        Me.btn_next.Text = "Atender Próximo Paciente"
        Me.btn_next.UseVisualStyleBackColor = True
        '
        'Form2
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(902, 450)
        Me.Controls.Add(Me.btn_next)
        Me.Controls.Add(Me.gp_tipo_atendimento)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_cadastrar)
        Me.Controls.Add(Me.txt_nome)
        Me.Controls.Add(Me.txt_cpf)
        Me.Controls.Add(Me.lbl_medico)
        Me.Controls.Add(Me.date_nascimento)
        Me.Controls.Add(Me.gp_planoSaude)
        Me.Controls.Add(Me.cbx_medico)
        Me.Controls.Add(Me.ListView1)
        Me.Controls.Add(Me.lbl_nascimento)
        Me.Controls.Add(Me.lbl_cpf)
        Me.Controls.Add(Me.lbl_nome)
        Me.Name = "Form2"
        Me.Text = "CONTROLE DE PACIENTES"
        Me.gp_planoSaude.ResumeLayout(False)
        Me.gp_planoSaude.PerformLayout()
        Me.gp_tipo_atendimento.ResumeLayout(False)
        Me.gp_tipo_atendimento.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lbl_nome As Label
    Friend WithEvents lbl_cpf As Label
    Friend WithEvents lbl_nascimento As Label
    Friend WithEvents ListView1 As ListView
    Friend WithEvents cheader_nome As ColumnHeader
    Friend WithEvents cheader_cpf As ColumnHeader
    Friend WithEvents cheader_idade As ColumnHeader
    Friend WithEvents cheader_plano As ColumnHeader
    Friend WithEvents cheader_medico As ColumnHeader
    Friend WithEvents cheader_situacao As ColumnHeader
    Friend WithEvents cbx_medico As ComboBox
    Friend WithEvents gp_planoSaude As GroupBox
    Friend WithEvents rbt_health_on_demand As RadioButton
    Friend WithEvents rbt_convenio_joao As RadioButton
    Friend WithEvents rbt_top_saude As RadioButton
    Friend WithEvents date_nascimento As DateTimePicker
    Friend WithEvents lbl_medico As Label
    Friend WithEvents txt_cpf As TextBox
    Friend WithEvents txt_nome As TextBox
    Friend WithEvents btn_cadastrar As Button
    Friend WithEvents btn_cancelar As Button
    Friend WithEvents gp_tipo_atendimento As GroupBox
    Friend WithEvents rbt_urgente As RadioButton
    Friend WithEvents rbt_normal As RadioButton
    Friend WithEvents btn_next As Button
End Class
