Imports PC2M.PC2M
Imports System.IO
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class frm_Login
    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader
    Dim dbAdp As MySqlDataAdapter
    Dim dbTab As New DataTable

    Dim db_Server As String
    Dim db_Name As String
    Dim db_UserID As String
    Dim db_Password As String

    Public Shared _UserName As String
    Public Shared _UserId As String

    'User Login
    Private Sub User_LogIn()
        If txt_Password.Text = "" And txt_UserName.Text = "" Then
            MessageBox.Show("UserName or Password can not be blank")
        Else
            Dim Sql As String
            Dim Pass As Byte() = System.Text.Encoding.UTF8.GetBytes(txt_Password.Text)
            Dim UserName As String = txt_UserName.Text
            Dim Password As String = Convert.ToBase64String(Pass)

            Sql = "SELECT fldi_user_id,fldv_user_name,fldv_user_pass FROM tbl_user_mst WHERE fldv_user_name = '" + UserName + "' AND fldv_user_pass = '" + Password + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                If dbread.HasRows() Then
                    'MessageBox.Show("Login successful!", "Welcome")
                    _UserName = UserName
                    Me.Hide()
                    Dim Menu = New frmMenu
                    frmMenu.Show()
                Else
                    MessageBox.Show("Oops! Login unsuccessful!")
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
    End Sub

    Private Sub db_connection()
        Get_DataBaseDetail()
        Dim myCSB As MySqlConnectionStringBuilder = New MySqlConnectionStringBuilder()
        myCSB.Server = db_Server
        myCSB.Database = db_Name
        myCSB.UserID = db_UserID
        myCSB.Password = db_Password
        conn = New MySqlConnection(myCSB.ConnectionString)
        'conn.ConnectionString = String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", db_Server, db_Name, db_UserID, db_Password)
        Try
            conn.Open()
            'MsgBox("Connected")
        Catch ex As Exception
            MsgBox("Mysql Not Connected" + ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub Get_DataBaseDetail()
        Dim txtFileName As String = "KnownFile.txt"
        Dim ExeLoaction As String = System.Reflection.Assembly.GetEntryAssembly().Location
        Dim txtFilePath As String = Path.GetDirectoryName(ExeLoaction)
        Dim txtpath As String = txtFilePath & "\" & txtFileName

        Try
            If File.Exists(txtpath) Then

                Using sr As StreamReader = New StreamReader(txtpath)

                    While sr.Peek() >= 0
                        Dim ss As String = sr.ReadLine()
                        Dim txtsplit As String() = ss.Split(";"c)
                        db_Server = txtsplit(0)
                        db_Name = txtsplit(1)
                        db_UserID = txtsplit(2)
                        db_Password = txtsplit(3)
                    End While
                End Using
            End If

        Catch e As Exception
            Console.WriteLine("Error: {0}", e.ToString())
        End Try
    End Sub

    'btn LogIn
    Private Sub btn_LogIn_Click(sender As Object, e As EventArgs) Handles btn_LogIn.Click
        btn_LogIn.Enabled = False
        User_LogIn()
        btn_LogIn.Enabled = True
    End Sub

    Private Sub Panel2_Paint(sender As Object, e As PaintEventArgs) Handles Panel2.Paint
        db_connection()
    End Sub

    Private Sub frm_Login_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        Application.Exit()
    End Sub


End Class