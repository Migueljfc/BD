Imports System.Data.SqlClient

Public Class Form1


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim dbServer As String = TextBox1.Text
        Dim dbName As String = TextBox2.Text
        Dim username As String = TextBox2.Text
        Dim userPass As String = TextBox3.Text
        TestDBConnection(dbServer, dbName, username, userPass)

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim dbServer As String = TextBox1.Text
        Dim dbName As String = TextBox2.Text
        Dim username As String = TextBox2.Text
        Dim userPass As String = TextBox3.Text
        GetDBContent(dbServer, dbName, username, userPass)
    End Sub

    Private Sub TestDBConnection(ByVal dbServer As String, ByVal dbName As String, ByVal username As String, ByVal userPass As String)
        Dim CN As New SqlConnection("Data Source = " + dbServer + " ;" + "Initial Catalog = " + dbName + " ; uid=" + username + " ;" + "password = " + userPass)
        Try
            CN.Open()
            If CN.State = ConnectionState.Open Then
                MsgBox("Sucessfull connection to database " + CN.Database + " on the " + CN.DataSource + " server ", MsgBoxStyle.OkOnly, "Connection Test")
            End If
        Catch ex As Exception
            MsgBox("FAILED TO OPEN CONNECTION TO DATABASE DUE TO THE FOLLOWING ERRO" + vbCrLf + ex.Message, MsgBoxStyle.Critical, "Connection Test")
        End Try
        If CN.State = ConnectionState.Open Then
            CN.Close()
        End If
    End Sub
    Private Sub GetDBContent(ByVal dbServer As String, ByVal dbName As String, ByVal username As String, ByVal userPass As String)
        Dim CN As New SqlConnection("Data Source = " + dbServer + " ;" + "Initial Catalog = " + dbName + " ; uid=" + username + " ;" + "password = " + userPass)
        Try
            CN.Open()
            If CN.State = ConnectionState.Open Then
                MsgBox(GetTableContent(CN), MsgBoxStyle.OkOnly, "Dump Hello Table")
            End If
        Catch ex As Exception
            MsgBox("FAILED TO OPEN CONNECTION TO DATABASE DUE TO THE FOLLOWING ERRO" + vbCrLf + ex.Message, MsgBoxStyle.Critical, "Dump Hello Table")
        End Try
        If CN.State = ConnectionState.Open Then
            CN.Close()
        End If
    End Sub

    Private Function GetTableContent(ByVal CN As SqlConnection) As String
        If CN.State = ConnectionState.Closed Then Return ""

        Dim str As String = ""
        Dim cnt As Integer = 1
        Dim sqlcmd As New SqlCommand("SELECT * FROM Hello", CN)
        Dim reader As SqlDataReader
        reader = sqlcmd.ExecuteReader
        While reader.Read
            str += cnt.ToString + " - " + Convert.ToString(reader.Item("MsgID")) + ", "
            str += Convert.ToString(reader.Item("MsgSubject"))
            str += vbCrLf
            cnt += 1
        End While
        Return str
    End Function

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class
