<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form_Menu
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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.CadastrosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ClientesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ProdutosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UsuáriosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MovimentaçõesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ComprasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VendasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FinanceiroToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CentroDeCustoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PlanoDeContasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SairToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.label_data = New System.Windows.Forms.ToolStripStatusLabel()
        Me.label_bemvindo = New System.Windows.Forms.ToolStripStatusLabel()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.MenuStrip1.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CadastrosToolStripMenuItem, Me.MovimentaçõesToolStripMenuItem, Me.FinanceiroToolStripMenuItem, Me.SairToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(800, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'CadastrosToolStripMenuItem
        '
        Me.CadastrosToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ClientesToolStripMenuItem, Me.ProdutosToolStripMenuItem, Me.UsuáriosToolStripMenuItem})
        Me.CadastrosToolStripMenuItem.Name = "CadastrosToolStripMenuItem"
        Me.CadastrosToolStripMenuItem.Size = New System.Drawing.Size(71, 20)
        Me.CadastrosToolStripMenuItem.Text = "Cadastros"
        '
        'ClientesToolStripMenuItem
        '
        Me.ClientesToolStripMenuItem.Name = "ClientesToolStripMenuItem"
        Me.ClientesToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.ClientesToolStripMenuItem.Text = "Clientes"
        '
        'ProdutosToolStripMenuItem
        '
        Me.ProdutosToolStripMenuItem.Name = "ProdutosToolStripMenuItem"
        Me.ProdutosToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.ProdutosToolStripMenuItem.Text = "Produtos"
        '
        'UsuáriosToolStripMenuItem
        '
        Me.UsuáriosToolStripMenuItem.Name = "UsuáriosToolStripMenuItem"
        Me.UsuáriosToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.UsuáriosToolStripMenuItem.Text = "Usuários"
        '
        'MovimentaçõesToolStripMenuItem
        '
        Me.MovimentaçõesToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ComprasToolStripMenuItem, Me.VendasToolStripMenuItem})
        Me.MovimentaçõesToolStripMenuItem.Name = "MovimentaçõesToolStripMenuItem"
        Me.MovimentaçõesToolStripMenuItem.Size = New System.Drawing.Size(104, 20)
        Me.MovimentaçõesToolStripMenuItem.Text = "Movimentações"
        '
        'ComprasToolStripMenuItem
        '
        Me.ComprasToolStripMenuItem.Name = "ComprasToolStripMenuItem"
        Me.ComprasToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.ComprasToolStripMenuItem.Text = "Compras"
        '
        'VendasToolStripMenuItem
        '
        Me.VendasToolStripMenuItem.Name = "VendasToolStripMenuItem"
        Me.VendasToolStripMenuItem.Size = New System.Drawing.Size(122, 22)
        Me.VendasToolStripMenuItem.Text = "Vendas"
        '
        'FinanceiroToolStripMenuItem
        '
        Me.FinanceiroToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CentroDeCustoToolStripMenuItem, Me.PlanoDeContasToolStripMenuItem})
        Me.FinanceiroToolStripMenuItem.Name = "FinanceiroToolStripMenuItem"
        Me.FinanceiroToolStripMenuItem.Size = New System.Drawing.Size(74, 20)
        Me.FinanceiroToolStripMenuItem.Text = "Financeiro"
        '
        'CentroDeCustoToolStripMenuItem
        '
        Me.CentroDeCustoToolStripMenuItem.Name = "CentroDeCustoToolStripMenuItem"
        Me.CentroDeCustoToolStripMenuItem.Size = New System.Drawing.Size(160, 22)
        Me.CentroDeCustoToolStripMenuItem.Text = "Centro de custo"
        '
        'PlanoDeContasToolStripMenuItem
        '
        Me.PlanoDeContasToolStripMenuItem.Name = "PlanoDeContasToolStripMenuItem"
        Me.PlanoDeContasToolStripMenuItem.Size = New System.Drawing.Size(160, 22)
        Me.PlanoDeContasToolStripMenuItem.Text = "Plano de Contas"
        '
        'SairToolStripMenuItem
        '
        Me.SairToolStripMenuItem.Name = "SairToolStripMenuItem"
        Me.SairToolStripMenuItem.Size = New System.Drawing.Size(38, 20)
        Me.SairToolStripMenuItem.Text = "Sair"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.label_data, Me.label_bemvindo})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 428)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(800, 22)
        Me.StatusStrip1.TabIndex = 1
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'label_data
        '
        Me.label_data.Name = "label_data"
        Me.label_data.Size = New System.Drawing.Size(34, 17)
        Me.label_data.Text = "Data:"
        '
        'label_bemvindo
        '
        Me.label_bemvindo.Name = "label_bemvindo"
        Me.label_bemvindo.Size = New System.Drawing.Size(66, 17)
        Me.label_bemvindo.Text = "Bem-vindo"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(201, 141)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 15)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Label1"
        '
        'Form_Menu
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Form_Menu"
        Me.Text = "Form_Menu"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents MenuStrip1 As MenuStrip
    Friend WithEvents CadastrosToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ClientesToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ProdutosToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents UsuáriosToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents MovimentaçõesToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ComprasToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents VendasToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents FinanceiroToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents CentroDeCustoToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents PlanoDeContasToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents SairToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents StatusStrip1 As StatusStrip
    Friend WithEvents label_data As ToolStripStatusLabel
    Friend WithEvents label_bemvindo As ToolStripStatusLabel
    Friend WithEvents Label1 As Label
End Class
