<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormMenu
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
        Me.menu_topo = New System.Windows.Forms.MenuStrip()
        Me.item_cadastros = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_usuarios = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_clientes = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_produtos = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_movimentacoes = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_compras = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_vendas = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_financeiro = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_planocontas = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_centrocustos = New System.Windows.Forms.ToolStripMenuItem()
        Me.item_sair = New System.Windows.Forms.ToolStripMenuItem()
        Me.barra_status = New System.Windows.Forms.StatusStrip()
        Me.label_data = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.label_bemvindo = New System.Windows.Forms.ToolStripStatusLabel()
        Me.menu_topo.SuspendLayout()
        Me.barra_status.SuspendLayout()
        Me.SuspendLayout()
        '
        'menu_topo
        '
        Me.menu_topo.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.item_cadastros, Me.item_movimentacoes, Me.item_financeiro, Me.item_sair})
        Me.menu_topo.Location = New System.Drawing.Point(0, 0)
        Me.menu_topo.Name = "menu_topo"
        Me.menu_topo.Size = New System.Drawing.Size(771, 24)
        Me.menu_topo.TabIndex = 1
        Me.menu_topo.Text = "MenuStrip1"
        '
        'item_cadastros
        '
        Me.item_cadastros.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.item_usuarios, Me.item_clientes, Me.item_produtos})
        Me.item_cadastros.Name = "item_cadastros"
        Me.item_cadastros.Size = New System.Drawing.Size(71, 20)
        Me.item_cadastros.Text = "Cadastros"
        '
        'item_usuarios
        '
        Me.item_usuarios.Name = "item_usuarios"
        Me.item_usuarios.Size = New System.Drawing.Size(122, 22)
        Me.item_usuarios.Text = "Usuários"
        '
        'item_clientes
        '
        Me.item_clientes.Name = "item_clientes"
        Me.item_clientes.Size = New System.Drawing.Size(122, 22)
        Me.item_clientes.Text = "Clientes"
        '
        'item_produtos
        '
        Me.item_produtos.Name = "item_produtos"
        Me.item_produtos.Size = New System.Drawing.Size(122, 22)
        Me.item_produtos.Text = "Produtos"
        '
        'item_movimentacoes
        '
        Me.item_movimentacoes.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.item_compras, Me.item_vendas})
        Me.item_movimentacoes.Name = "item_movimentacoes"
        Me.item_movimentacoes.Size = New System.Drawing.Size(104, 20)
        Me.item_movimentacoes.Text = "Movimentações"
        '
        'item_compras
        '
        Me.item_compras.Name = "item_compras"
        Me.item_compras.Size = New System.Drawing.Size(152, 22)
        Me.item_compras.Text = "Compras"
        '
        'item_vendas
        '
        Me.item_vendas.Name = "item_vendas"
        Me.item_vendas.Size = New System.Drawing.Size(152, 22)
        Me.item_vendas.Text = "Vendas"
        '
        'item_financeiro
        '
        Me.item_financeiro.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.item_planocontas, Me.item_centrocustos})
        Me.item_financeiro.Name = "item_financeiro"
        Me.item_financeiro.Size = New System.Drawing.Size(74, 20)
        Me.item_financeiro.Text = "Financeiro"
        '
        'item_planocontas
        '
        Me.item_planocontas.Name = "item_planocontas"
        Me.item_planocontas.Size = New System.Drawing.Size(165, 22)
        Me.item_planocontas.Text = "Plano de Contas"
        '
        'item_centrocustos
        '
        Me.item_centrocustos.Name = "item_centrocustos"
        Me.item_centrocustos.Size = New System.Drawing.Size(165, 22)
        Me.item_centrocustos.Text = "Centro de Custos"
        '
        'item_sair
        '
        Me.item_sair.Name = "item_sair"
        Me.item_sair.Size = New System.Drawing.Size(38, 20)
        Me.item_sair.Text = "Sair"
        '
        'barra_status
        '
        Me.barra_status.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.label_data, Me.ToolStripStatusLabel1, Me.label_bemvindo})
        Me.barra_status.Location = New System.Drawing.Point(0, 440)
        Me.barra_status.Name = "barra_status"
        Me.barra_status.Size = New System.Drawing.Size(771, 22)
        Me.barra_status.TabIndex = 2
        Me.barra_status.Text = "StatusStrip1"
        '
        'label_data
        '
        Me.label_data.Name = "label_data"
        Me.label_data.Size = New System.Drawing.Size(34, 17)
        Me.label_data.Text = "Data:"
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(10, 17)
        Me.ToolStripStatusLabel1.Text = "|"
        '
        'label_bemvindo
        '
        Me.label_bemvindo.Name = "label_bemvindo"
        Me.label_bemvindo.Size = New System.Drawing.Size(66, 17)
        Me.label_bemvindo.Text = "Bem-vindo"
        '
        'Form_Menu
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(771, 462)
        Me.Controls.Add(Me.barra_status)
        Me.Controls.Add(Me.menu_topo)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "Form_Menu"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Menu"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.menu_topo.ResumeLayout(False)
        Me.menu_topo.PerformLayout()
        Me.barra_status.ResumeLayout(False)
        Me.barra_status.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents menu_topo As System.Windows.Forms.MenuStrip
    Friend WithEvents item_cadastros As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_movimentacoes As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_usuarios As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_clientes As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_produtos As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_compras As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_vendas As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_financeiro As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_sair As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_planocontas As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents item_centrocustos As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents barra_status As System.Windows.Forms.StatusStrip
    Friend WithEvents label_data As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents label_bemvindo As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
End Class
