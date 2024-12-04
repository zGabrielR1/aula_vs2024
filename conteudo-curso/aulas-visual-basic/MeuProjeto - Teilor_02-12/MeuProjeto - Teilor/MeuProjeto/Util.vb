Module Util
    ' Prodecimento para ajustar a largura das colunas de uma ListView conforme o seu conteúdo
    Public Sub ajustar_colunas(lv As ListView)
        For i As Integer = 0 To lv.Columns.Count - 1
            lv.AutoResizeColumn(i, ColumnHeaderAutoResizeStyle.ColumnContent)
        Next
    End Sub

    ' Função para aplicar a máscara ao CPF
    Public Function Formatar_CPF(cpf As String) As String
        ' Remove qualquer caractere não numérico
        cpf = cpf.Replace(".", "").Replace("-", "")

        ' Verifica se o CPF tem o comprimento correto (11 dígitos)
        If cpf.Length = 11 Then
            ' Aplica a máscara ao CPF
            Return Convert.ToUInt64(cpf).ToString("000\.000\.000\-00")
        Else
            ' Se o CPF não tiver 11 dígitos, retorna como está
            Return cpf
        End If
    End Function
End Module
