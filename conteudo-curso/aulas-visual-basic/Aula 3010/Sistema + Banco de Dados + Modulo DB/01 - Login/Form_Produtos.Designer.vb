<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form_Produtos
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
        Me.lbl_id_produto = New System.Windows.Forms.Label()
        Me.lbl_descricao_produto = New System.Windows.Forms.Label()
        Me.lbl_preco = New System.Windows.Forms.Label()
        Me.lbl_qdt_estoque = New System.Windows.Forms.Label()
        Me.btn_salvar_pdt = New System.Windows.Forms.Button()
        Me.btn_alterar_pdt = New System.Windows.Forms.Button()
        Me.btn_excluir_pdt = New System.Windows.Forms.Button()
        Me.btn_novo_produto = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_fechar = New System.Windows.Forms.Button()
        Me.txt_descricao = New System.Windows.Forms.TextBox()
        Me.txt_preco = New System.Windows.Forms.TextBox()
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.txt_qdt_estoque = New System.Windows.Forms.TextBox()
        Me.lv_produtos = New System.Windows.Forms.ListView()
        Me.SuspendLayout()
        '
        'lbl_id_produto
        '
        Me.lbl_id_produto.AutoSize = True
        Me.lbl_id_produto.Location = New System.Drawing.Point(55, 29)
        Me.lbl_id_produto.Name = "lbl_id_produto"
        Me.lbl_id_produto.Size = New System.Drawing.Size(21, 13)
        Me.lbl_id_produto.TabIndex = 0
        Me.lbl_id_produto.Text = "ID:"
        '
        'lbl_descricao_produto
        '
        Me.lbl_descricao_produto.AutoSize = True
        Me.lbl_descricao_produto.Location = New System.Drawing.Point(55, 74)
        Me.lbl_descricao_produto.Name = "lbl_descricao_produto"
        Me.lbl_descricao_produto.Size = New System.Drawing.Size(58, 13)
        Me.lbl_descricao_produto.TabIndex = 1
        Me.lbl_descricao_produto.Text = "Descrição:"
        '
        'lbl_preco
        '
        Me.lbl_preco.AutoSize = True
        Me.lbl_preco.Location = New System.Drawing.Point(55, 129)
        Me.lbl_preco.Name = "lbl_preco"
        Me.lbl_preco.Size = New System.Drawing.Size(38, 13)
        Me.lbl_preco.TabIndex = 2
        Me.lbl_preco.Text = "Preço:"
        '
        'lbl_qdt_estoque
        '
        Me.lbl_qdt_estoque.AutoSize = True
        Me.lbl_qdt_estoque.Location = New System.Drawing.Point(55, 192)
        Me.lbl_qdt_estoque.Name = "lbl_qdt_estoque"
        Me.lbl_qdt_estoque.Size = New System.Drawing.Size(72, 13)
        Me.lbl_qdt_estoque.TabIndex = 3
        Me.lbl_qdt_estoque.Text = "Qtd. Estoque:"
        '
        'btn_salvar_pdt
        '
        Me.btn_salvar_pdt.Location = New System.Drawing.Point(139, 312)
        Me.btn_salvar_pdt.Name = "btn_salvar_pdt"
        Me.btn_salvar_pdt.Size = New System.Drawing.Size(75, 23)
        Me.btn_salvar_pdt.TabIndex = 4
        Me.btn_salvar_pdt.Text = "Salvar"
        Me.btn_salvar_pdt.UseVisualStyleBackColor = True
        '
        'btn_alterar_pdt
        '
        Me.btn_alterar_pdt.Location = New System.Drawing.Point(220, 283)
        Me.btn_alterar_pdt.Name = "btn_alterar_pdt"
        Me.btn_alterar_pdt.Size = New System.Drawing.Size(75, 23)
        Me.btn_alterar_pdt.TabIndex = 5
        Me.btn_alterar_pdt.Text = "Alterar"
        Me.btn_alterar_pdt.UseVisualStyleBackColor = True
        '
        'btn_excluir_pdt
        '
        Me.btn_excluir_pdt.Location = New System.Drawing.Point(58, 312)
        Me.btn_excluir_pdt.Name = "btn_excluir_pdt"
        Me.btn_excluir_pdt.Size = New System.Drawing.Size(75, 23)
        Me.btn_excluir_pdt.TabIndex = 6
        Me.btn_excluir_pdt.Text = "Excluir"
        Me.btn_excluir_pdt.UseVisualStyleBackColor = True
        '
        'btn_novo_produto
        '
        Me.btn_novo_produto.Location = New System.Drawing.Point(58, 283)
        Me.btn_novo_produto.Name = "btn_novo_produto"
        Me.btn_novo_produto.Size = New System.Drawing.Size(75, 23)
        Me.btn_novo_produto.TabIndex = 7
        Me.btn_novo_produto.Text = "Novo"
        Me.btn_novo_produto.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(139, 283)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(75, 23)
        Me.btn_cancelar.TabIndex = 8
        Me.btn_cancelar.Text = "Cancelar"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_fechar
        '
        Me.btn_fechar.Location = New System.Drawing.Point(220, 312)
        Me.btn_fechar.Name = "btn_fechar"
        Me.btn_fechar.Size = New System.Drawing.Size(75, 23)
        Me.btn_fechar.TabIndex = 9
        Me.btn_fechar.Text = "Fechar"
        Me.btn_fechar.UseVisualStyleBackColor = True
        '
        'txt_descricao
        '
        Me.txt_descricao.Location = New System.Drawing.Point(139, 74)
        Me.txt_descricao.Name = "txt_descricao"
        Me.txt_descricao.Size = New System.Drawing.Size(233, 20)
        Me.txt_descricao.TabIndex = 10
        '
        'txt_preco
        '
        Me.txt_preco.Location = New System.Drawing.Point(139, 129)
        Me.txt_preco.Name = "txt_preco"
        Me.txt_preco.Size = New System.Drawing.Size(156, 20)
        Me.txt_preco.TabIndex = 11
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(139, 29)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.Size = New System.Drawing.Size(100, 20)
        Me.txt_id.TabIndex = 12
        '
        'txt_qdt_estoque
        '
        Me.txt_qdt_estoque.Location = New System.Drawing.Point(139, 192)
        Me.txt_qdt_estoque.Name = "txt_qdt_estoque"
        Me.txt_qdt_estoque.Size = New System.Drawing.Size(156, 20)
        Me.txt_qdt_estoque.TabIndex = 13
        '
        'lv_produtos
        '
        Me.lv_produtos.GridLines = True
        Me.lv_produtos.HideSelection = False
        Me.lv_produtos.Location = New System.Drawing.Point(456, 55)
        Me.lv_produtos.Name = "lv_produtos"
        Me.lv_produtos.Size = New System.Drawing.Size(442, 292)
        Me.lv_produtos.TabIndex = 14
        Me.lv_produtos.UseCompatibleStateImageBehavior = False
        '
        'Form_Produtos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(943, 381)
        Me.Controls.Add(Me.lv_produtos)
        Me.Controls.Add(Me.txt_qdt_estoque)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.txt_preco)
        Me.Controls.Add(Me.txt_descricao)
        Me.Controls.Add(Me.btn_fechar)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_novo_produto)
        Me.Controls.Add(Me.btn_excluir_pdt)
        Me.Controls.Add(Me.btn_alterar_pdt)
        Me.Controls.Add(Me.btn_salvar_pdt)
        Me.Controls.Add(Me.lbl_qdt_estoque)
        Me.Controls.Add(Me.lbl_preco)
        Me.Controls.Add(Me.lbl_descricao_produto)
        Me.Controls.Add(Me.lbl_id_produto)
        Me.Name = "Form_Produtos"
        Me.Text = "Form_Produtos"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lbl_id_produto As Label
    Friend WithEvents lbl_descricao_produto As Label
    Friend WithEvents lbl_preco As Label
    Friend WithEvents lbl_qdt_estoque As Label
    Friend WithEvents btn_salvar_pdt As Button
    Friend WithEvents btn_alterar_pdt As Button
    Friend WithEvents btn_excluir_pdt As Button
    Friend WithEvents btn_novo_produto As Button
    Friend WithEvents btn_cancelar As Button
    Friend WithEvents btn_fechar As Button
    Friend WithEvents txt_descricao As TextBox
    Friend WithEvents txt_preco As TextBox
    Friend WithEvents txt_id As TextBox
    Friend WithEvents txt_qdt_estoque As TextBox
    Friend WithEvents lv_produtos As ListView
End Class
