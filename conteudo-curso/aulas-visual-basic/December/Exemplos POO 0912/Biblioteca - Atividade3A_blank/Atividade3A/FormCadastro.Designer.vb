<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormCadastro
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
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txt_titulo = New System.Windows.Forms.TextBox()
        Me.txt_autor = New System.Windows.Forms.TextBox()
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.txt_ano = New System.Windows.Forms.TextBox()
        Me.group_disponivel = New System.Windows.Forms.GroupBox()
        Me.rbt_nao = New System.Windows.Forms.RadioButton()
        Me.rbt_sim = New System.Windows.Forms.RadioButton()
        Me.list_livros = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.btn_novo = New System.Windows.Forms.Button()
        Me.btn_alterar = New System.Windows.Forms.Button()
        Me.btn_remover = New System.Windows.Forms.Button()
        Me.btn_salvar = New System.Windows.Forms.Button()
        Me.label_total = New System.Windows.Forms.Label()
        Me.group_disponivel.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 22)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(21, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "ID:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 59)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(38, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Título:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 96)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(29, 13)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Ano:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 133)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(35, 13)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "Autor:"
        '
        'txt_titulo
        '
        Me.txt_titulo.Location = New System.Drawing.Point(56, 56)
        Me.txt_titulo.Name = "txt_titulo"
        Me.txt_titulo.Size = New System.Drawing.Size(170, 20)
        Me.txt_titulo.TabIndex = 4
        Me.txt_titulo.Tag = "obrigatório"
        '
        'txt_autor
        '
        Me.txt_autor.Location = New System.Drawing.Point(56, 130)
        Me.txt_autor.Name = "txt_autor"
        Me.txt_autor.Size = New System.Drawing.Size(170, 20)
        Me.txt_autor.TabIndex = 5
        Me.txt_autor.Tag = "obrigatório"
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(56, 19)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.ReadOnly = True
        Me.txt_id.Size = New System.Drawing.Size(100, 20)
        Me.txt_id.TabIndex = 6
        Me.txt_id.Tag = "obrigatório"
        '
        'txt_ano
        '
        Me.txt_ano.Location = New System.Drawing.Point(56, 93)
        Me.txt_ano.Name = "txt_ano"
        Me.txt_ano.Size = New System.Drawing.Size(100, 20)
        Me.txt_ano.TabIndex = 7
        Me.txt_ano.Tag = "obrigatório"
        '
        'group_disponivel
        '
        Me.group_disponivel.Controls.Add(Me.rbt_nao)
        Me.group_disponivel.Controls.Add(Me.rbt_sim)
        Me.group_disponivel.Location = New System.Drawing.Point(15, 168)
        Me.group_disponivel.Name = "group_disponivel"
        Me.group_disponivel.Size = New System.Drawing.Size(211, 65)
        Me.group_disponivel.TabIndex = 8
        Me.group_disponivel.TabStop = False
        Me.group_disponivel.Text = "Disponível?"
        '
        'rbt_nao
        '
        Me.rbt_nao.AutoSize = True
        Me.rbt_nao.Location = New System.Drawing.Point(124, 27)
        Me.rbt_nao.Name = "rbt_nao"
        Me.rbt_nao.Size = New System.Drawing.Size(45, 17)
        Me.rbt_nao.TabIndex = 1
        Me.rbt_nao.TabStop = True
        Me.rbt_nao.Text = "Não"
        Me.rbt_nao.UseVisualStyleBackColor = True
        '
        'rbt_sim
        '
        Me.rbt_sim.AutoSize = True
        Me.rbt_sim.Checked = True
        Me.rbt_sim.Location = New System.Drawing.Point(41, 27)
        Me.rbt_sim.Name = "rbt_sim"
        Me.rbt_sim.Size = New System.Drawing.Size(42, 17)
        Me.rbt_sim.TabIndex = 0
        Me.rbt_sim.TabStop = True
        Me.rbt_sim.Text = "Sim"
        Me.rbt_sim.UseVisualStyleBackColor = True
        '
        'list_livros
        '
        Me.list_livros.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5})
        Me.list_livros.FullRowSelect = True
        Me.list_livros.GridLines = True
        Me.list_livros.Location = New System.Drawing.Point(244, 12)
        Me.list_livros.MultiSelect = False
        Me.list_livros.Name = "list_livros"
        Me.list_livros.Size = New System.Drawing.Size(451, 259)
        Me.list_livros.TabIndex = 9
        Me.list_livros.UseCompatibleStateImageBehavior = False
        Me.list_livros.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "ID"
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Título"
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Ano"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Autor"
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Disponível"
        '
        'btn_novo
        '
        Me.btn_novo.Location = New System.Drawing.Point(15, 248)
        Me.btn_novo.Name = "btn_novo"
        Me.btn_novo.Size = New System.Drawing.Size(102, 23)
        Me.btn_novo.TabIndex = 10
        Me.btn_novo.Text = "Novo"
        Me.btn_novo.UseVisualStyleBackColor = True
        '
        'btn_alterar
        '
        Me.btn_alterar.Location = New System.Drawing.Point(124, 248)
        Me.btn_alterar.Name = "btn_alterar"
        Me.btn_alterar.Size = New System.Drawing.Size(102, 23)
        Me.btn_alterar.TabIndex = 11
        Me.btn_alterar.Text = "Alterar"
        Me.btn_alterar.UseVisualStyleBackColor = True
        '
        'btn_remover
        '
        Me.btn_remover.Location = New System.Drawing.Point(15, 277)
        Me.btn_remover.Name = "btn_remover"
        Me.btn_remover.Size = New System.Drawing.Size(102, 23)
        Me.btn_remover.TabIndex = 12
        Me.btn_remover.Text = "Remover"
        Me.btn_remover.UseVisualStyleBackColor = True
        '
        'btn_salvar
        '
        Me.btn_salvar.Location = New System.Drawing.Point(124, 277)
        Me.btn_salvar.Name = "btn_salvar"
        Me.btn_salvar.Size = New System.Drawing.Size(102, 23)
        Me.btn_salvar.TabIndex = 13
        Me.btn_salvar.Text = "Salvar"
        Me.btn_salvar.UseVisualStyleBackColor = True
        '
        'label_total
        '
        Me.label_total.Location = New System.Drawing.Point(595, 277)
        Me.label_total.Name = "label_total"
        Me.label_total.Size = New System.Drawing.Size(100, 23)
        Me.label_total.TabIndex = 14
        Me.label_total.Text = "Total: 0"
        Me.label_total.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'FormCadastro
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(711, 313)
        Me.Controls.Add(Me.label_total)
        Me.Controls.Add(Me.btn_salvar)
        Me.Controls.Add(Me.btn_remover)
        Me.Controls.Add(Me.btn_alterar)
        Me.Controls.Add(Me.btn_novo)
        Me.Controls.Add(Me.list_livros)
        Me.Controls.Add(Me.group_disponivel)
        Me.Controls.Add(Me.txt_ano)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.txt_autor)
        Me.Controls.Add(Me.txt_titulo)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FormCadastro"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Biblioteca Municipal Leitura Viva"
        Me.group_disponivel.ResumeLayout(False)
        Me.group_disponivel.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents txt_titulo As System.Windows.Forms.TextBox
    Friend WithEvents txt_autor As System.Windows.Forms.TextBox
    Friend WithEvents txt_id As System.Windows.Forms.TextBox
    Friend WithEvents txt_ano As System.Windows.Forms.TextBox
    Friend WithEvents group_disponivel As System.Windows.Forms.GroupBox
    Friend WithEvents rbt_nao As System.Windows.Forms.RadioButton
    Friend WithEvents rbt_sim As System.Windows.Forms.RadioButton
    Friend WithEvents list_livros As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents btn_novo As System.Windows.Forms.Button
    Friend WithEvents btn_alterar As System.Windows.Forms.Button
    Friend WithEvents btn_remover As System.Windows.Forms.Button
    Friend WithEvents btn_salvar As System.Windows.Forms.Button
    Friend WithEvents label_total As System.Windows.Forms.Label

End Class
