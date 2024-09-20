<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form_Cliente
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.txt_nome = New System.Windows.Forms.TextBox()
        Me.txt_cpf = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.date_nascimento = New System.Windows.Forms.DateTimePicker()
        Me.rbt_feminino = New System.Windows.Forms.RadioButton()
        Me.rbt_masculino = New System.Windows.Forms.RadioButton()
        Me.group_sexo = New System.Windows.Forms.GroupBox()
        Me.cbx_plano = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btn_novo = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_alterar = New System.Windows.Forms.Button()
        Me.btn_excluir = New System.Windows.Forms.Button()
        Me.btn_salvar = New System.Windows.Forms.Button()
        Me.btn_fechar = New System.Windows.Forms.Button()
        Me.list_clientes = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader2 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader3 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader4 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader5 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader6 = New System.Windows.Forms.ColumnHeader()
        Me.ColumnHeader7 = New System.Windows.Forms.ColumnHeader()
        Me.label_total = New System.Windows.Forms.Label()
        Me.group_sexo.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(35, 31)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(21, 15)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "ID:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(35, 86)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(43, 15)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Nome:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(35, 138)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(31, 15)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "CPF:"
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(117, 28)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.Size = New System.Drawing.Size(100, 23)
        Me.txt_id.TabIndex = 3
        '
        'txt_nome
        '
        Me.txt_nome.Location = New System.Drawing.Point(117, 83)
        Me.txt_nome.Name = "txt_nome"
        Me.txt_nome.Size = New System.Drawing.Size(198, 23)
        Me.txt_nome.TabIndex = 4
        '
        'txt_cpf
        '
        Me.txt_cpf.Location = New System.Drawing.Point(117, 135)
        Me.txt_cpf.Name = "txt_cpf"
        Me.txt_cpf.Size = New System.Drawing.Size(100, 23)
        Me.txt_cpf.TabIndex = 5
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(37, 200)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(74, 15)
        Me.Label4.TabIndex = 6
        Me.Label4.Text = "Nascimento:"
        '
        'date_nascimento
        '
        Me.date_nascimento.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.date_nascimento.Location = New System.Drawing.Point(117, 194)
        Me.date_nascimento.Name = "date_nascimento"
        Me.date_nascimento.Size = New System.Drawing.Size(198, 23)
        Me.date_nascimento.TabIndex = 7
        '
        'rbt_feminino
        '
        Me.rbt_feminino.AutoSize = True
        Me.rbt_feminino.Location = New System.Drawing.Point(48, 22)
        Me.rbt_feminino.Name = "rbt_feminino"
        Me.rbt_feminino.Size = New System.Drawing.Size(75, 19)
        Me.rbt_feminino.TabIndex = 8
        Me.rbt_feminino.TabStop = True
        Me.rbt_feminino.Text = "Feminino"
        Me.rbt_feminino.UseVisualStyleBackColor = True
        '
        'rbt_masculino
        '
        Me.rbt_masculino.AutoSize = True
        Me.rbt_masculino.Location = New System.Drawing.Point(154, 22)
        Me.rbt_masculino.Name = "rbt_masculino"
        Me.rbt_masculino.Size = New System.Drawing.Size(80, 19)
        Me.rbt_masculino.TabIndex = 9
        Me.rbt_masculino.TabStop = True
        Me.rbt_masculino.Text = "Masculino"
        Me.rbt_masculino.UseVisualStyleBackColor = True
        '
        'group_sexo
        '
        Me.group_sexo.Controls.Add(Me.rbt_feminino)
        Me.group_sexo.Controls.Add(Me.rbt_masculino)
        Me.group_sexo.Location = New System.Drawing.Point(37, 246)
        Me.group_sexo.Name = "group_sexo"
        Me.group_sexo.Size = New System.Drawing.Size(278, 60)
        Me.group_sexo.TabIndex = 10
        Me.group_sexo.TabStop = False
        Me.group_sexo.Text = "Sexo:"
        '
        'cbx_plano
        '
        Me.cbx_plano.FormattingEnabled = True
        Me.cbx_plano.Location = New System.Drawing.Point(117, 337)
        Me.cbx_plano.Name = "cbx_plano"
        Me.cbx_plano.Size = New System.Drawing.Size(198, 23)
        Me.cbx_plano.TabIndex = 11
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(37, 340)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(40, 15)
        Me.Label5.TabIndex = 12
        Me.Label5.Text = "Plano:"
        '
        'btn_novo
        '
        Me.btn_novo.Location = New System.Drawing.Point(37, 386)
        Me.btn_novo.Name = "btn_novo"
        Me.btn_novo.Size = New System.Drawing.Size(75, 23)
        Me.btn_novo.TabIndex = 13
        Me.btn_novo.Text = "Novo"
        Me.btn_novo.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(138, 386)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(75, 23)
        Me.btn_cancelar.TabIndex = 14
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_alterar
        '
        Me.btn_alterar.Location = New System.Drawing.Point(240, 386)
        Me.btn_alterar.Name = "btn_alterar"
        Me.btn_alterar.Size = New System.Drawing.Size(75, 23)
        Me.btn_alterar.TabIndex = 15
        Me.btn_alterar.Text = "Alterar"
        Me.btn_alterar.UseVisualStyleBackColor = True
        '
        'btn_excluir
        '
        Me.btn_excluir.Location = New System.Drawing.Point(37, 415)
        Me.btn_excluir.Name = "btn_excluir"
        Me.btn_excluir.Size = New System.Drawing.Size(75, 23)
        Me.btn_excluir.TabIndex = 16
        Me.btn_excluir.Text = "Excluir"
        Me.btn_excluir.UseVisualStyleBackColor = True
        '
        'btn_salvar
        '
        Me.btn_salvar.Location = New System.Drawing.Point(138, 415)
        Me.btn_salvar.Name = "btn_salvar"
        Me.btn_salvar.Size = New System.Drawing.Size(75, 23)
        Me.btn_salvar.TabIndex = 17
        Me.btn_salvar.Text = "Salvar"
        Me.btn_salvar.UseVisualStyleBackColor = True
        '
        'btn_fechar
        '
        Me.btn_fechar.Location = New System.Drawing.Point(240, 415)
        Me.btn_fechar.Name = "btn_fechar"
        Me.btn_fechar.Size = New System.Drawing.Size(75, 23)
        Me.btn_fechar.TabIndex = 18
        Me.btn_fechar.Text = "Fechar"
        Me.btn_fechar.UseVisualStyleBackColor = True
        '
        'list_clientes
        '
        Me.list_clientes.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5, Me.ColumnHeader6, Me.ColumnHeader7})
        Me.list_clientes.FullRowSelect = True
        Me.list_clientes.GridLines = True
        Me.list_clientes.Location = New System.Drawing.Point(334, 28)
        Me.list_clientes.MultiSelect = False
        Me.list_clientes.Name = "list_clientes"
        Me.list_clientes.Size = New System.Drawing.Size(517, 381)
        Me.list_clientes.TabIndex = 19
        Me.list_clientes.UseCompatibleStateImageBehavior = False
        Me.list_clientes.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "ID"
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Nome"
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "CPF"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Nascimento"
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Idade"
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Sexo"
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Plano"
        '
        'label_total
        '
        Me.label_total.Location = New System.Drawing.Point(643, 419)
        Me.label_total.Name = "label_total"
        Me.label_total.Size = New System.Drawing.Size(208, 19)
        Me.label_total.TabIndex = 20
        Me.label_total.Text = "Total: 0"
        Me.label_total.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'Form_Cliente
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(863, 465)
        Me.ControlBox = False
        Me.Controls.Add(Me.label_total)
        Me.Controls.Add(Me.list_clientes)
        Me.Controls.Add(Me.btn_fechar)
        Me.Controls.Add(Me.btn_salvar)
        Me.Controls.Add(Me.btn_excluir)
        Me.Controls.Add(Me.btn_alterar)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_novo)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.cbx_plano)
        Me.Controls.Add(Me.group_sexo)
        Me.Controls.Add(Me.date_nascimento)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.txt_cpf)
        Me.Controls.Add(Me.txt_nome)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "Form_Cliente"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Cadastro de Clientes"
        Me.group_sexo.ResumeLayout(False)
        Me.group_sexo.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents txt_id As TextBox
    Friend WithEvents txt_nome As TextBox
    Friend WithEvents txt_cpf As TextBox
    Friend WithEvents Label4 As Label
    Friend WithEvents date_nascimento As DateTimePicker
    Friend WithEvents rbt_feminino As RadioButton
    Friend WithEvents rbt_masculino As RadioButton
    Friend WithEvents group_sexo As GroupBox
    Friend WithEvents cbx_plano As ComboBox
    Friend WithEvents Label5 As Label
    Friend WithEvents btn_novo As Button
    Friend WithEvents btn_cancelar As Button
    Friend WithEvents btn_alterar As Button
    Friend WithEvents btn_excluir As Button
    Friend WithEvents btn_salvar As Button
    Friend WithEvents btn_fechar As Button
    Friend WithEvents list_clientes As ListView
    Friend WithEvents ColumnHeader1 As ColumnHeader
    Friend WithEvents ColumnHeader2 As ColumnHeader
    Friend WithEvents ColumnHeader3 As ColumnHeader
    Friend WithEvents ColumnHeader4 As ColumnHeader
    Friend WithEvents ColumnHeader5 As ColumnHeader
    Friend WithEvents ColumnHeader6 As ColumnHeader
    Friend WithEvents ColumnHeader7 As ColumnHeader
    Friend WithEvents label_total As Label
End Class
