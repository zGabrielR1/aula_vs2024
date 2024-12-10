<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormProdutos
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
        Me.txt_preco = New System.Windows.Forms.TextBox()
        Me.label_total = New System.Windows.Forms.Label()
        Me.btn_fechar = New System.Windows.Forms.Button()
        Me.btn_salvar = New System.Windows.Forms.Button()
        Me.btn_excluir = New System.Windows.Forms.Button()
        Me.btn_alterar = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_novo = New System.Windows.Forms.Button()
        Me.txt_descricao = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.list_produtos = New System.Windows.Forms.ListView()
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txt_estoque = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'txt_preco
        '
        Me.txt_preco.Location = New System.Drawing.Point(89, 90)
        Me.txt_preco.Name = "txt_preco"
        Me.txt_preco.Size = New System.Drawing.Size(100, 20)
        Me.txt_preco.TabIndex = 21
        '
        'label_total
        '
        Me.label_total.Location = New System.Drawing.Point(667, 287)
        Me.label_total.Name = "label_total"
        Me.label_total.Size = New System.Drawing.Size(141, 13)
        Me.label_total.TabIndex = 41
        Me.label_total.Text = "Total: 0"
        Me.label_total.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'btn_fechar
        '
        Me.btn_fechar.Location = New System.Drawing.Point(192, 280)
        Me.btn_fechar.Name = "btn_fechar"
        Me.btn_fechar.Size = New System.Drawing.Size(75, 26)
        Me.btn_fechar.TabIndex = 33
        Me.btn_fechar.Text = "Fechar"
        Me.btn_fechar.UseVisualStyleBackColor = True
        '
        'btn_salvar
        '
        Me.btn_salvar.Location = New System.Drawing.Point(107, 280)
        Me.btn_salvar.Name = "btn_salvar"
        Me.btn_salvar.Size = New System.Drawing.Size(75, 26)
        Me.btn_salvar.TabIndex = 32
        Me.btn_salvar.Text = "Salvar"
        Me.btn_salvar.UseVisualStyleBackColor = True
        '
        'btn_excluir
        '
        Me.btn_excluir.Location = New System.Drawing.Point(22, 280)
        Me.btn_excluir.Name = "btn_excluir"
        Me.btn_excluir.Size = New System.Drawing.Size(75, 26)
        Me.btn_excluir.TabIndex = 30
        Me.btn_excluir.Text = "Excluir"
        Me.btn_excluir.UseVisualStyleBackColor = True
        '
        'btn_alterar
        '
        Me.btn_alterar.Location = New System.Drawing.Point(192, 248)
        Me.btn_alterar.Name = "btn_alterar"
        Me.btn_alterar.Size = New System.Drawing.Size(75, 26)
        Me.btn_alterar.TabIndex = 29
        Me.btn_alterar.Text = "Alterar"
        Me.btn_alterar.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(107, 248)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(75, 26)
        Me.btn_cancelar.TabIndex = 27
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_novo
        '
        Me.btn_novo.Location = New System.Drawing.Point(22, 248)
        Me.btn_novo.Name = "btn_novo"
        Me.btn_novo.Size = New System.Drawing.Size(75, 26)
        Me.btn_novo.TabIndex = 26
        Me.btn_novo.Text = "Novo"
        Me.btn_novo.UseVisualStyleBackColor = True
        '
        'txt_descricao
        '
        Me.txt_descricao.Location = New System.Drawing.Point(89, 51)
        Me.txt_descricao.Name = "txt_descricao"
        Me.txt_descricao.Size = New System.Drawing.Size(178, 20)
        Me.txt_descricao.TabIndex = 23
        Me.txt_descricao.Tag = "obrigatório"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(19, 272)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(0, 13)
        Me.Label5.TabIndex = 28
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(19, 136)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(72, 13)
        Me.Label4.TabIndex = 38
        Me.Label4.Text = "Qtd. Estoque:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(19, 97)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(38, 13)
        Me.Label3.TabIndex = 37
        Me.Label3.Text = "Preço:"
        '
        'list_produtos
        '
        Me.list_produtos.HideSelection = False
        Me.list_produtos.Location = New System.Drawing.Point(301, 12)
        Me.list_produtos.Name = "list_produtos"
        Me.list_produtos.Size = New System.Drawing.Size(507, 262)
        Me.list_produtos.TabIndex = 34
        Me.list_produtos.UseCompatibleStateImageBehavior = False
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(89, 12)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.Size = New System.Drawing.Size(100, 20)
        Me.txt_id.TabIndex = 22
        Me.txt_id.Tag = "obrigatório"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(19, 58)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(58, 13)
        Me.Label2.TabIndex = 36
        Me.Label2.Text = "Descrição:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(19, 19)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(21, 13)
        Me.Label1.TabIndex = 35
        Me.Label1.Text = "ID:"
        '
        'txt_estoque
        '
        Me.txt_estoque.Location = New System.Drawing.Point(89, 129)
        Me.txt_estoque.Name = "txt_estoque"
        Me.txt_estoque.Size = New System.Drawing.Size(100, 20)
        Me.txt_estoque.TabIndex = 42
        Me.txt_estoque.Tag = "obrigatório"
        '
        'Form_Produtos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(820, 322)
        Me.Controls.Add(Me.txt_estoque)
        Me.Controls.Add(Me.txt_preco)
        Me.Controls.Add(Me.label_total)
        Me.Controls.Add(Me.btn_fechar)
        Me.Controls.Add(Me.btn_salvar)
        Me.Controls.Add(Me.btn_excluir)
        Me.Controls.Add(Me.btn_alterar)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_novo)
        Me.Controls.Add(Me.txt_descricao)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.list_produtos)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form_Produtos"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Produtos"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents txt_preco As System.Windows.Forms.TextBox
    Friend WithEvents label_total As System.Windows.Forms.Label
    Friend WithEvents btn_fechar As System.Windows.Forms.Button
    Friend WithEvents btn_salvar As System.Windows.Forms.Button
    Friend WithEvents btn_excluir As System.Windows.Forms.Button
    Friend WithEvents btn_alterar As System.Windows.Forms.Button
    Friend WithEvents btn_cancelar As System.Windows.Forms.Button
    Friend WithEvents btn_novo As System.Windows.Forms.Button
    Friend WithEvents txt_descricao As System.Windows.Forms.TextBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents list_produtos As System.Windows.Forms.ListView
    Friend WithEvents txt_id As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txt_estoque As System.Windows.Forms.TextBox
End Class
