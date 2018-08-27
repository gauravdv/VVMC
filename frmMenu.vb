Imports PC2M.PC2M
Imports MySql.Data.MySqlClient
Imports System.IO

Public Class frmMenu

    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader

    Private Sub btnSendFile_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSendFile.Click
        Dim strSendFileName As String

        OpenFileDialog1.ShowDialog()

        strSendFileName = OpenFileDialog1.FileName

        If strSendFileName.Length > 1 Then
            Try
                Dim tSendFile As New PC2M
                Call tSendFile.UploadData(strSendFileName, CMBPORTNO.Text)

            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub frmMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            CMBPORTNO.Items.Add(sp)
        Next
    End Sub

    Private Sub btnDownLoad_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDownLoad.Click
        Dim strRecFile As String
        Dim objReader As System.IO.StreamReader
        Dim tStr As String
        If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\download") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\download")
        strRecFile = System.String.Concat(My.Application.Info.DirectoryPath, "\download\outputdata" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        If strRecFile.Length > 1 Then
            Try
                Dim tGetFile As New PC2M
                tGetFile.DownLoad(strRecFile, "B", CMBPORTNO.Text)
                If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\download\outputdata" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")) Then
                    If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\download\outputdata" & Format(Now, "dd_MM_yyyy_hh_mm") & ".csv")) Then
                        IO.File.Delete(System.String.Concat(My.Application.Info.DirectoryPath, "\download\outputdata" & Format(Now, "dd_MM_yyyy_hh_mm") & ".csv"))
                    End If
                    objReader = New System.IO.StreamReader(strRecFile)
                    tStr = Replace(objReader.ReadToEnd, "@", "")
                    objReader.Close()
                    IO.File.AppendAllText(System.String.Concat(My.Application.Info.DirectoryPath, "\download\outputdata" & Format(Now, "dd_MM_yyyy_hh_mm") & ".csv"), tStr)
                End If
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub BtnErase_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnErase.Click
        Dim strSendFileName As String
        strSendFileName = System.String.Concat(My.Application.Info.DirectoryPath, "\Erase.txt")
        If strSendFileName.Length > 1 Then
            Try
                Dim tSendFile As New PC2M
                tSendFile.UploadData(strSendFileName, CMBPORTNO.Text)
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub btnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click
        Me.Close()
    End Sub

    'For Database Connection
    Public Sub DBconnect()
        Dim DatabaseName As String = "db_vvmt_ticketing"
        Dim server As String = "192.168.1.253"
        Dim userName As String = "root"
        Dim password As String = "mysql@123"
        Dim test As String = ""
        If Not conn Is Nothing Then conn.Close()
        conn.ConnectionString = String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", server, userName, password, DatabaseName)
        Try
            conn.Open()
            MsgBox("Connected")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    'Read Download File And Push Into DataBase
    Private Sub ReadFile()
        Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        Dim txtpath As String = txtFilePath & "\" + "download"
        Dim fileEntries As String() = Directory.GetFiles("download", "*.txt")
        Dim fileNames As String
        Dim TextLine As String
        Dim Sql As String

        For Each fileNames In fileEntries
            If System.IO.File.Exists(fileNames) = True Then
                Dim objReader As New System.IO.StreamReader(fileNames)
                Do While objReader.Peek() <> -1
                    TextLine = objReader.ReadLine()
                    Dim words As String() = TextLine.Split(New Char() {" "c})
                    Dim word As String
                    For Each word In words
                        Dim WayBill_No As String = words(0).ToString()
                        Dim Word_2 As String = words(1).ToString()
                        Dim ABC As String = "0487526"
                        Sql = "SELECT fldv_waybill_no FROM tbl_waybill_mst WHERE fldv_waybill_no = '" + WayBill_No + "'"
                        Try
                            conn.Open()
                            dbcomm = New MySqlCommand(Sql, conn)
                            dbread = dbcomm.ExecuteReader()
                            While dbread.Read

                            End While
                            conn.Close()
                        Catch ex As Exception
                            MsgBox("unable to add" + ex.Message)

                        End Try
                    Next
                Loop
                'Textbox1.Text = TextLine
            Else
                MessageBox.Show("File Does Not Exist")
            End If
        Next
    End Sub

    'btn_Push
    Private Sub btn_Push_Click(sender As Object, e As EventArgs) Handles btn_Push.Click
        'ReadFile()
        'getConductorDetails()

    End Sub

    Public Sub getConductorDetails()
        Dim _fldi_conductor_id As String
        Dim Sql As String

        Sql = "select fldi_conductor_id,fldv_conductor_name,fldv_employee_code  from tbl_conductor_mst where fldc_st" +
            "atus ='Y' order by fldv_employee_code"
        Try
            conn.Open()
            dbcomm = New MySqlCommand(Sql, conn)
            dbread = dbcomm.ExecuteReader()
            While dbread.Read()
                _fldi_conductor_id = dbread.GetString("fldi_conductor_id")
            End While
            conn.Close()
        Catch ex As Exception
            MsgBox("unable to add" + ex.Message)
        End Try
    End Sub

    'btn_Auditing
    Private Sub btn_Auditing_Click(sender As Object, e As EventArgs) Handles btn_Auditing.Click
        Dim Auditing = New frm_Auditing
        Auditing.Show()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Master = New frm_Master
        Master.Show()
    End Sub
End Class


