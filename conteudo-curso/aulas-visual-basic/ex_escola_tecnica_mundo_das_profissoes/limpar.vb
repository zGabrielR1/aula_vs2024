Module limpar
    ''' <summary>
    ''' Clears all input fields on the form.
    ''' </summary>
    ''' <param name="txtName">TextBox for student name.</param>
    ''' <param name="cmbSubject">ComboBox for subjects.</param>
    ''' <param name="rbtDev">RadioButton for Systems Development.</param>
    ''' <param name="rbtElec">RadioButton for Electrical Engineering.</param>
    ''' <param name="rbtMech">RadioButton for Mechanics.</param>
    Public Sub ClearFields(txtName As TextBox, cmbSubject As ComboBox, rbtDev As RadioButton, rbtElec As RadioButton, rbtMech As RadioButton)
        txtName.Clear()
        cmbSubject.Items.Clear()
        cmbSubject.Text = ""
        rbtDev.Checked = False
        rbtElec.Checked = False
        rbtMech.Checked = False
    End Sub
End Module