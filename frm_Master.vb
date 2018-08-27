Imports PC2M.PC2M
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class frm_Master
    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader
    Dim dbAdp As MySqlDataAdapter
    Dim dbTab As New DataTable
    Dim WayBill_txtPath As String

    Dim db_Server As String
    Dim db_Name As String
    Dim db_UserID As String
    Dim db_Password As String


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


    'Get WayBill Deatil
    Private Sub get_WayBillDetail()
        Dim Sql As String
        Dim rowCount As Integer = 0
        Dim WayBillNo As String = txt_WayBill.Text
        Dim conductor_Code As String
        Dim driver_Code As String
        Dim vehicle_number As String
        Dim etim_id As String
        Dim division_name As String
        Dim division_code As String
        Dim depot_name As String
        Dim depot_code As String
        Dim schedule As String
        Dim waybill_created_date As String
        Dim Doller As String = "$"
        Dim SCHAR As String = "A"
        Dim Last As Char = "13"

        If Not WayBillNo = "" Then
            Sql = "SELECT fldv_waybill_no, 	fldv_conductor_employee_code, fldv_driver_employee_code, fldv_vehicle_number, fldi_etim_id, fldv_division_name, 
                    fldv_division_code, fldv_depot_name, fldv_depot_code, fldv_schedule, fldv_waybill_created_date FROM  tbl_waybill_mst
                    WHERE 	fldv_waybill_no = '" + WayBillNo + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    rowCount += 1
                    conductor_Code = dbread.GetString("fldv_conductor_employee_code")
                    driver_Code = dbread.GetString("fldv_driver_employee_code")
                    vehicle_number = dbread.GetString("fldv_vehicle_number")
                    etim_id = dbread.GetString("fldi_etim_id")
                    division_name = dbread.GetString("fldv_division_name")
                    division_code = dbread.GetString("fldv_division_code")
                    depot_name = dbread.GetString("fldv_depot_name")
                    depot_code = dbread.GetString("fldv_depot_code")
                    schedule = dbread.GetString("fldv_schedule")
                    waybill_created_date = dbread.GetString("fldv_waybill_created_date")

                    'Grid View
                    dgv_WayBillDetails.Rows.Add(New String() {WayBillNo, conductor_Code, driver_Code, vehicle_number, etim_id, division_name, division_code,
                                   depot_name, depot_code, schedule, waybill_created_date})

                    'Write a Way Bill Text File 
                    'Write a Way Bill Text File 
                    If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\RaedWayBill") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\RaedWayBill")
                    WayBill_txtPath = System.String.Concat(My.Application.Info.DirectoryPath, "\RaedWayBill\06_WAYBILL_STRING" & ".txt")
                    Using sw As StreamWriter = File.CreateText(WayBill_txtPath)
                        Dim pad As String = " "
                        Dim Pad_conductor_Code As String = conductor_Code.PadRight(8, pad)
                        sw.WriteLine(Doller.PadRight(1, pad) + SCHAR.PadRight(1, pad) + WayBillNo.PadRight(6, pad) + conductor_Code.PadRight(10, pad) +
                                     driver_Code.PadRight(10, pad) + vehicle_number.PadRight(10, pad) + division_name.PadRight(9, pad) + division_code.PadRight(2, pad) +
                                     depot_name.PadRight(9, pad) + depot_name.PadRight(15, pad) + depot_code.PadRight(2, pad) + schedule.PadRight(4, pad) + etim_id.PadRight(3, pad) _
                                     + waybill_created_date.PadRight(16, pad) + "00.15".PadRight(5, pad) + "".PadRight(5, pad))
                    End Using

                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        Else
            MessageBox.Show("Eneter VAlid WayBill")
        End If



    End Sub

    'Push WayBill into Machine
    Private Sub Push_WayBill()
        If WayBill_txtPath.Length > 1 Then
            Try
                Dim tSendFile As New PC2M
                Call tSendFile.UploadData(WayBill_txtPath, cmbPortList.Text)
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub btn_GetWayBill_Click(sender As Object, e As EventArgs) Handles btn_GetWayBill.Click
        get_WayBillDetail()
    End Sub

    ''For Database Connection
    'Public Sub DBconnect()
    '    Dim DatabaseName As String = "db_vvmt_ticketing"
    '    Dim server As String = "192.168.1.253"
    '    Dim userName As String = "root"
    '    Dim password As String = "mysql@123"
    '    Dim test As String = ""
    '    If Not conn Is Nothing Then conn.Close()
    '    conn.ConnectionString = String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", server, userName, password, DatabaseName)
    '    Try
    '        conn.Open()
    '        'MsgBox("Connected")
    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try
    '    conn.Close()
    'End Sub

    'Get Combo Box Port
    Private Sub get_cmbPort()
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            cmbPortList.Items.Add(sp)
        Next
    End Sub

    'Load Form
    Private Sub frm_Master_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' DBconnect()
        db_connection()
        get_cmbPort()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Push_WayBill()
    End Sub
End Class