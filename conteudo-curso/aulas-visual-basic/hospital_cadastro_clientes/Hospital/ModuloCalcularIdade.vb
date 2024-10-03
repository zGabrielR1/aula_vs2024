Module ModuloCalcularIdade
    Public Function CalcularIdade(dataNascimento As Date) As Integer
        Dim hoje As Date = Date.Today
        Dim idade As Integer = hoje.Year - dataNascimento.Year
        If hoje.Month < dataNascimento.Month OrElse (hoje.Month = dataNascimento.Month AndAlso hoje.Day < dataNascimento.Day) Then
            idade -= 1
        End If
        Return idade
    End Function
End Module
