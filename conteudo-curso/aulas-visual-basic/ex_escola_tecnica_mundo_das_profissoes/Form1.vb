Public Class Form1

    ' Arrays to store subjects for each course
    Private systemsDevSubjects As String() = {"Lógica de Programação", "Banco de Dados", "Desenvolvimento Web"}
    Private electricalEngSubjects As String() = {"Design de circuitos", "Instalação e Manutenção Elétrica Predial ", "Eletrônica de potência"}
    Private mechanicsSubjects As String() = {"Gerenciamento de Projetos", "Desenvolvimento de Sistemas de Automação Mecânica", "Projeto de máquinas"}

    ' Counter for enrolled students
    Private enrolledCount As Integer = 0

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Initialize ListView columns
        listViewCursos.Columns.Add("Student Name", 150, HorizontalAlignment.Left)
        listViewCursos.Columns.Add("Course", 150, HorizontalAlignment.Left)
        listViewCursos.Columns.Add("Subject", 150, HorizontalAlignment.Left)

        ' Optionally, disable the Register button initially
        btn_confirmar.Enabled = False
        ' Initialize the Alterar button
        btn_alterar.Enabled = False
    End Sub

    ''' <summary>
    ''' Handles the CheckedChanged event for Systems Development RadioButton.
    ''' Populates the ComboBox with relevant subjects.
    ''' </summary>
    Private Sub rbt_dev_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_dev.CheckedChanged
        If rbt_dev.Checked Then
            PopulateSubjects(systemsDevSubjects)
        End If
    End Sub



    ''' <summary>
    ''' Handles the CheckedChanged event for Electrical Engineering RadioButton.
    ''' Populates the ComboBox with relevant subjects.
    ''' </summary>
    Private Sub rbt_elec_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_eletrotecnica.CheckedChanged
        If rbt_eletrotecnica.Checked Then
            PopulateSubjects(electricalEngSubjects)
        End If
    End Sub

    ''' <summary>
    ''' Handles the CheckedChanged event for Mechanics RadioButton.
    ''' Populates the ComboBox with relevant subjects.
    ''' </summary>
    Private Sub rbt_mech_CheckedChanged(sender As Object, e As EventArgs) Handles rbt_mecanica.CheckedChanged
        If rbt_mecanica.Checked Then
            PopulateSubjects(mechanicsSubjects)
        End If
    End Sub

    ''' <summary>
    ''' Populates the subjects ComboBox based on the selected course.
    ''' </summary>
    ''' <param name="subjects">Array of subjects to populate.</param>
    Private Sub PopulateSubjects(subjects As String())
        cbx_disciplina.Items.Clear()
        cbx_disciplina.Items.AddRange(subjects)
    End Sub

    ''' <summary>
    ''' Handles the Click event for the Register button.
    ''' Validates input, registers the student, and updates the ListView and label.
    ''' </summary>
    Private Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btn_confirmar.Click
        ' Retrieve input values
        Dim studentName As String = txt_aluno.Text.Trim()
        Dim selectedCourse As String = GetSelectedCourse()
        Dim selectedSubject As String = cbx_disciplina.SelectedItem?.ToString()

        ' Validate fields using ValidationModule
        If Not Validacao.ValidateFields(studentName, selectedCourse, selectedSubject) Then
            MessageBox.Show("Por favor, preencha todos os campos.", "Erro de validação.", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return
        End If

        ' All fields are valid; proceed with registration
        MessageBox.Show("Cadastrado com êxito.", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)

        ' Add to ListView
        Dim listItem As New ListViewItem(studentName)
        listItem.SubItems.Add(selectedCourse)
        listItem.SubItems.Add(selectedSubject)
        listViewCursos.Items.Add(listItem)

        ' Update enrolled count
        enrolledCount += 1
        lbl_total_alunos.Text = $"Total Alunos: {enrolledCount}"

        ' Clear fields using CleanModule
        limpar.ClearFields(txt_aluno, cbx_disciplina, rbt_dev, rbt_eletrotecnica, rbt_mecanica)
    End Sub

    ''' <summary>
    ''' Retrieves the selected course based on the checked RadioButton.
    ''' </summary>
    ''' <returns>The name of the selected course.</returns>
    Private Function GetSelectedCourse() As String
        If rbt_dev.Checked Then
            Return rbt_dev.Text
        ElseIf rbt_eletrotecnica.Checked Then
            Return rbt_eletrotecnica.Text
        ElseIf rbt_mecanica.Checked Then
            Return rbt_mecanica.Text
        Else
            Return ""
        End If
    End Function

    ''' <summary>
    ''' Optionally, enable the Register button only when all fields are filled.
    ''' This provides real-time feedback to the user.
    ''' </summary>
    Private Sub InputFieldsChanged(sender As Object, e As EventArgs) _
        Handles txt_aluno.TextChanged, cbx_disciplina.SelectedIndexChanged, rbt_dev.CheckedChanged, rbt_eletrotecnica.CheckedChanged, rbt_mecanica.CheckedChanged

        Dim studentName As String = txt_aluno.Text.Trim()
        Dim selectedCourse As String = GetSelectedCourse()
        Dim selectedSubject As String = cbx_disciplina.SelectedItem?.ToString()

        btn_confirmar.Enabled = Validacao.ValidateFields(studentName, selectedCourse, selectedSubject)
    End Sub

    Private Sub btn_alterar_Click(sender As Object, e As EventArgs) Handles btn_alterar.Click

    End Sub
End Class