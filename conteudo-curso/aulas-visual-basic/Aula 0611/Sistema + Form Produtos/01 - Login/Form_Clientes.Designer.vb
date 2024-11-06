<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form_Clientes
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.list_clientes = New System.Windows.Forms.ListView()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.gbox_sexo = New System.Windows.Forms.GroupBox()
        Me.rbt_masculino = New System.Windows.Forms.RadioButton()
        Me.rbt_feminino = New System.Windows.Forms.RadioButton()
        Me.date_nascimento = New System.Windows.Forms.DateTimePicker()
        Me.txt_nome = New System.Windows.Forms.TextBox()
        Me.btn_novo = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_alterar = New System.Windows.Forms.Button()
        Me.btn_excluir = New System.Windows.Forms.Button()
        Me.btn_salvar = New System.Windows.Forms.Button()
        Me.btn_fechar = New System.Windows.Forms.Button()
        Me.label_total = New System.Windows.Forms.Label()
        Me.txt_cpf = New System.Windows.Forms.TextBox()
        Me.gbox_sexo.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(19, 19)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(21, 13)
        Me.Label1.TabIndex = 14
        Me.Label1.Text = "ID:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(19, 58)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(38, 13)
        Me.Label2.TabIndex = 15
        Me.Label2.Text = "Nome:"
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(89, 12)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.Size = New System.Drawing.Size(100, 20)
        Me.txt_id.TabIndex = 0
        Me.txt_id.Tag = "obrigatório"
        '
        'list_clientes
        '
        Me.list_clientes.Location = New System.Drawing.Point(301, 12)
        Me.list_clientes.Name = "list_clientes"
        Me.list_clientes.Size = New System.Drawing.Size(507, 262)
        Me.list_clientes.TabIndex = 13
        Me.list_clientes.UseCompatibleStateImageBehavior = False
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(19, 97)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(30, 13)
        Me.Label3.TabIndex = 16
        Me.Label3.Text = "CPF:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(19, 136)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(66, 13)
        Me.Label4.TabIndex = 17
        Me.Label4.Text = "Nascimento:"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(19, 193)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(0, 13)
        Me.Label5.TabIndex = 8
        '
        'gbox_sexo
        '
        Me.gbox_sexo.Controls.Add(Me.rbt_masculino)
        Me.gbox_sexo.Controls.Add(Me.rbt_feminino)
        Me.gbox_sexo.Location = New System.Drawing.Point(22, 176)
        Me.gbox_sexo.Name = "gbox_sexo"
        Me.gbox_sexo.Size = New System.Drawing.Size(245, 55)
        Me.gbox_sexo.TabIndex = 18
        Me.gbox_sexo.TabStop = False
        Me.gbox_sexo.Text = "Sexo:"
        '
        'rbt_masculino
        '
        Me.rbt_masculino.AutoSize = True
        Me.rbt_masculino.Location = New System.Drawing.Point(117, 19)
        Me.rbt_masculino.Name = "rbt_masculino"
        Me.rbt_masculino.Size = New System.Drawing.Size(73, 17)
        Me.rbt_masculino.TabIndex = 5
        Me.rbt_masculino.TabStop = True
        Me.rbt_masculino.Tag = "M"
        Me.rbt_masculino.Text = "Masculino"
        Me.rbt_masculino.UseVisualStyleBackColor = True
        '
        'rbt_feminino
        '
        Me.rbt_feminino.AutoSize = True
        Me.rbt_feminino.Location = New System.Drawing.Point(44, 19)
        Me.rbt_feminino.Name = "rbt_feminino"
        Me.rbt_feminino.Size = New System.Drawing.Size(67, 17)
        Me.rbt_feminino.TabIndex = 4
        Me.rbt_feminino.TabStop = True
        Me.rbt_feminino.Tag = "F"
        Me.rbt_feminino.Text = "Feminino"
        Me.rbt_feminino.UseVisualStyleBackColor = True
        '
        'date_nascimento
        '
        Me.date_nascimento.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.date_nascimento.Location = New System.Drawing.Point(89, 129)
        Me.date_nascimento.Name = "date_nascimento"
        Me.date_nascimento.Size = New System.Drawing.Size(178, 20)
        Me.date_nascimento.TabIndex = 3
        Me.date_nascimento.Tag = "obrigatório"
        '
        'txt_nome
        '
        Me.txt_nome.Location = New System.Drawing.Point(89, 51)
        Me.txt_nome.Name = "txt_nome"
        Me.txt_nome.Size = New System.Drawing.Size(178, 20)
        Me.txt_nome.TabIndex = 1
        Me.txt_nome.Tag = "obrigatório"
        '
        'btn_novo
        '
        Me.btn_novo.Location = New System.Drawing.Point(22, 248)
        Me.btn_novo.Name = "btn_novo"
        Me.btn_novo.Size = New System.Drawing.Size(75, 26)
        Me.btn_novo.TabIndex = 7
        Me.btn_novo.Text = "Novo"
        Me.btn_novo.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(107, 248)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(75, 26)
        Me.btn_cancelar.TabIndex = 8
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_alterar
        '
        Me.btn_alterar.Location = New System.Drawing.Point(192, 248)
        Me.btn_alterar.Name = "btn_alterar"
        Me.btn_alterar.Size = New System.Drawing.Size(75, 26)
        Me.btn_alterar.TabIndex = 9
        Me.btn_alterar.Text = "Alterar"
        Me.btn_alterar.UseVisualStyleBackColor = True
        '
        'btn_excluir
        '
        Me.btn_excluir.Location = New System.Drawing.Point(22, 280)
        Me.btn_excluir.Name = "btn_excluir"
        Me.btn_excluir.Size = New System.Drawing.Size(75, 26)
        Me.btn_excluir.TabIndex = 10
        Me.btn_excluir.Text = "Excluir"
        Me.btn_excluir.UseVisualStyleBackColor = True
        '
        'btn_salvar
        '
        Me.btn_salvar.Location = New System.Drawing.Point(107, 280)
        Me.btn_salvar.Name = "btn_salvar"
        Me.btn_salvar.Size = New System.Drawing.Size(75, 26)
        Me.btn_salvar.TabIndex = 11
        Me.btn_salvar.Text = "Salvar"
        Me.btn_salvar.UseVisualStyleBackColor = True
        '
        'btn_fechar
        '
        Me.btn_fechar.Location = New System.Drawing.Point(192, 280)
        Me.btn_fechar.Name = "btn_fechar"
        Me.btn_fechar.Size = New System.Drawing.Size(75, 26)
        Me.btn_fechar.TabIndex = 12
        Me.btn_fechar.Text = "Fechar"
        Me.btn_fechar.UseVisualStyleBackColor = True
        '
        'label_total
        '
        Me.label_total.Location = New System.Drawing.Point(667, 287)
        Me.label_total.Name = "label_total"
        Me.label_total.Size = New System.Drawing.Size(141, 13)
        Me.label_total.TabIndex = 20
        Me.label_total.Text = "Total: 0"
        Me.label_total.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'txt_cpf
        '
        Me.txt_cpf.Location = New System.Drawing.Point(89, 90)
        Me.txt_cpf.Name = "txt_cpf"
        Me.txt_cpf.Size = New System.Drawing.Size(100, 20)
        Me.txt_cpf.TabIndex = 0
        '
        'Form_Clientes
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(820, 322)
        Me.Controls.Add(Me.txt_cpf)
        Me.Controls.Add(Me.label_total)
        Me.Controls.Add(Me.btn_fechar)
        Me.Controls.Add(Me.btn_salvar)
        Me.Controls.Add(Me.btn_excluir)
        Me.Controls.Add(Me.btn_alterar)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_novo)
        Me.Controls.Add(Me.txt_nome)
        Me.Controls.Add(Me.date_nascimento)
        Me.Controls.Add(Me.gbox_sexo)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.list_clientes)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form_Clientes"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Clientes"
        Me.gbox_sexo.ResumeLayout(False)
        Me.gbox_sexo.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txt_id As System.Windows.Forms.TextBox
    Friend WithEvents list_clientes As System.Windows.Forms.ListView
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents gbox_sexo As System.Windows.Forms.GroupBox
    Friend WithEvents rbt_masculino As System.Windows.Forms.RadioButton
    Friend WithEvents rbt_feminino As System.Windows.Forms.RadioButton
    Friend WithEvents date_nascimento As System.Windows.Forms.DateTimePicker
    Friend WithEvents txt_nome As System.Windows.Forms.TextBox
    Friend WithEvents btn_novo As System.Windows.Forms.Button
    Friend WithEvents btn_cancelar As System.Windows.Forms.Button
    Friend WithEvents btn_alterar As System.Windows.Forms.Button
    Friend WithEvents btn_excluir As System.Windows.Forms.Button
    Friend WithEvents btn_salvar As System.Windows.Forms.Button
    Friend WithEvents btn_fechar As System.Windows.Forms.Button
    Friend WithEvents label_total As System.Windows.Forms.Label
    Friend WithEvents txt_cpf As System.Windows.Forms.TextBox
End Class
