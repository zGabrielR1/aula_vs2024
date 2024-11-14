<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form_Vendas
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
        Me.txt_id = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cbx_cliente = New System.Windows.Forms.ComboBox()
        Me.GroupBox = New System.Windows.Forms.GroupBox()
        Me.list_produtos_adicionados = New System.Windows.Forms.ListView()
        Me.ColumnHeader10 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader11 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader12 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader13 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader14 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.btn_remover = New System.Windows.Forms.Button()
        Me.btn_adicionar = New System.Windows.Forms.Button()
        Me.txt_qtd = New System.Windows.Forms.TextBox()
        Me.cbx_produto = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.list_vendas = New System.Windows.Forms.ListView()
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader8 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.btn_novo = New System.Windows.Forms.Button()
        Me.btn_cancelar = New System.Windows.Forms.Button()
        Me.btn_salvar = New System.Windows.Forms.Button()
        Me.btn_sair = New System.Windows.Forms.Button()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.label_valor_total = New System.Windows.Forms.Label()
        Me.GroupBox.SuspendLayout()
        Me.SuspendLayout()
        '
        'txt_id
        '
        Me.txt_id.Location = New System.Drawing.Point(89, 12)
        Me.txt_id.Name = "txt_id"
        Me.txt_id.Size = New System.Drawing.Size(100, 20)
        Me.txt_id.TabIndex = 16
        Me.txt_id.Tag = "obrigatório"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(19, 58)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(42, 13)
        Me.Label2.TabIndex = 19
        Me.Label2.Text = "Cliente:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(19, 19)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(21, 13)
        Me.Label1.TabIndex = 18
        Me.Label1.Text = "ID:"
        '
        'cbx_cliente
        '
        Me.cbx_cliente.FormattingEnabled = True
        Me.cbx_cliente.Location = New System.Drawing.Point(89, 50)
        Me.cbx_cliente.Name = "cbx_cliente"
        Me.cbx_cliente.Size = New System.Drawing.Size(247, 21)
        Me.cbx_cliente.TabIndex = 20
        '
        'GroupBox
        '
        Me.GroupBox.Controls.Add(Me.list_produtos_adicionados)
        Me.GroupBox.Controls.Add(Me.btn_remover)
        Me.GroupBox.Controls.Add(Me.btn_adicionar)
        Me.GroupBox.Controls.Add(Me.txt_qtd)
        Me.GroupBox.Controls.Add(Me.cbx_produto)
        Me.GroupBox.Controls.Add(Me.Label4)
        Me.GroupBox.Controls.Add(Me.Label3)
        Me.GroupBox.Location = New System.Drawing.Point(22, 96)
        Me.GroupBox.Name = "GroupBox"
        Me.GroupBox.Size = New System.Drawing.Size(325, 285)
        Me.GroupBox.TabIndex = 21
        Me.GroupBox.TabStop = False
        Me.GroupBox.Text = "Produtos da Venda"
        '
        'list_produtos_adicionados
        '
        Me.list_produtos_adicionados.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader10, Me.ColumnHeader11, Me.ColumnHeader12, Me.ColumnHeader13, Me.ColumnHeader14})
        Me.list_produtos_adicionados.FullRowSelect = True
        Me.list_produtos_adicionados.GridLines = True
        Me.list_produtos_adicionados.HideSelection = False
        Me.list_produtos_adicionados.Location = New System.Drawing.Point(9, 141)
        Me.list_produtos_adicionados.MultiSelect = False
        Me.list_produtos_adicionados.Name = "list_produtos_adicionados"
        Me.list_produtos_adicionados.Size = New System.Drawing.Size(305, 132)
        Me.list_produtos_adicionados.TabIndex = 28
        Me.list_produtos_adicionados.UseCompatibleStateImageBehavior = False
        Me.list_produtos_adicionados.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader10
        '
        Me.ColumnHeader10.Text = "ID"
        '
        'ColumnHeader11
        '
        Me.ColumnHeader11.Text = "Produto"
        '
        'ColumnHeader12
        '
        Me.ColumnHeader12.Text = "R$ Preço"
        '
        'ColumnHeader13
        '
        Me.ColumnHeader13.Text = "Qtd."
        '
        'ColumnHeader14
        '
        Me.ColumnHeader14.Text = "R$ Total"
        '
        'btn_remover
        '
        Me.btn_remover.Location = New System.Drawing.Point(167, 112)
        Me.btn_remover.Name = "btn_remover"
        Me.btn_remover.Size = New System.Drawing.Size(147, 23)
        Me.btn_remover.TabIndex = 27
        Me.btn_remover.Text = "Remover"
        Me.btn_remover.UseVisualStyleBackColor = True
        '
        'btn_adicionar
        '
        Me.btn_adicionar.Location = New System.Drawing.Point(9, 112)
        Me.btn_adicionar.Name = "btn_adicionar"
        Me.btn_adicionar.Size = New System.Drawing.Size(147, 23)
        Me.btn_adicionar.TabIndex = 26
        Me.btn_adicionar.Text = "Adicionar"
        Me.btn_adicionar.UseVisualStyleBackColor = True
        '
        'txt_qtd
        '
        Me.txt_qtd.Location = New System.Drawing.Point(67, 66)
        Me.txt_qtd.Name = "txt_qtd"
        Me.txt_qtd.Size = New System.Drawing.Size(100, 20)
        Me.txt_qtd.TabIndex = 22
        Me.txt_qtd.Tag = "obrigatório"
        '
        'cbx_produto
        '
        Me.cbx_produto.FormattingEnabled = True
        Me.cbx_produto.Location = New System.Drawing.Point(67, 25)
        Me.cbx_produto.Name = "cbx_produto"
        Me.cbx_produto.Size = New System.Drawing.Size(247, 21)
        Me.cbx_produto.TabIndex = 22
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(6, 73)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(30, 13)
        Me.Label4.TabIndex = 23
        Me.Label4.Text = "Qtd.:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(6, 33)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(47, 13)
        Me.Label3.TabIndex = 22
        Me.Label3.Text = "Produto:"
        '
        'list_vendas
        '
        Me.list_vendas.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader5, Me.ColumnHeader6, Me.ColumnHeader7, Me.ColumnHeader8})
        Me.list_vendas.FullRowSelect = True
        Me.list_vendas.GridLines = True
        Me.list_vendas.HideSelection = False
        Me.list_vendas.Location = New System.Drawing.Point(353, 12)
        Me.list_vendas.MultiSelect = False
        Me.list_vendas.Name = "list_vendas"
        Me.list_vendas.Size = New System.Drawing.Size(514, 369)
        Me.list_vendas.TabIndex = 22
        Me.list_vendas.UseCompatibleStateImageBehavior = False
        Me.list_vendas.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "ID"
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Data"
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "R$ Valor Total"
        '
        'ColumnHeader8
        '
        Me.ColumnHeader8.Text = "Cliente"
        '
        'btn_novo
        '
        Me.btn_novo.Location = New System.Drawing.Point(353, 387)
        Me.btn_novo.Name = "btn_novo"
        Me.btn_novo.Size = New System.Drawing.Size(124, 23)
        Me.btn_novo.TabIndex = 23
        Me.btn_novo.Text = "Nova Venda"
        Me.btn_novo.UseVisualStyleBackColor = True
        '
        'btn_cancelar
        '
        Me.btn_cancelar.Location = New System.Drawing.Point(483, 387)
        Me.btn_cancelar.Name = "btn_cancelar"
        Me.btn_cancelar.Size = New System.Drawing.Size(124, 23)
        Me.btn_cancelar.TabIndex = 24
        Me.btn_cancelar.Text = "Cancelar Venda"
        Me.btn_cancelar.UseVisualStyleBackColor = True
        '
        'btn_salvar
        '
        Me.btn_salvar.Location = New System.Drawing.Point(613, 387)
        Me.btn_salvar.Name = "btn_salvar"
        Me.btn_salvar.Size = New System.Drawing.Size(124, 23)
        Me.btn_salvar.TabIndex = 25
        Me.btn_salvar.Text = "Salvar"
        Me.btn_salvar.UseVisualStyleBackColor = True
        '
        'btn_sair
        '
        Me.btn_sair.Location = New System.Drawing.Point(743, 387)
        Me.btn_sair.Name = "btn_sair"
        Me.btn_sair.Size = New System.Drawing.Size(124, 23)
        Me.btn_sair.TabIndex = 26
        Me.btn_sair.Text = "Sair"
        Me.btn_sair.UseVisualStyleBackColor = True
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(19, 392)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(78, 13)
        Me.Label5.TabIndex = 27
        Me.Label5.Text = "Valor Total: R$"
        '
        'label_valor_total
        '
        Me.label_valor_total.AutoSize = True
        Me.label_valor_total.Location = New System.Drawing.Point(103, 392)
        Me.label_valor_total.Name = "label_valor_total"
        Me.label_valor_total.Size = New System.Drawing.Size(28, 13)
        Me.label_valor_total.TabIndex = 28
        Me.label_valor_total.Text = "0,00"
        '
        'Form_Vendas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(877, 420)
        Me.Controls.Add(Me.label_valor_total)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.btn_sair)
        Me.Controls.Add(Me.btn_salvar)
        Me.Controls.Add(Me.btn_cancelar)
        Me.Controls.Add(Me.btn_novo)
        Me.Controls.Add(Me.list_vendas)
        Me.Controls.Add(Me.GroupBox)
        Me.Controls.Add(Me.cbx_cliente)
        Me.Controls.Add(Me.txt_id)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form_Vendas"
        Me.Text = "Controle Vendas"
        Me.GroupBox.ResumeLayout(False)
        Me.GroupBox.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents txt_id As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cbx_cliente As System.Windows.Forms.ComboBox
    Friend WithEvents GroupBox As System.Windows.Forms.GroupBox
    Friend WithEvents list_produtos_adicionados As System.Windows.Forms.ListView
    Friend WithEvents btn_remover As System.Windows.Forms.Button
    Friend WithEvents btn_adicionar As System.Windows.Forms.Button
    Friend WithEvents txt_qtd As System.Windows.Forms.TextBox
    Friend WithEvents cbx_produto As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents list_vendas As System.Windows.Forms.ListView
    Friend WithEvents btn_novo As System.Windows.Forms.Button
    Friend WithEvents btn_cancelar As System.Windows.Forms.Button
    Friend WithEvents btn_salvar As System.Windows.Forms.Button
    Friend WithEvents btn_sair As System.Windows.Forms.Button
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader8 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader10 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader11 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader12 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader13 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader14 As System.Windows.Forms.ColumnHeader
    Friend WithEvents label_valor_total As System.Windows.Forms.Label
End Class
