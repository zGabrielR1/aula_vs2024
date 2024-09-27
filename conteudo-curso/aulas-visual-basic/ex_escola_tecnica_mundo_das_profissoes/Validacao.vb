Module Validacao
    ''' <summary>
    ''' Validates that all input fields are filled.
    ''' </summary>
    ''' <param name="name">Student name.</param>
    ''' <param name="course">Selected course.</param>
    ''' <param name="subject">Selected subject.</param>
    ''' <returns>True if all fields are filled; otherwise, False.</returns>
    Public Function ValidateFields(name As String, course As String, subject As String) As Boolean
        If String.IsNullOrWhiteSpace(name) OrElse String.IsNullOrWhiteSpace(course) OrElse String.IsNullOrWhiteSpace(subject) Then
            Return False
        Else
            Return True
        End If
    End Function
End Module