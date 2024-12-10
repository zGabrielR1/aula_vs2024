Imports System.Net.Mime.MediaTypeNames
Public Class Paciente
    Inherits Pessoa ' Classe `filha` de pessoa, herdando seus atributos
    ' Função estática para calcular a idade do paciente

    Private _plano As String
    Private _medico As String
    Private _tipoAtendimento As String
    Private _atendido As Boolean
    Private _cpf As String
    Private _nascimento As Date
    Private _tipo As String

    Public Property Plano As String
        Get
            Return _plano
        End Get
        Set(value As String)
            _plano = value
        End Set
    End Property

    Public Property Medico As String
        Get
            Return _medico
        End Get
        Set(value As String)
            _medico = value
        End Set
    End Property

    Public Property TipoAtendimento As String
        Get
            Return _tipoAtendimento
        End Get
        Set(value As String)
            _tipoAtendimento = value
        End Set
    End Property

    Public Property Atendido As Boolean
        Get
            Return _atendido
        End Get
        Set(value As Boolean)
            _atendido = value
        End Set
    End Property

    Public Property Cpf As String
        Get
            Return _cpf
        End Get
        Set(value As String)
            _cpf = value
        End Set
    End Property

    Public Property Nascimento As Date
        Get
            Return _nascimento
        End Get
        Set(value As Date)
            _nascimento = value
        End Set
    End Property

    Public Property Tipo As String
        Get
            Return _tipo
        End Get
        Set(value As String)
            _tipo = value
        End Set
    End Property
    Shared Function CalcularIdade(nascimento As Date) As Integer
        ' Fórmula
        Dim idade As Double = DateDiff(DateInterval.Day, nascimento, Now()) / 365.25
        Return CInt(idade)
    End Function

    Public Function AdicionarPaciente(listView As ListView) As Boolean
        ' Criar um novo item da ListView com os dados do paciente
        Dim item As New ListViewItem(Me.Nome)
        item.SubItems.Add(Me.Cpf)
        item.SubItems.Add(Me.Nascimento.ToShortDateString())
        item.SubItems.Add(Me.idade.ToString())
        item.SubItems.Add(Me.Plano)
        item.SubItems.Add(Me.Medico)
        item.SubItems.Add(Me.Tipo)

        ' Verificar as regras de negócio da fila
        If (Tipo = "Urgente" Or idade >= 60) Then
            list_fila.Items.Insert(0, item)     ' Urgente, começo da fila
        Else
            list_fila.Items.Add(item)           ' Normal, final da fila
        End If

        ' Ajustar Largura das Colunas
        list_fila.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)

        ' Gravar os dados no banco
        Try
            Me.banco.Conectar()
            Dim sql As String = "INSERT INTO pacientes (nome, cpf, nascimento, plano, medico, tipo, atendido) VALUES (?,?,?,?,?,?,'não')"
            Me.banco.Executar(sql, Me.Nome, Me.Cpf, Format(Nascimento, "yyyy-MM-dd"), Me.Plano, Me.Medico, Me.Tipo)
            MsgBox("Paciente registrado com sucesso!")
        Catch erro As Exception
            MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
        Finally
            Me.banco.Desconectar()
        End Try

    End Function

    Public Function AtenderPaciente()
        ' Confirmação
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja atender o paciente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Try
                Me.banco.Conectar()

                ' Pegar o CPF do paciente para usar como critério no sql
                Dim cpf As String = list_fila.Items(0).SubItems(1).Text

                ' Alterar a situação
                Dim sql As String = "UPDATE pacientes SET atendido = 'sim' WHERE cpf = ?"
                Me.banco.Executar(sql, Me.Cpf)

                ' Remove o primero item da ListView
                list_fila.Items(0).Remove()

                ' Sucesso
                MsgBox("Paciente atendido com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Finally
                Me.banco.Desconectar()
            End Try
        End If
    End Function


End Class
