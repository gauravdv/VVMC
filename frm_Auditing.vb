Imports System.IO.Ports
Imports PC2M.PC2M
Imports System
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class frm_Auditing

    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader

    Dim Path_Ticket As String
    Dim Path_WayBill As String
    Dim WayBillMstDetail(9) As String
    Dim machineType As String
    Dim etmNumberValue As String
    Dim sessId As Integer = 12398
    Public Shared TotalCollection As String
    Public Shared WayBillText As String

    Dim dollarData As Integer = 36
    Dim ticketData As Integer = 68
    Dim wayBillData As Integer = 66
    Dim ticketEraseData As Integer = 69
    Dim tcketEraseData1 As Integer = 46
    Dim wayBillEraseData As Integer = 67
    Dim wayBillUpload As Integer = 65
    Dim cardTopUp As Integer = 78
    Dim endOfString As Integer = 4

    Dim db_Server As String
    Dim db_Name As String
    Dim db_UserID As String
    Dim db_Password As String
    'Load frm_Auditing
    Private Sub frm_Auditing_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            cmbPortList.Items.Add(sp)
        Next
        db_connection()
        ' btn_UploadTicket.Enabled = False
        btn_CollectCardData.Enabled = False
        btn_UploadCardData.Enabled = False
        btn_CollectCash.Enabled = False
        btn_EraseTicket.Enabled = False
        btn_DeleteBill.Enabled = False
    End Sub

    'For Database Connection
    'Public Sub DBconnect()
    '    'Test Data Base ----------------------------------------------------
    '    Dim DatabaseName As String = "db_vvmt_ticketing"
    '    Dim server As String = "192.168.1.253"
    '    Dim userName As String = "root"
    '    Dim password As String = "mysql@123"
    '    ''KMT----------------------------------------------------------------
    '    'Dim DatabaseName As String = "db_vvmt_ticketing"
    '    'Dim server As String = "192.168.0.251"
    '    'Dim userName As String = "root"
    '    'Dim password As String = "p@ssw0rd"

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

    'For Database Connection
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

    'Download Ticket & Display
    Private Sub Download_Ticket()
        Dim strRecFile As String
        Dim objReader As System.IO.StreamReader
        Dim tStr As String
        Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        Dim TextLine As String

        If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\TicketData") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\TicketData")
        strRecFile = System.String.Concat(My.Application.Info.DirectoryPath, "\TicketData\TicketData" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        Path_Ticket = strRecFile
        If strRecFile.Length > 1 Then
            Try
                Dim tGetFile As New PC2M
                tGetFile.DownLoad(strRecFile, "D", cmbPortList.Text)
                If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\TicketData\TicketData" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")) Then
                    objReader = New System.IO.StreamReader(strRecFile)
                    tStr = Replace(objReader.ReadToEnd, "@", "")
                    objReader.Close()

                    If System.IO.File.Exists(Path_Ticket) = True Then
                        Dim objReaders As New System.IO.StreamReader(Path_Ticket)
                        Do While objReaders.Peek() <> -1
                            TextLine = TextLine & objReaders.ReadLine() & vbNewLine
                        Loop
                        txt_Ticket.Text = TextLine
                        btn_UploadTicket.Enabled = True
                    Else
                        MessageBox.Show("File Does Not Exist")
                    End If

                End If
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If

    End Sub

    'Download WayBill & Display
    Private Sub Download_WayBill()
        Dim strRecFile As String
        Dim objReader As System.IO.StreamReader
        Dim tStr As String
        Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        'Dim txtpath As String = txtFilePath & "\" + "WayBill" + "\" + "WayBill.txt"
        Dim TextLine As String
        'Dim FileName As String
        ' Dim Path As String
        If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\WayBill") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\WayBill")
        strRecFile = System.String.Concat(My.Application.Info.DirectoryPath, "\WayBill\WayBill" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        Path_WayBill = strRecFile
        If strRecFile.Length > 1 Then
            Try
                Dim tGetFile As New PC2M
                tGetFile.DownLoad(strRecFile, "B", cmbPortList.Text)
                If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\WayBill\WayBill" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")) Then
                    objReader = New System.IO.StreamReader(strRecFile)
                    tStr = Replace(objReader.ReadToEnd, "@", "")
                    objReader.Close()

                    'FileName = txtpath.Replace("file:\", "")
                    If System.IO.File.Exists(Path_WayBill) = True Then
                        Dim objReaders As New System.IO.StreamReader(Path_WayBill)
                        Do While objReaders.Peek() <> -1
                            TextLine = TextLine & objReaders.ReadLine() & vbNewLine
                        Loop
                        txt_WayBill.Text = TextLine
                    Else
                        MessageBox.Show("File Does Not Exist")
                    End If

                End If
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If

    End Sub

    'Upload Ticket Data 
    'Get Master Data
    Private Sub get_CollectTicket()
        Dim TextLine As String
        Dim rLine As String
        Dim Sql As String
        Dim _fldv_waybill_no As String
        Dim _fldv_conductor_name As String
        Dim _fldv_conductor_employee_code As String
        Dim _fldv_driver_employee_code As String
        Dim _fldv_driver_name As String
        Dim _fldv_vehicle_number As String
        Dim _fldv_division_name As String
        Dim _fldv_division_code As String
        Dim _fldv_depot_name As String
        Dim _fldv_depot_code As String
        Dim _fldv_schedule As String
        Dim _fldv_etm_number As String
        Dim _fldv_waybill_date_time As String
        Dim _fldv_ticket_data As String
        Dim _fldv_vendor_name As String
        Dim _fldc_status As String
        Dim _fldi_user_id As String
        Dim _flddt_last_upd_date As String
        btn_UploadTicket.Enabled = False

        Dim WahyBill As String = txt_WayBill.Text
        WayBillText = txt_WayBill.Text
        If Not WahyBill.Equals("") Then
            rLine = WahyBill.Replace("$", "")
            get_EtimDetails() 'Get Machin Type

            If machineType = "BALAJI" Then
                _fldv_waybill_no = Mid(rLine, 1, 7)
                _fldv_conductor_employee_code = Mid(rLine, 8, 10)
                _fldv_driver_employee_code = Mid(rLine, 18, 10)
                _fldv_vehicle_number = Mid(rLine, 28, 10)
                _fldv_division_name = Mid(rLine, 38, 9)
                _fldv_division_code = Mid(rLine, 47, 2)
                _fldv_depot_name = Mid(rLine, 49, 9)
                _fldv_depot_code = Mid(rLine, 58, 2)
                _fldv_schedule = Mid(rLine, 60, 4)
                _fldv_etm_number = Mid(rLine, 64, 3)
                _fldv_waybill_date_time = Mid(rLine, 94, 109)
            Else
                _fldv_waybill_no = Mid(rLine, 1, 7)
                _fldv_conductor_employee_code = Mid(rLine, 8, 10)
                _fldv_driver_employee_code = Mid(rLine, 18, 10)
                _fldv_vehicle_number = Mid(rLine, 28, 10)
                _fldv_division_name = Mid(rLine, 38, 9)
                _fldv_division_code = Mid(rLine, 49, 9)
                _fldv_depot_name = Mid(rLine, 58, 2)
                _fldv_depot_code = Mid(rLine, 60, 4)
                _fldv_schedule = Mid(rLine, 64, 3)
                _fldv_etm_number = Mid(rLine, 67, 16)
            End If

            get_WayBillMast(_fldv_conductor_name, _fldv_driver_name, _fldv_waybill_no)

            Dim TicketData1 As String = txt_Ticket.Text
            Dim FullTicketData1 As String
            If Not TicketData1.Equals("") Then
                Dim arrayOfTicketData() As String = TicketData1.Split(vbLf)
                Dim CountLine As Integer = arrayOfTicketData.Length
                CountLine = CountLine - 2 ' Remove Last Two Line
                FullTicketData1 = ""
                Dim NoLine As Integer = 0
                Dim i As Integer = 0
                Dim j As Integer = 0
                Do While (i < CountLine)
                    Try
                        j = 0
                        FullTicketData1 = arrayOfTicketData(i)
                        FullTicketData1 = FullTicketData1.Replace("$", "")
                        FullTicketData1 = FullTicketData1.Replace("" & vbLf, "")
                        FullTicketData1 = FullTicketData1.Replace("" & vbCr, "")
                        _fldv_ticket_data = FullTicketData1
                        _fldv_vendor_name = machineType
                        _fldc_status = "N"
                        _fldi_user_id = sessId
                        _flddt_last_upd_date = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
                        If Not ((FullTicketData1.Equals("")) AndAlso (FullTicketData1.Length > 1)) Then
                            i = (i + 1)
                            If (i = 10000) Then
                                Try
                                    Sql = "INSERT INTO tbl_waybill_ticket_handheld_data_dummy (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,
                                                       fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,
                                                       fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES (@fldv_waybill_no,@fldv_conductor_name,
                                                       @fldv_driver_name,@fldv_vehicle_number,@fldv_division_name,@fldv_division_code,@fldv_depot_name,@fldv_depot_code,@fldv_schedule,
                                                       @fldv_etm_number,@fldv_waybill_date_time,@fldv_ticket_data,@fldv_vendor_name,@fldc_status,@fldi_user_id,@flddt_last_upd_date)"

                                    conn.Open()
                                    dbcomm = New MySqlCommand(Sql, conn)
                                    dbcomm.Parameters.AddWithValue("@fldv_conductor_name", _fldv_conductor_employee_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_driver_name", _fldv_driver_employee_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_vehicle_number", _fldv_vehicle_number)
                                    dbcomm.Parameters.AddWithValue("@fldv_division_name", _fldv_division_name)
                                    dbcomm.Parameters.AddWithValue("@fldv_division_code", _fldv_division_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_depot_name", _fldv_depot_name)
                                    dbcomm.Parameters.AddWithValue("@fldv_depot_code", _fldv_depot_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_schedule", _fldv_schedule)
                                    dbcomm.Parameters.AddWithValue("@fldv_etm_number", _fldv_etm_number)
                                    dbcomm.Parameters.AddWithValue("@fldv_waybill_date_time", _fldv_waybill_date_time)
                                    dbcomm.Parameters.AddWithValue("@fldv_ticket_data", _fldv_ticket_data)
                                    dbcomm.Parameters.AddWithValue("@fldv_vendor_name", _fldv_vendor_name)
                                    dbcomm.Parameters.AddWithValue("@fldc_status", _fldc_status)
                                    dbcomm.Parameters.AddWithValue("@fldi_user_id", _fldi_user_id)
                                    dbcomm.Parameters.AddWithValue("@flddt_last_upd_date", _flddt_last_upd_date)
                                    dbcomm.ExecuteNonQuery()
                                    conn.Close()
                                    'i = 0
                                Catch ex As Exception
                                    MsgBox("unable to add" + ex.Message)
                                End Try
                            End If

                            If (i < 10000) Then
                                Try
                                    Sql = "INSERT INTO tbl_waybill_ticket_handheld_data_dummy (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,
                                                       fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,
                                                       fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES (@fldv_waybill_no,@fldv_conductor_name,
                                                       @fldv_driver_name,@fldv_vehicle_number,@fldv_division_name,@fldv_division_code,@fldv_depot_name,@fldv_depot_code,@fldv_schedule,
                                                       @fldv_etm_number,@fldv_waybill_date_time,@fldv_ticket_data,@fldv_vendor_name,@fldc_status,@fldi_user_id,@flddt_last_upd_date)"

                                    conn.Open()
                                    dbcomm = New MySqlCommand(Sql, conn)
                                    dbcomm.Parameters.AddWithValue("@fldv_waybill_no", _fldv_waybill_no)
                                    dbcomm.Parameters.AddWithValue("@fldv_conductor_name", _fldv_conductor_employee_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_driver_name", _fldv_driver_employee_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_vehicle_number", _fldv_vehicle_number)
                                    dbcomm.Parameters.AddWithValue("@fldv_division_name", _fldv_division_name)
                                    dbcomm.Parameters.AddWithValue("@fldv_division_code", _fldv_division_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_depot_name", _fldv_depot_name)
                                    dbcomm.Parameters.AddWithValue("@fldv_depot_code", _fldv_depot_code)
                                    dbcomm.Parameters.AddWithValue("@fldv_schedule", _fldv_schedule)
                                    dbcomm.Parameters.AddWithValue("@fldv_etm_number", _fldv_etm_number)
                                    dbcomm.Parameters.AddWithValue("@fldv_waybill_date_time", _fldv_waybill_date_time)
                                    dbcomm.Parameters.AddWithValue("@fldv_ticket_data", _fldv_ticket_data)
                                    dbcomm.Parameters.AddWithValue("@fldv_vendor_name", _fldv_vendor_name)
                                    dbcomm.Parameters.AddWithValue("@fldc_status", _fldc_status)
                                    dbcomm.Parameters.AddWithValue("@fldi_user_id", _fldi_user_id)
                                    dbcomm.Parameters.AddWithValue("@flddt_last_upd_date", _flddt_last_upd_date)
                                    dbcomm.ExecuteNonQuery()
                                    conn.Close()
                                    'i = 0
                                Catch ex As Exception
                                    MsgBox("unable to add" + ex.Message)
                                End Try
                            End If

                        End If
                    Catch ex As Exception
                        MsgBox("unable to add" + ex.Message)
                        btn_UploadTicket.Enabled = True
                    End Try

                Loop
                MessageBox.Show("Ticket Upload successfully.....")
            End If
        End If

        'If System.IO.File.Exists(Path_WayBill) = True Then
        '    Dim objReaders As New System.IO.StreamReader(Path_WayBill)
        '    Do While objReaders.Peek() <> -1
        '        TextLine = TextLine & objReaders.ReadLine() & vbNewLine
        '        rLine = TextLine.Replace("$", "")


        '    Loop
        '    'txt_WayBill.Text = TextLine

        'Else
        '    MessageBox.Show("File Does Not Exist")
        'End If
    End Sub

    'WayBill Master
    Public Function get_WayBillMast(ByRef _fldv_conductor_name As String, ByRef _fldv_driver_name As String, ByRef _fldv_waybill_no As String)
        Dim Sql As String
        If Not _fldv_waybill_no = "" Then
            Sql = "select fldv_conductor_name,fldv_driver_name  from  tbl_waybill_mst where fldv_waybill_no = '" + _fldv_waybill_no + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    _fldv_conductor_name = dbread.GetString("fldv_conductor_name")
                    _fldv_driver_name = dbread.GetString("fldv_driver_name")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
        Return _fldv_conductor_name
    End Function

    'Get MAchin Detail
    Private Sub get_EtimDetails()
        Dim fileReader As String
        Dim TextLine As String
        Dim rLine As String
        If System.IO.File.Exists(Path_WayBill) = True Then
            fileReader = My.Computer.FileSystem.ReadAllText(Path_WayBill)
            rLine = fileReader.Replace(" ", "")
            Dim SearchForThis As String = "BALAJI"
            'Dim FirstCharacter As Integer = rLine.IndexOf(SearchForThis)
            'Dim _fldv_waybill_no As String = Mid(rLine, 64, 66)
            If rLine.Contains("BALAJI") Then
                machineType = "BALAJI"
                etmNumberValue = Mid(rLine, 64, 6)
            Else
                machineType = "SAI"
                etmNumberValue = Mid(rLine, 64, 6)
            End If
        Else
            MessageBox.Show("File Does Not Exist")
        End If
    End Sub

    'Calculate Fare
    Private Sub CalculateTotalFare()

        txt_TotalCollection.Text = ""
        txt_TotalTicketCollection.Text = ""
        txt_TotalTopupCollection.Text = ""
        'txtAmtDifference.setText("");
        Dim TicketData As String = txt_Ticket.Text
        If Not TicketData.Equals("") Then
            Dim arrayOfTicketData() As String = TicketData.Split(vbLf)
            Dim i As Integer = arrayOfTicketData.Length
            Dim TicketLine As String = ""
            Dim str3 As String = ""
            Dim CalPaisa As Single = 0.0F
            Dim CalRs As Single = 0.0F
            Dim f3 As Single = 0.0F
            Dim j As Integer = 0
            Do While (j < i)

                Try
                    TicketLine = arrayOfTicketData(j)
                    TicketLine = TicketLine.Replace("$", "")
                    TicketLine = TicketLine.Replace("" & vbLf, "")
                    TicketLine = TicketLine.Replace("" & vbCr, "")
                    get_EtimDetails()
                    If Not ((TicketLine = String.Empty) AndAlso (TicketLine.Length > 1)) Then
                        If machineType = "BALAJI" Then
                            str3 = Mid(TicketLine, 16, 4)
                        Else
                            str3 = Mid(TicketLine, 8, 4)
                        End If
                    End If
                    If str3 = "" Then
                    Else
                        If Not str3 = "CARD" Then
                            If machineType = "BALAJI" Then
                                CalPaisa = (CalPaisa + Convert.ToInt64(Mid(TicketLine, 45, 7)))
                            Else
                                CalPaisa = (CalPaisa + Convert.ToInt64(Mid(TicketLine, 37, 7)))
                            End If
                        End If
                    End If

                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
                j = (j + 1)

            Loop
            CalRs = (CalPaisa / 100.0)
            txt_TotalTicketCollection.Text = CalRs
            txt_TotalCollection.Text = CalRs
            'CalculateTotalFare()
        End If


    End Sub

    'Erase WayBill & Ticket
    Private Sub Erase_WaybillTicket()
        Dim strSendFileName As String
        strSendFileName = System.String.Concat(My.Application.Info.DirectoryPath, "\Erase.txt")
        If strSendFileName.Length > 1 Then
            Try
                Dim tSendFile As New PC2M
                tSendFile.UploadData(strSendFileName, cmbPortList.Text)
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub


    Private Sub get_CollectTicket2()
        Dim TextLine As String
        Dim Sql As String

        Dim txtValue As String = txt_Ticket.Text
        If txtValue = "" Then
            MessageBox.Show("Collect Ticket First")
        Else
            Dim WayBillNo As String = txtValue.Substring(0, 7)

            If WayBillNo = "" Then
                Sql = "select fldv_waybill_no,fldv_conductor_employee_code ,fldv_driver_employee_code ,fldv_vehicle_number,fldv_division_name,
                                fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_created_date 
                                from tbl_waybill_mst where  fldc_status = 'Y' and fldc_waybill_open_close_status = 'N' order by fldv_waybill_no asc"

            Else
                Dim WayBill_ As String = "0487529"
                Sql = "select fldv_waybill_no,fldv_conductor_employee_code ,fldv_driver_employee_code ,fldv_vehicle_number,fldv_division_name,
                                fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_created_date 
                                from tbl_waybill_mst where fldv_waybill_no = '" + WayBill_ + "' and fldc_status = 'Y' and fldc_waybill_open_close_status = 'N'"

            End If
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    '_fldv_conductor_employee_code = dbread.GetString("fldv_waybill_no")
                    WayBillMstDetail(0) = dbread.GetString("fldv_conductor_employee_code")
                    WayBillMstDetail(1) = dbread.GetString("fldv_driver_employee_code")
                    WayBillMstDetail(2) = dbread.GetString("fldv_vehicle_number")
                    WayBillMstDetail(3) = dbread.GetString("fldv_division_name")
                    WayBillMstDetail(4) = dbread.GetString("fldv_division_code")
                    WayBillMstDetail(5) = dbread.GetString("fldv_depot_name")
                    WayBillMstDetail(6) = dbread.GetString("fldv_depot_code")
                    WayBillMstDetail(7) = dbread.GetString("fldv_schedule")
                    WayBillMstDetail(8) = dbread.GetString("fldv_etm_number")
                    WayBillMstDetail(9) = dbread.GetString("fldv_waybill_created_date")
                End While
                conn.Close()
            Catch ex As Exception
                MsgBox("unable to add" + ex.Message)
            End Try
        End If
    End Sub
    Public Sub connect()
        Try
            Dim Str As String
            Dim DataReceived As String
            ' GetSerialPortNames()
            Str = cmbPortList.SelectedItem
            'SendSerialData("$B")
            Dim strTicket = ReceiveSerialData()
            'MessageBox.Show(strTicket)
            Dim _serialPort As SerialPort
            _serialPort = New SerialPort()

            _serialPort.PortName = Str   'Assign the port name to the MyCOMPort object
            _serialPort.BaudRate = 115200      'Assign the Baudrate to the MyCOMPort object
            _serialPort.Parity = Parity.None   'Parity bits = none  
            _serialPort.DataBits = 8             'No of Data bits = 8
            _serialPort.StopBits = StopBits.One  'No of Stop bits = 1
            _serialPort.Open()               ' Open the port
            _serialPort.Write("$B")           ' Write an ascii "A"
            DataReceived = _serialPort.ReadLine()
            MessageBox.Show(DataReceived)
            _serialPort.Close()              ' Close port
        Catch ex As Exception
            MessageBox.Show("Select Serial Port", ex.ToString())
        End Try
    End Sub
    Sub SendSerialData(ByVal data As String)
        Using com1 As IO.Ports.SerialPort =
            My.Computer.Ports.OpenSerialPort("COM3")
            com1.WriteLine(data)
        End Using
    End Sub
    Sub GetSerialPortNames()
        ' Show all available COM ports.
        For Each sp As String In My.Computer.Ports.SerialPortNames
            MessageBox.Show(sp)
        Next
    End Sub
    Function ReceiveSerialData() As String
        ' Receive strings from a serial port.
        Dim returnStr As String = ""

        Dim com1 As IO.Ports.SerialPort = Nothing
        Try
            com1 = My.Computer.Ports.OpenSerialPort("COM3")
            com1.WriteLine("$B")
            com1.ReadTimeout = 10000
            Do
                Dim Incoming As String = com1.ReadLine()
                If Incoming Is Nothing Then
                    Exit Do
                Else
                    returnStr &= Incoming & vbCrLf
                End If
            Loop
        Catch ex As TimeoutException
            returnStr = "Error: Serial Port read timed out."
            MessageBox.Show(returnStr)
        Finally
            If com1 IsNot Nothing Then com1.Close()
        End Try

        Return returnStr
    End Function
    Private Sub Get_CollectWayBill()
        'commandString = wayBillData
        txt_Ticket.Text = ""
        txt_WayBill.Text = ""
        txt_SmartCard.Text = ""
        txt_TotalCollection.Text = ""
        'txtAmtDifference.setText("")
        txt_TotalTopupCollection.Text = ""
        txt_TotalTicketCollection.Text = ""
        btn_UploadTicket.Enabled = False
        btn_CollectTicket.Enabled = False
        btn_UploadCardData.Enabled = False
        btn_CollectCash.Enabled = False
        'dataType = "WayBill"
        Try
            connect()
            'If (initIOStream() = True) Then
            '    initListener()
            '    Dim i As Integer = (CChar((dollarData)))
            '    output.write(i)
            'End If
        Catch ex As Exception
        End Try
    End Sub

    'collect Waybill
    Private Sub btn_CollectWayBill_Click(sender As Object, e As EventArgs) Handles btn_CollectWayBill.Click
        Download_WayBill()
        btn_DeleteBill.Enabled = True
    End Sub

    'Collect Ticket
    Private Sub btn_CollectTicket_Click(sender As Object, e As EventArgs) Handles btn_CollectTicket.Click
        Download_Ticket()
        CalculateTotalFare()
        btn_EraseTicket.Enabled = True
    End Sub

    Private Sub btn_UploadTicket_Click(sender As Object, e As EventArgs) Handles btn_UploadTicket.Click
        get_CollectTicket()
        get_EtimDetails()
        TotalCollection = txt_TotalCollection.Text
        Dim CollectCash = New frm_CollectCash
        CollectCash.Show()
    End Sub

    Private Sub btn_EraseTicket_Click(sender As Object, e As EventArgs) Handles btn_EraseTicket.Click
        Erase_WaybillTicket()
    End Sub

    Private Sub btn_DeleteBill_Click(sender As Object, e As EventArgs) Handles btn_DeleteBill.Click
        Erase_WaybillTicket()
    End Sub


End Class