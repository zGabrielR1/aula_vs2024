Module Paciente
    ' Função para calcular a idade do paciente
    Public Function calcular_idade(nascimento As Date) As Integer
        ' Fórmula
        Dim idade As Double = DateDiff(DateInterval.Day, nascimento, Now()) / 365.25
        Return CInt(idade)
    End Function
End Module
