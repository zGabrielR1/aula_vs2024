<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.lbl_titulo = New System.Windows.Forms.Label()
        Me.lbl_ano = New System.Windows.Forms.Label()
        Me.lbl_autor = New System.Windows.Forms.Label()
        Me.rbt_sim = New System.Windows.Forms.RadioButton()
        Me.rbt_nao = New System.Windows.Forms.RadioButton()
        Me.group_disponivel = New System.Windows.Forms.GroupBox()
        Me.list_livros = New System.Windows.Forms.ListView()
        Me.clh_titulo = New System.Windows.Forms.ColumnHeader()
        Me.clh_ano = New System.Windows.Forms.ColumnHeader()
        Me.clh_autor = New System.Windows.Forms.ColumnHeader()
        Me.clh_disponivel = New System.Windows.Forms.ColumnHeader()
        Me.txt_title = New System.Windows.Forms.TextBox()
        Me.txt_Year = New System.Windows.Forms.TextBox()
        Me.txt_author = New System.Windows.Forms.TextBox()
        Me.btn_cadastrar = New System.Windows.Forms.Button()
        Me.group_disponivel.SuspendLayout()
        Me.SuspendLayout()
        '
        'lbl_titulo
        '
        Me.lbl_titulo.AutoSize = True
        Me.lbl_titulo.Location = New System.Drawing.Point(18, 28)
        Me.lbl_titulo.Name = "lbl_titulo"
        Me.lbl_titulo.Size = New System.Drawing.Size(40, 15)
        Me.lbl_titulo.TabIndex = 0
        Me.lbl_titulo.Text = "Título:"
        '
        'lbl_ano
        '
        Me.lbl_ano.AutoSize = True
        Me.lbl_ano.Location = New System.Drawing.Point(18, 77)
        Me.lbl_ano.Name = "lbl_ano"
        Me.lbl_ano.Size = New System.Drawing.Size(32, 15)
        Me.lbl_ano.TabIndex = 1
        Me.lbl_ano.Text = "Ano:"
        '
        'lbl_autor
        '
        Me.lbl_autor.AutoSize = True
        Me.lbl_autor.Location = New System.Drawing.Point(18, 142)
        Me.lbl_autor.Name = "lbl_autor"
        Me.lbl_autor.Size = New System.Drawing.Size(40, 15)
        Me.lbl_autor.TabIndex = 2
        Me.lbl_autor.Text = "Autor:"
        '
        'rbt_sim
        '
        Me.rbt_sim.AutoSize = True
        Me.rbt_sim.Location = New System.Drawing.Point(6, 40)
        Me.rbt_sim.Name = "rbt_sim"
        Me.rbt_sim.Size = New System.Drawing.Size(45, 19)
        Me.rbt_sim.TabIndex = 3
        Me.rbt_sim.TabStop = True
        Me.rbt_sim.Text = "Sim"
        Me.rbt_sim.UseVisualStyleBackColor = True
        '
        'rbt_nao
        '
        Me.rbt_nao.AutoSize = True
        Me.rbt_nao.Location = New System.Drawing.Point(103, 40)
        Me.rbt_nao.Name = "rbt_nao"
        Me.rbt_nao.Size = New System.Drawing.Size(47, 19)
        Me.rbt_nao.TabIndex = 4
        Me.rbt_nao.TabStop = True
        Me.rbt_nao.Text = "Não"
        Me.rbt_nao.UseVisualStyleBackColor = True
        '
        'group_disponivel
        '
        Me.group_disponivel.Controls.Add(Me.rbt_sim)
        Me.group_disponivel.Controls.Add(Me.rbt_nao)
        Me.group_disponivel.Location = New System.Drawing.Point(26, 222)
        Me.group_disponivel.Name = "group_disponivel"
        Me.group_disponivel.Size = New System.Drawing.Size(200, 100)
        Me.group_disponivel.TabIndex = 5
        Me.group_disponivel.TabStop = False
        Me.group_disponivel.Text = "Disponível?"
        '
        'list_livros
        '
        Me.list_livros.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.clh_titulo, Me.clh_ano, Me.clh_autor, Me.clh_disponivel})
        Me.list_livros.GridLines = True
        Me.list_livros.Location = New System.Drawing.Point(292, 28)
        Me.list_livros.Name = "list_livros"
        Me.list_livros.Size = New System.Drawing.Size(496, 383)
        Me.list_livros.TabIndex = 6
        Me.list_livros.UseCompatibleStateImageBehavior = False
        Me.list_livros.View = System.Windows.Forms.View.Details
        '
        'clh_titulo
        '
        Me.clh_titulo.Text = "Título"
        Me.clh_titulo.Width = 150
        '
        'clh_ano
        '
        Me.clh_ano.Text = "Ano"
        Me.clh_ano.Width = 100
        '
        'clh_autor
        '
        Me.clh_autor.Text = "Autor"
        Me.clh_autor.Width = 150
        '
        'clh_disponivel
        '
        Me.clh_disponivel.Text = "Disponível"
        Me.clh_disponivel.Width = 500
        '
        'txt_title
        '
        Me.txt_title.Location = New System.Drawing.Point(72, 28)
        Me.txt_title.Name = "txt_title"
        Me.txt_title.Size = New System.Drawing.Size(192, 23)
        Me.txt_title.TabIndex = 7
        '
        'txt_Year
        '
        Me.txt_Year.Location = New System.Drawing.Point(72, 77)
        Me.txt_Year.Name = "txt_Year"
        Me.txt_Year.Size = New System.Drawing.Size(192, 23)
        Me.txt_Year.TabIndex = 8
        '
        'txt_author
        '
        Me.txt_author.Location = New System.Drawing.Point(72, 142)
        Me.txt_author.Name = "txt_author"
        Me.txt_author.Size = New System.Drawing.Size(192, 23)
        Me.txt_author.TabIndex = 9
        '
        'btn_cadastrar
        '
        Me.btn_cadastrar.Location = New System.Drawing.Point(32, 357)
        Me.btn_cadastrar.Name = "btn_cadastrar"
        Me.btn_cadastrar.Size = New System.Drawing.Size(232, 23)
        Me.btn_cadastrar.TabIndex = 10
        Me.btn_cadastrar.Text = "Cadastrar"
        Me.btn_cadastrar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.btn_cadastrar)
        Me.Controls.Add(Me.txt_author)
        Me.Controls.Add(Me.txt_Year)
        Me.Controls.Add(Me.txt_title)
        Me.Controls.Add(Me.list_livros)
        Me.Controls.Add(Me.group_disponivel)
        Me.Controls.Add(Me.lbl_autor)
        Me.Controls.Add(Me.lbl_ano)
        Me.Controls.Add(Me.lbl_titulo)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.group_disponivel.ResumeLayout(False)
        Me.group_disponivel.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lbl_titulo As Label
    Friend WithEvents lbl_ano As Label
    Friend WithEvents lbl_autor As Label
    Friend WithEvents rbt_sim As RadioButton
    Friend WithEvents rbt_nao As RadioButton
    Friend WithEvents group_disponivel As GroupBox
    Friend WithEvents list_livros As ListView
    Friend WithEvents clh_titulo As ColumnHeader
    Friend WithEvents clh_ano As ColumnHeader
    Friend WithEvents clh_autor As ColumnHeader
    Friend WithEvents clh_disponivel As ColumnHeader
    Friend WithEvents txt_title As TextBox
    Friend WithEvents txt_Year As TextBox
    Friend WithEvents txt_author As TextBox
    Friend WithEvents btn_cadastrar As Button
End Class
