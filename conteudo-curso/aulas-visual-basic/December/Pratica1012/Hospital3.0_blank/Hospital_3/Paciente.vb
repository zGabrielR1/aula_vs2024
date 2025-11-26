Imports System.Net.Mime.MediaTypeNames
Imports Hospital_3.FormPrincipal
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
        Dim idade As Double = DateDiff(DateInterval.Day, nascimento, Now()) / 365.25
        Return CInt(idade)
    End Function

    ' Método para definir o tipo de atendimento baseado na idade
    Private Function DefinirTipoAtendimento() As String
        Dim idade As Integer = CalcularIdade(Me.Nascimento)
        Return IIf(idade >= 60, "Urgente", "Normal")
    End Function

    ' Método para adicionar paciente à fila e ao banco de dados
    Public Function AdicionarNaFila(listView As ListView) As Boolean
        Try
            ' Criar item para ListView
            Dim item As New ListViewItem(Nome)
            item.SubItems.Add(Cpf)
            item.SubItems.Add(Nascimento.ToShortDateString())
            item.SubItems.Add(CalcularIdade(Nascimento).ToString())
            item.SubItems.Add(Plano)
            item.SubItems.Add(Medico)
            item.SubItems.Add(TipoAtendimento)

            ' Adicionar na posição correta da fila
            If TipoAtendimento = "Urgente" Then
                listView.Items.Insert(0, item)
            Else
                listView.Items.Add(item)
            End If

            ' Salvar no banco de dados
            Return SalvarNoBanco()

        Catch erro As Exception
            MsgBox("Erro ao adicionar paciente: " & erro.Message)
            Return False
        End Try
    End Function

    ' Método para salvar no banco de dados
    Private Function SalvarNoBanco() As Boolean
        Try
            Me.banco.Conectar()
            Dim sql As String = "INSERT INTO pacientes (nome, cpf, nascimento, plano, medico, tipo, atendido) VALUES (?,?,?,?,?,?,'não')"
            Me.banco.Executar(sql, Nome, Cpf, Format(Nascimento, "yyyy-MM-dd"), Plano, Medico, TipoAtendimento)
            Return True

        Catch ex As Exception
            MsgBox("Erro ao salvar no banco: " & ex.Message)
            Return False

        Finally
            Me.banco.Desconectar()
        End Try
    End Function

    Public Sub RemoverDaFila()
        ' Confirmação
        Dim resposta As MsgBoxResult = MsgBox("Tem certeza que deseja atender o paciente?", MsgBoxStyle.YesNo)
        If (resposta = MsgBoxResult.Yes) Then
            Try
                Me.banco.Conectar()

                ' Pegar o CPF do paciente para usar como critério no sql
                Dim cpf As String = FormPrincipal.list_fila.Items(0).SubItems(1).Text

                ' Alterar a situação
                Dim sql As String = "UPDATE pacientes SET atendido = 'sim' WHERE cpf = ?"
                Me.banco.Executar(sql, Me.Cpf)

                ' Remove o primero item da ListView
                FormPrincipal.list_fila.Items(0).Remove()

                ' Sucesso
                MsgBox("Paciente atendido com sucesso!")
            Catch erro As Exception
                MsgBox("Houve um problema com o Banco de Dados: " & erro.Message)
            Finally
                Me.banco.Desconectar()
            End Try
        End If
    End Sub


End Class
