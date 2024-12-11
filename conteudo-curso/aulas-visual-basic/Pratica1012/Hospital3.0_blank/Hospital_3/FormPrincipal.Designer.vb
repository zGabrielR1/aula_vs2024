<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormPrincipal
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
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

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.cbx_medico = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.btn_atender = New System.Windows.Forms.Button()
        Me.list_fila = New System.Windows.Forms.ListView()
        Me.column_nome = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_cpf = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_nasc = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_idade = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_plano = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_medico = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.column_tipo = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_cadastrar = New System.Windows.Forms.Button()
        Me.txt_cpf = New System.Windows.Forms.TextBox()
        Me.txt_nome = New System.Windows.Forms.TextBox()
        Me.date_nascimento = New System.Windows.Forms.DateTimePicker()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.rbt_urgente = New System.Windows.Forms.RadioButton()
        Me.rbt_normal = New System.Windows.Forms.RadioButton()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.rbt_planoC = New System.Windows.Forms.RadioButton()
        Me.rbt_planoB = New System.Windows.Forms.RadioButton()
        Me.rbt_planoA = New System.Windows.Forms.RadioButton()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'cbx_medico
        '
        Me.cbx_medico.FormattingEnabled = True
        Me.cbx_medico.Location = New System.Drawing.Point(84, 220)
        Me.cbx_medico.Name = "cbx_medico"
        Me.cbx_medico.Size = New System.Drawing.Size(181, 21)
        Me.cbx_medico.TabIndex = 27
        Me.cbx_medico.Tag = "obrigatório"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 223)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(45, 13)
        Me.Label4.TabIndex = 26
        Me.Label4.Text = "Médico:"
        '
        'btn_atender
        '
        Me.btn_atender.Location = New System.Drawing.Point(282, 304)
        Me.btn_atender.Name = "btn_atender"
        Me.btn_atender.Size = New System.Drawing.Size(555, 37)
        Me.btn_atender.TabIndex = 25
        Me.btn_atender.Text = "Atender Próximo Paciente"
        Me.btn_atender.UseVisualStyleBackColor = True
        '
        'list_fila
        '
        Me.list_fila.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.column_nome, Me.column_cpf, Me.column_nasc, Me.column_idade, Me.column_plano, Me.column_medico, Me.column_tipo})
        Me.list_fila.FullRowSelect = True
        Me.list_fila.GridLines = True
        Me.list_fila.HideSelection = False
        Me.list_fila.Location = New System.Drawing.Point(282, 15)
        Me.list_fila.MultiSelect = False
        Me.list_fila.Name = "list_fila"
        Me.list_fila.Size = New System.Drawing.Size(555, 283)
        Me.list_fila.TabIndex = 24
        Me.list_fila.UseCompatibleStateImageBehavior = False
        Me.list_fila.View = System.Windows.Forms.View.Details
        '
        'column_nome
        '
        Me.column_nome.Text = "Nome"
        '
        'column_cpf
        '
        Me.column_cpf.Text = "CPF"
        '
        'column_nasc
        '
        Me.column_nasc.Text = "Nascimento"
        '
        'column_idade
        '
        Me.column_idade.Text = "Idade"
        '
        'column_plano
        '
        Me.column_plano.Text = "Plano"
        '
        'column_medico
        '
        Me.column_medico.Text = "Médico"
        '
        'column_tipo
        '
        Me.column_tipo.Text = "Atendimento"
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(145, 304)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(120, 37)
        Me.btn_cancelar.TabIndex = 23
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_cadastrar
        '
        Me.btn_cadastrar.Location = New System.Drawing.Point(15, 304)
        Me.btn_cadastrar.Name = "btn_cadastrar"
        Me.btn_cadastrar.Size = New System.Drawing.Size(120, 37)
        Me.btn_cadastrar.TabIndex = 22
        Me.btn_cadastrar.Text = "Cadastrar"
        Me.btn_cadastrar.UseVisualStyleBackColor = True
        '
        'txt_cpf
        '
        Me.txt_cpf.Location = New System.Drawing.Point(84, 48)
        Me.txt_cpf.Name = "txt_cpf"
        Me.txt_cpf.Size = New System.Drawing.Size(181, 20)
        Me.txt_cpf.TabIndex = 21
        Me.txt_cpf.Tag = "obrigatório"
        '
        'txt_nome
        '
        Me.txt_nome.Location = New System.Drawing.Point(84, 15)
        Me.txt_nome.Name = "txt_nome"
        Me.txt_nome.Size = New System.Drawing.Size(181, 20)
        Me.txt_nome.TabIndex = 20
        Me.txt_nome.Tag = "obrigatório"
        '
        'date_nascimento
        '
        Me.date_nascimento.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.date_nascimento.Location = New System.Drawing.Point(84, 79)
        Me.date_nascimento.Name = "date_nascimento"
        Me.date_nascimento.Size = New System.Drawing.Size(181, 20)
        Me.date_nascimento.TabIndex = 19
        Me.date_nascimento.Tag = "obrigatório"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.rbt_urgente)
        Me.GroupBox2.Controls.Add(Me.rbt_normal)
        Me.GroupBox2.Location = New System.Drawing.Point(15, 247)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(250, 51)
        Me.GroupBox2.TabIndex = 18
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Atendimento:"
        '
        'rbt_urgente
        '
        Me.rbt_urgente.AutoSize = True
        Me.rbt_urgente.Location = New System.Drawing.Point(126, 19)
        Me.rbt_urgente.Name = "rbt_urgente"
        Me.rbt_urgente.Size = New System.Drawing.Size(63, 17)
        Me.rbt_urgente.TabIndex = 1
        Me.rbt_urgente.Text = "Urgente"
        Me.rbt_urgente.UseVisualStyleBackColor = True
        '
        'rbt_normal
        '
        Me.rbt_normal.AutoSize = True
        Me.rbt_normal.Checked = True
        Me.rbt_normal.Location = New System.Drawing.Point(62, 19)
        Me.rbt_normal.Name = "rbt_normal"
        Me.rbt_normal.Size = New System.Drawing.Size(58, 17)
        Me.rbt_normal.TabIndex = 0
        Me.rbt_normal.TabStop = True
        Me.rbt_normal.Text = "Normal"
        Me.rbt_normal.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.rbt_planoC)
        Me.GroupBox1.Controls.Add(Me.rbt_planoB)
        Me.GroupBox1.Controls.Add(Me.rbt_planoA)
        Me.GroupBox1.Location = New System.Drawing.Point(15, 117)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(250, 93)
        Me.GroupBox1.TabIndex = 17
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Planos de Saúde:"
        '
        'rbt_planoC
        '
        Me.rbt_planoC.AutoSize = True
        Me.rbt_planoC.Location = New System.Drawing.Point(6, 65)
        Me.rbt_planoC.Name = "rbt_planoC"
        Me.rbt_planoC.Size = New System.Drawing.Size(139, 17)
        Me.rbt_planoC.TabIndex = 2
        Me.rbt_planoC.Text = "Convênio João de Deus"
        Me.rbt_planoC.UseVisualStyleBackColor = True
        '
        'rbt_planoB
        '
        Me.rbt_planoB.AutoSize = True
        Me.rbt_planoB.Location = New System.Drawing.Point(6, 42)
        Me.rbt_planoB.Name = "rbt_planoB"
        Me.rbt_planoB.Size = New System.Drawing.Size(78, 17)
        Me.rbt_planoB.TabIndex = 1
        Me.rbt_planoB.Text = "Top Saúde"
        Me.rbt_planoB.UseVisualStyleBackColor = True
        '
        'rbt_planoA
        '
        Me.rbt_planoA.AutoSize = True
        Me.rbt_planoA.Checked = True
        Me.rbt_planoA.Location = New System.Drawing.Point(6, 19)
        Me.rbt_planoA.Name = "rbt_planoA"
        Me.rbt_planoA.Size = New System.Drawing.Size(116, 17)
        Me.rbt_planoA.TabIndex = 0
        Me.rbt_planoA.TabStop = True
        Me.rbt_planoA.Text = "Health On Demand"
        Me.rbt_planoA.UseVisualStyleBackColor = True
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 81)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(66, 13)
        Me.Label3.TabIndex = 16
        Me.Label3.Text = "Nascimento:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 51)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(30, 13)
        Me.Label2.TabIndex = 15
        Me.Label2.Text = "CPF:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 18)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(38, 13)
        Me.Label1.TabIndex = 14
        Me.Label1.Text = "Nome:"
        '
        'FormPrincipal
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ActiveBorder
        Me.ClientSize = New System.Drawing.Size(849, 356)
        Me.Controls.Add(Me.cbx_medico)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.btn_atender)
        Me.Controls.Add(Me.list_fila)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_cadastrar)
        Me.Controls.Add(Me.txt_cpf)
        Me.Controls.Add(Me.txt_nome)
        Me.Controls.Add(Me.date_nascimento)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "FormPrincipal"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "CONTROLE DE PACIENTES"
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents cbx_medico As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents btn_atender As System.Windows.Forms.Button
    Friend WithEvents list_fila As System.Windows.Forms.ListView
    Friend WithEvents column_nome As System.Windows.Forms.ColumnHeader
    Friend WithEvents column_cpf As System.Windows.Forms.ColumnHeader
    Friend WithEvents column_idade As System.Windows.Forms.ColumnHeader
    Friend WithEvents column_plano As System.Windows.Forms.ColumnHeader
    Friend WithEvents column_medico As System.Windows.Forms.ColumnHeader
    Friend WithEvents btn_cancelar As System.Windows.Forms.Button
    Friend WithEvents btn_cadastrar As System.Windows.Forms.Button
    Friend WithEvents txt_cpf As System.Windows.Forms.TextBox
    Friend WithEvents txt_nome As System.Windows.Forms.TextBox
    Friend WithEvents date_nascimento As System.Windows.Forms.DateTimePicker
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents rbt_urgente As System.Windows.Forms.RadioButton
    Friend WithEvents rbt_normal As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents rbt_planoC As System.Windows.Forms.RadioButton
    Friend WithEvents rbt_planoB As System.Windows.Forms.RadioButton
    Friend WithEvents rbt_planoA As System.Windows.Forms.RadioButton
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents column_tipo As System.Windows.Forms.ColumnHeader
    Friend WithEvents column_nasc As System.Windows.Forms.ColumnHeader
End Class
