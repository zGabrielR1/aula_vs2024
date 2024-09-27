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
        Me.lbl_aluno = New System.Windows.Forms.Label()
        Me.lbl_curso = New System.Windows.Forms.Label()
        Me.lbl_disciplina = New System.Windows.Forms.Label()
        Me.listViewCursos = New System.Windows.Forms.ListView()
        Me.cheader_aluno = New System.Windows.Forms.ColumnHeader()
        Me.cheader_curso = New System.Windows.Forms.ColumnHeader()
        Me.cheader_disciplina = New System.Windows.Forms.ColumnHeader()
        Me.lbl_total_alunos = New System.Windows.Forms.Label()
        Me.btn_confirmar = New System.Windows.Forms.Button()
        Me.rbt_dev = New System.Windows.Forms.RadioButton()
        Me.rbt_eletrotecnica = New System.Windows.Forms.RadioButton()
        Me.rbt_mecanica = New System.Windows.Forms.RadioButton()
        Me.cbx_disciplina = New System.Windows.Forms.ComboBox()
        Me.txt_aluno = New System.Windows.Forms.TextBox()
        Me.btn_alterar = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lbl_aluno
        '
        Me.lbl_aluno.AutoSize = True
        Me.lbl_aluno.Location = New System.Drawing.Point(41, 47)
        Me.lbl_aluno.Name = "lbl_aluno"
        Me.lbl_aluno.Size = New System.Drawing.Size(45, 15)
        Me.lbl_aluno.TabIndex = 0
        Me.lbl_aluno.Text = "Aluno: "
        '
        'lbl_curso
        '
        Me.lbl_curso.AutoSize = True
        Me.lbl_curso.Location = New System.Drawing.Point(41, 123)
        Me.lbl_curso.Name = "lbl_curso"
        Me.lbl_curso.Size = New System.Drawing.Size(41, 15)
        Me.lbl_curso.TabIndex = 1
        Me.lbl_curso.Text = "Curso:"
        '
        'lbl_disciplina
        '
        Me.lbl_disciplina.AutoSize = True
        Me.lbl_disciplina.Location = New System.Drawing.Point(41, 267)
        Me.lbl_disciplina.Name = "lbl_disciplina"
        Me.lbl_disciplina.Size = New System.Drawing.Size(61, 15)
        Me.lbl_disciplina.TabIndex = 2
        Me.lbl_disciplina.Text = "Disciplina:"
        '
        'listViewCursos
        '
        Me.listViewCursos.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.cheader_aluno, Me.cheader_curso, Me.cheader_disciplina})
        Me.listViewCursos.Location = New System.Drawing.Point(398, 47)
        Me.listViewCursos.Name = "listViewCursos"
        Me.listViewCursos.Size = New System.Drawing.Size(333, 274)
        Me.listViewCursos.TabIndex = 3
        Me.listViewCursos.UseCompatibleStateImageBehavior = False
        Me.listViewCursos.View = System.Windows.Forms.View.Details
        '
        'cheader_aluno
        '
        Me.cheader_aluno.Text = "Aluno"
        Me.cheader_aluno.Width = 120
        '
        'cheader_curso
        '
        Me.cheader_curso.Text = "Curso"
        Me.cheader_curso.Width = 120
        '
        'cheader_disciplina
        '
        Me.cheader_disciplina.Text = "Disciplina"
        Me.cheader_disciplina.Width = 120
        '
        'lbl_total_alunos
        '
        Me.lbl_total_alunos.AutoSize = True
        Me.lbl_total_alunos.Location = New System.Drawing.Point(398, 343)
        Me.lbl_total_alunos.Name = "lbl_total_alunos"
        Me.lbl_total_alunos.Size = New System.Drawing.Size(75, 15)
        Me.lbl_total_alunos.TabIndex = 4
        Me.lbl_total_alunos.Text = "Total Alunos:"
        '
        'btn_confirmar
        '
        Me.btn_confirmar.Location = New System.Drawing.Point(51, 376)
        Me.btn_confirmar.Name = "btn_confirmar"
        Me.btn_confirmar.Size = New System.Drawing.Size(265, 47)
        Me.btn_confirmar.TabIndex = 5
        Me.btn_confirmar.Text = "Matricular"
        Me.btn_confirmar.UseVisualStyleBackColor = True
        '
        'rbt_dev
        '
        Me.rbt_dev.AutoSize = True
        Me.rbt_dev.Location = New System.Drawing.Point(122, 121)
        Me.rbt_dev.Name = "rbt_dev"
        Me.rbt_dev.Size = New System.Drawing.Size(97, 19)
        Me.rbt_dev.TabIndex = 6
        Me.rbt_dev.TabStop = True
        Me.rbt_dev.Text = "Dev. Sistemas"
        Me.rbt_dev.UseVisualStyleBackColor = True
        '
        'rbt_eletrotecnica
        '
        Me.rbt_eletrotecnica.AutoSize = True
        Me.rbt_eletrotecnica.Location = New System.Drawing.Point(122, 159)
        Me.rbt_eletrotecnica.Name = "rbt_eletrotecnica"
        Me.rbt_eletrotecnica.Size = New System.Drawing.Size(93, 19)
        Me.rbt_eletrotecnica.TabIndex = 7
        Me.rbt_eletrotecnica.TabStop = True
        Me.rbt_eletrotecnica.Text = "Eletrotécnica"
        Me.rbt_eletrotecnica.UseVisualStyleBackColor = True
        '
        'rbt_mecanica
        '
        Me.rbt_mecanica.AutoSize = True
        Me.rbt_mecanica.Location = New System.Drawing.Point(122, 195)
        Me.rbt_mecanica.Name = "rbt_mecanica"
        Me.rbt_mecanica.Size = New System.Drawing.Size(76, 19)
        Me.rbt_mecanica.TabIndex = 8
        Me.rbt_mecanica.TabStop = True
        Me.rbt_mecanica.Text = "Mecânica"
        Me.rbt_mecanica.UseVisualStyleBackColor = True
        '
        'cbx_disciplina
        '
        Me.cbx_disciplina.FormattingEnabled = True
        Me.cbx_disciplina.Location = New System.Drawing.Point(122, 267)
        Me.cbx_disciplina.Name = "cbx_disciplina"
        Me.cbx_disciplina.Size = New System.Drawing.Size(130, 23)
        Me.cbx_disciplina.TabIndex = 9
        '
        'txt_aluno
        '
        Me.txt_aluno.Location = New System.Drawing.Point(122, 47)
        Me.txt_aluno.Name = "txt_aluno"
        Me.txt_aluno.Size = New System.Drawing.Size(100, 23)
        Me.txt_aluno.TabIndex = 10
        '
        'btn_alterar
        '
        Me.btn_alterar.Location = New System.Drawing.Point(200, 324)
        Me.btn_alterar.Name = "btn_alterar"
        Me.btn_alterar.Size = New System.Drawing.Size(75, 23)
        Me.btn_alterar.TabIndex = 11
        Me.btn_alterar.Text = "Alterar"
        Me.btn_alterar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.btn_alterar)
        Me.Controls.Add(Me.txt_aluno)
        Me.Controls.Add(Me.cbx_disciplina)
        Me.Controls.Add(Me.rbt_mecanica)
        Me.Controls.Add(Me.rbt_eletrotecnica)
        Me.Controls.Add(Me.rbt_dev)
        Me.Controls.Add(Me.btn_confirmar)
        Me.Controls.Add(Me.lbl_total_alunos)
        Me.Controls.Add(Me.listViewCursos)
        Me.Controls.Add(Me.lbl_disciplina)
        Me.Controls.Add(Me.lbl_curso)
        Me.Controls.Add(Me.lbl_aluno)
        Me.Name = "Form1"
        Me.Text = "Escola Técnica Mundo das Profissões"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lbl_aluno As Label
    Friend WithEvents lbl_curso As Label
    Friend WithEvents lbl_disciplina As Label
    Friend WithEvents listViewCursos As ListView
    Friend WithEvents cheader_aluno As ColumnHeader
    Friend WithEvents cheader_curso As ColumnHeader
    Friend WithEvents cheader_disciplina As ColumnHeader
    Friend WithEvents lbl_total_alunos As Label
    Friend WithEvents btn_confirmar As Button
    Friend WithEvents rbt_dev As RadioButton
    Friend WithEvents rbt_eletrotecnica As RadioButton
    Friend WithEvents rbt_mecanica As RadioButton
    Friend WithEvents cbx_disciplina As ComboBox
    Friend WithEvents txt_aluno As TextBox
    Friend WithEvents btn_alterar As Button
End Class
