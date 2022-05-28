Imports WMPLib
Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Player As WindowsMediaPlayer = New WindowsMediaPlayer
        'assign the location of the song to be played
        Dim SongLocation = "C:\Users\migue\Music\tourada.mp3" 'any song you want to play
        'play the song
        Player.URL = SongLocation
        Player.controls.play()
        TextBox1.Show()
        Button1.Hide()
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub


    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Button1.Show()
        TextBox1.Hide()
    End Sub
End Class
