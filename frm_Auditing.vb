Imports System.IO.Ports
Imports PC2M.PC2M
Imports System
Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Text

Public Class frm_Auditing

    Dim objReader As System.IO.StreamReader
    Dim tStr As String
    Dim tRecCntr As Int64
    Dim tLenCntr As Int64
    Dim tDataCntr As Int64
    Public Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

    Dim value As Integer = 0

    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader

    Dim Path_Ticket As String
    Dim Path_WayBill As String
    Dim WayBillMstDetail(9) As String
    Dim machineType As String
    Dim etmNumberValue As String
    Dim sessId As Integer = 12398
    Public Shared TotalCollection As Int64
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

    Dim _UserName As String = frm_Login._UserName
    Dim _UserId As String

    Public Shared _ConductorEmpCOde As String
    Public Shared _ConducotWayBillNo As String

    'Login User id
    Private Sub login_UserId()
        Dim sql As String
        Dim UserName As String
        If Not lab_UserName.Text = "UserName" Then
            UserName = lab_UserName.Text
            sql = "SELECT fldi_user_id,fldv_user_name,fldv_user_pass FROM tbl_user_mst WHERE fldv_user_name = '" + UserName + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    _UserId = dbread.GetString("fldi_user_id")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        Else
            MessageBox.Show("Please Select Condutor")
        End If
    End Sub

    'WayBill Master
    Public Function get_WayBillMast(ByRef _fldv_conductor_name As String, ByRef _fldv_driver_name As String, ByRef _fldv_waybill_no As String, ByRef _fldv_waybill_created_date As String)
        Dim Sql As String
        If Not _fldv_waybill_no = "" Then
            Sql = "select fldv_conductor_name,fldv_driver_name,fldv_waybill_created_date  from  tbl_waybill_mst where fldv_waybill_no = '" + _fldv_waybill_no + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    _fldv_conductor_name = dbread.GetString("fldv_conductor_name")
                    _fldv_driver_name = dbread.GetString("fldv_driver_name")
                    _fldv_waybill_created_date = dbread.GetString("fldv_waybill_created_date")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
        Return _fldv_conductor_name
    End Function

    'Upload Ticket Data 
    'Get Master Data
    Private Sub get_CollectTicket_2()
        Dim TextLine As String
        Dim rLine As String
        Dim Sql As String
        Dim _fldv_waybill_no As String
        Dim _fldv_conductor_name As String
        Dim _fldv_waybill_created_date As String
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
            get_WayBillMast(_fldv_conductor_name, _fldv_driver_name, _fldv_waybill_no, _fldv_waybill_created_date)

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

            _ConductorEmpCOde = _fldv_conductor_employee_code
            _ConducotWayBillNo = _fldv_waybill_no

            Dim Rows As List(Of String) = New List(Of String)()

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
                                                       fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) 
                                                       VALUES (@fldv_waybill_no,@fldv_conductor_name,
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
                                    dbcomm.Parameters.AddWithValue("@fldv_waybill_date_time", _fldv_waybill_created_date)
                                    dbcomm.Parameters.AddWithValue("@fldv_ticket_data", _fldv_ticket_data)
                                    dbcomm.Parameters.AddWithValue("@fldv_vendor_name", _fldv_vendor_name)
                                    dbcomm.Parameters.AddWithValue("@fldc_status", _fldc_status)
                                    dbcomm.Parameters.AddWithValue("@fldi_user_id", _UserId)
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
                                                       fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) 
                                                       VALUES (@fldv_waybill_no,@fldv_conductor_name,
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
                                    dbcomm.Parameters.AddWithValue("@fldv_waybill_date_time", _fldv_waybill_created_date)
                                    dbcomm.Parameters.AddWithValue("@fldv_ticket_data", _fldv_ticket_data)
                                    dbcomm.Parameters.AddWithValue("@fldv_vendor_name", _fldv_vendor_name)
                                    dbcomm.Parameters.AddWithValue("@fldc_status", _fldc_status)
                                    dbcomm.Parameters.AddWithValue("@fldi_user_id", _UserId)
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

    Private Sub get_CollectTicket()
        Dim TextLine As String
        Dim rLine As String
        Dim Sql As String
        Dim _fldv_waybill_no As String
        Dim _fldv_conductor_name As String
        Dim _fldv_waybill_created_date As String
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

            _ConductorEmpCOde = _fldv_conductor_employee_code
            _ConducotWayBillNo = _fldv_waybill_no

            Dim TicketData1 As String = txt_Ticket.Text
            Dim FullTicketData1 As String
            If Not TicketData1.Equals("") Then
                Dim arrayOfTicketData() As String = TicketData1.Split(vbLf)
                Dim CountLine As Integer = arrayOfTicketData.Length
                ' CountLine = CountLine - 2 ' Remove Last Two Line ' When Used dll
                CountLine = CountLine - 1 ' with out dll
                FullTicketData1 = ""
                Dim NoLine As Integer = 0

                get_WayBillMast(_fldv_conductor_name, _fldv_driver_name, _fldv_waybill_no, _fldv_waybill_created_date)

                Dim sCommand As StringBuilder = New StringBuilder("INSERT INTO tbl_waybill_ticket_handheld_data_dummy (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,
                                                       fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,
                                                       fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES ")

                Dim Rows As List(Of String) = New List(Of String)()

                For i As Integer = 0 To CountLine - 1
                    Try
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

                            Rows.Add(String.Format("('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}')",
                                                   MySqlHelper.EscapeString(_fldv_waybill_no), MySqlHelper.EscapeString(_fldv_conductor_employee_code),
                                                   MySqlHelper.EscapeString(_fldv_driver_employee_code), MySqlHelper.EscapeString(_fldv_vehicle_number),
                                                   MySqlHelper.EscapeString(_fldv_division_name), MySqlHelper.EscapeString(_fldv_division_code), MySqlHelper.EscapeString(_fldv_depot_name),
                                                   MySqlHelper.EscapeString(_fldv_depot_code), MySqlHelper.EscapeString(_fldv_schedule), MySqlHelper.EscapeString(_fldv_etm_number),
                                                   MySqlHelper.EscapeString(_fldv_waybill_created_date),
                                                   MySqlHelper.EscapeString(_fldv_ticket_data), MySqlHelper.EscapeString(_fldv_vendor_name), MySqlHelper.EscapeString(_fldc_status),
                                                   MySqlHelper.EscapeString(_UserId), MySqlHelper.EscapeString(_flddt_last_upd_date)))
                        End If
                    Catch ex As Exception
                        MsgBox("unable to add" + ex.Message)
                        btn_UploadTicket.Enabled = True
                    End Try
                Next

                Try
                    sCommand.Append(String.Join(",", Rows.ToArray()))
                    sCommand.Append(";")
                    conn.Open()
                    dbcomm = New MySqlCommand(sCommand.ToString(), conn)
                    dbcomm.ExecuteNonQuery()
                    conn.Close()
                    MessageBox.Show("Ticket Upload successfully.....")
                    btn_UploadTicket.Enabled = False
                    btn_EraseTicket.Enabled = True
                    btn_DeleteBill.Enabled = True
                Catch ex As Exception
                    MsgBox("Error...Please try later" + ex.Message)
                    btn_UploadTicket.Enabled = True
                End Try
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

    'Download Ticket & Display
    Private Sub Download_Ticket()
        'Dim strRecFile As String
        'Dim objReader As System.IO.StreamReader
        'Dim tStr As String
        'Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        'Dim TextLine As String

        'If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\TicketData") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\TicketData")
        'strRecFile = System.String.Concat(My.Application.Info.DirectoryPath, "\TicketData\TicketData" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        'Path_Ticket = strRecFile
        'If strRecFile.Length > 1 Then
        '    Try
        '        Dim tGetFile As New PC2M
        '        tGetFile.DownLoad(strRecFile, "D", cmbPortList.Text)
        '        If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\TicketData\TicketData" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")) Then
        '            objReader = New System.IO.StreamReader(strRecFile)
        '            tStr = Replace(objReader.ReadToEnd, "@", "")
        '            objReader.Close()

        '            If System.IO.File.Exists(Path_Ticket) = True Then
        '                Dim objReaders As New System.IO.StreamReader(Path_Ticket)
        '                Do While objReaders.Peek() <> -1
        '                    'TextLine = TextLine & objReaders.ReadLine() & vbNewLine
        '                    TextLine = TextLine & objReaders.ReadLine() & vbNewLine
        '                    TextLine = TextLine.Replace(vbNullChar, "")
        '                Loop
        '                txt_Ticket.Text = TextLine
        '                btn_UploadTicket.Enabled = True
        '            Else
        '                MessageBox.Show("File Does Not Exist")
        '            End If

        '        End If
        '    Catch ex As Exception
        '        MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        '    End Try
        'End If

    End Sub

    'Download WayBill & Display
    Private Sub Download_WayBill()
        'Dim strRecFile As String
        'Dim objReader As System.IO.StreamReader
        'Dim tStr As String
        'Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        ''Dim txtpath As String = txtFilePath & "\" + "WayBill" + "\" + "WayBill.txt"
        'Dim TextLine As String
        ''Dim FileName As String
        '' Dim Path As String
        'If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\WayBill") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\WayBill")
        'strRecFile = System.String.Concat(My.Application.Info.DirectoryPath, "\WayBill\WayBill" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        'Path_WayBill = strRecFile
        'If strRecFile.Length > 1 Then
        '    Try
        '        Dim tGetFile As New PC2M
        '        tGetFile.DownLoad(strRecFile, "B", cmbPortList.Text)

        '        If IO.File.Exists(System.String.Concat(My.Application.Info.DirectoryPath, "\WayBill\WayBill" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")) Then
        '            objReader = New System.IO.StreamReader(strRecFile)
        '            tStr = Replace(objReader.ReadToEnd, "@", "")
        '            objReader.Close()
        '            'FileName = txtpath.Replace("file:\", "")
        '            If System.IO.File.Exists(Path_WayBill) = True Then
        '                Dim objReaders As New System.IO.StreamReader(Path_WayBill)
        '                Do While objReaders.Peek() <> -1
        '                    TextLine = TextLine & objReaders.ReadLine() & vbNewLine
        '                Loop
        '                txt_WayBill.Text = TextLine
        '            Else
        '                MessageBox.Show("File Does Not Exist")
        '            End If

        '        End If
        '    Catch ex As Exception
        '        MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        '    End Try
        'End If

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
                tRecCntr = 1
                tLenCntr = 1
                tDataCntr = 1
                With IoPort
                    If .IsOpen Then .Close()
                    .PortName = cmbPortList.Text
                    .Handshake = IO.Ports.Handshake.None
                    .RtsEnable = True
                    .WriteBufferSize = 512
                    .BaudRate = 115200
                    .Parity = IO.Ports.Parity.None
                    .ParityReplace = 8
                    .StopBits = 1
                    If System.IO.File.Exists(strSendFileName) = True Then
                        tStr = ""
                        objReader = New System.IO.StreamReader(strSendFileName)
                        Do While objReader.Peek() <> -1
                            tStr = tStr & objReader.ReadLine
                            tLenCntr = tLenCntr + 1

                            Application.DoEvents()
                        Loop
                        objReader.Close()
                        tLenCntr = 1
                        tAckChr = Mid(tStr, 2, 1)

                        tStr = Mid(tStr, 3, Len(tStr))
                        'tStr = Space(2) & tStr
                        .Open()
                        .Write("$")
                    Else
                        MsgBox("File Does Not Exist")
                    End If
                End With
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub Erase_WaybillTicket2()
        Dim strSendFileName As String
        strSendFileName = System.String.Concat(My.Application.Info.DirectoryPath, "\Erase.txt")
        If strSendFileName.Length > 1 Then
            Try
                'Dim tSendFile As New PC2M
                'tSendFile.UploadData(strSendFileName, cmbPortList.Text)
                txt_WayBill.Text = ""
                txt_Ticket.Text = ""
                btn_EraseTicket.Enabled = False
                btn_DeleteBill.Enabled = False
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
                btn_EraseTicket.Enabled = True
                btn_DeleteBill.Enabled = True
            End Try
        End If
    End Sub

    'Load frm_Auditing
    Private Sub frm_Auditing_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        lab_UserName.Text = _UserName
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            cmbPortList.Items.Add(sp)
        Next
        db_connection()
        login_UserId()
        btn_CollectTicket.Enabled = False
        btn_UploadTicket.Enabled = False
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
        myCSB.SslMode = MySqlSslMode.None
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

    'Not Work
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
    Private Sub btn_Coupon_Click(sender As Object, e As EventArgs) Handles btn_Coupon.Click
        'frm_CouponCollection.Show()

        Dim Path_Ticket23 As String = "C:\Users\konsultera\Desktop\VVMC -    EXE\TicketData01_09_2018_05_11.txt"
        Dim TextLine As String = ""
        If System.IO.File.Exists(Path_Ticket23) = True Then
            Dim objReaders As New System.IO.StreamReader(Path_Ticket23)
            Do While objReaders.Peek() <> -1
                TextLine = TextLine & objReaders.ReadLine() & vbNewLine
                TextLine = TextLine.Replace(vbNullChar, "")
            Loop
            txt_Ticket.Text = TextLine
            btn_UploadTicket.Enabled = True
        Else
            MessageBox.Show("File Does Not Exist")
        End If

    End Sub 'Testing reading from txt file

    'btn collect Waybill
    Private Sub btn_CollectWayBill_Click(sender As Object, e As EventArgs) Handles btn_CollectWayBill.Click
        btn_CollectWayBill.Enabled = False
        If Not cmbPortList.Text = "" Then
            ' Download_WayBill() with dll
            __DownloadWayBill() 'with out  dll
        Else
            MessageBox.Show("Port Number Cant be Blank")
            btn_CollectWayBill.Enabled = True
        End If
        'btn_CollectWayBill.Enabled = True
    End Sub

    'btn Collect Ticket
    Private Sub btn_CollectTicket_Click(sender As Object, e As EventArgs) Handles btn_CollectTicket.Click
        btn_CollectTicket.Enabled = False
        Me.Cursor = Cursors.WaitCursor
        If Not cmbPortList.Text = "" Then
            'Download_Ticket() with dll
            __DownloadTickets() 'without dll
            CalculateTotalFare()
            'btn_EraseTicket.Enabled = True
        Else
            MessageBox.Show("Port Number Cant be Blank")
        End If
        Me.Cursor = Cursors.Default
    End Sub

    'btn Upload Waybill Tickets
    Private Sub btn_UploadTicket_Click(sender As Object, e As EventArgs) Handles btn_UploadTicket.Click
        btn_UploadTicket.Enabled = False
        get_CollectTicket()
        get_EtimDetails()
        TotalCollection = txt_TotalCollection.Text

        'btn_UploadTicket.Enabled = True
        frm_CouponCollection.MdiParent = frmMenu
        frm_CouponCollection.WindowState = FormWindowState.Maximized
        frm_CouponCollection.Show()
        'Dim CollectCash = New frm_CollectCash
        'CollectCash.Show()

    End Sub

    'btn Erase
    Private Sub btn_EraseTicket_Click(sender As Object, e As EventArgs) Handles btn_EraseTicket.Click
        btn_EraseTicket.Enabled = False
        Erase_WaybillTicket()
        txt_TotalTicketCollection.Text = ""
        txt_TotalCollection.Text = ""
        txt_WayBill.Text = ""
        txt_Ticket.Text = ""
    End Sub

    Private Sub btn_DeleteBill_Click(sender As Object, e As EventArgs) Handles btn_DeleteBill.Click
        Erase_WaybillTicket()
        txt_TotalTicketCollection.Text = ""
        txt_TotalCollection.Text = ""
        txt_WayBill.Text = ""
        txt_Ticket.Text = ""
    End Sub

    Dim tFileName As String
    Dim tFileName2 As String
    Dim tAckChr As String
    Dim tDwnData As String

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        __DownloadWayBill()
    End Sub

    'WayBill Download Without Dll
    Private Sub __DownloadWayBill()
        Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\WayBill") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\WayBill")
        tFileName = System.String.Concat(My.Application.Info.DirectoryPath, "\WayBill\WayBill" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")
        Path_WayBill = tFileName

        'tFileName = System.String.Concat(My.Application.Info.DirectoryPath, "\output" & Date.Today.Day & "_" & Date.Today.Month & "_" & Date.Today.Year & ".txt")
        If IO.File.Exists(tFileName) Then IO.File.Delete(tFileName)
        Try
            txt_WayBill.Text = ""
            With IOPORT_DW
                If .IsOpen Then .Close()
                .PortName = cmbPortList.Text
                .RtsEnable = True
                .BaudRate = 115200
                .Parity = IO.Ports.Parity.None
                .ParityReplace = 8
                .StopBits = 1
                tAckChr = "B"
                .Open()
                .Write("$")

                btn_CollectWayBill.Enabled = True
            End With
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            If IOPORT_DW.IsOpen Then IOPORT_DW.Close()
        End Try
    End Sub

    Private Sub IOPORT_DW_DataReceived(ByVal sender As Object, ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) Handles IOPORT_DW.DataReceived
        Dim tBuffer As String
        Dim tStr As String
        Dim tData As String
        Dim tcntr As Int16
        Dim tPrevFileName As String
        Try
            With IOPORT_DW
                tBuffer = .ReadExisting
                If InStr(tBuffer, "$") > 0 Then 'tBuffer.StartsWith("$") Then
                    If Len(Trim(tAckChr)) <> 0 Then
                        .Write(tAckChr)
                        tAckChr = ""
                    Else
                        .Write("O")
                    End If
                ElseIf InStr(tBuffer, Chr(4)) <> 0 Then '  tBuffer.StartsWith(Chr(4)) Then
                    IOPORT_DW.Close()
                    txt_WayBill.Text = txt_WayBill.Text & tBuffer
                    IO.File.AppendAllText(tFileName, tBuffer)

                    tcntr = 1
                    tStr = ""
                    Dim tReader As New IO.StreamReader(tFileName)
                    tPrevFileName = tFileName
                    tFileName = ""
                    While Not tReader.EndOfStream
                        tData = tReader.ReadLine
                        If tData <> Chr(4) Then
                            tStr = tStr & tData & vbCrLf
                        End If
                        If tcntr = 1 Then
                            tFileName = Replace(tStr, vbCrLf, "")
                            tStr = ""
                        End If
                        tcntr = tcntr + 1
                    End While
                    tReader.Close()
                    tReader.Dispose()
                    'If Len(Trim(tFileName)) > 0 Then
                    tStr = Replace(tStr, Chr(4), "")
                    IO.File.AppendAllText(tPrevFileName, tStr)
                    'End If
                    'MsgBox("Data download Successfully!!!", MsgBoxStyle.OkOnly)
                    'Me.Close()
                    btn_CollectWayBill.Enabled = False
                    btn_CollectTicket.Enabled = True
                Else
                    txt_WayBill.Text = txt_WayBill.Text & tBuffer
                    IO.File.AppendAllText(tFileName, tBuffer)

                    'tcntr = 1
                    'tStr = ""
                    'Dim tReader As New IO.StreamReader(tFileName)
                    'tFileName = ""
                    'While Not tReader.EndOfStream

                    '    tStr = tStr & tReader.ReadLine
                    '    If tcntr = 1 Then
                    '        tFileName = Replace(tStr, vbCrLf, "")
                    '        tStr = ""
                    '    End If
                    '    tcntr = tcntr + 1
                    'End While
                    'tReader.Close()
                    'tReader.Dispose()
                    ''If Len(Trim(tFileName)) > 0 Then
                    'tStr = Replace(tStr, Chr(4), "")
                    'IO.File.AppendAllText(My.Application.Info.DirectoryPath & "\" & tFileName, tStr)
                    ''End If
                    'MsgBox("Data download Successfully!!!", MsgBoxStyle.OkOnly)
                    'Me.Close()
                End If
            End With
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.OkOnly)
            If IOPORT_DW.IsOpen Then IOPORT_DW.Close()
            'Me.Close()
        End Try

    End Sub

    'Ticket Download Without Dll
    Private Sub __DownloadTickets()
        Dim txtFilePath As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase)
        If Not IO.Directory.Exists(My.Application.Info.DirectoryPath & "\TicketData") Then IO.Directory.CreateDirectory(My.Application.Info.DirectoryPath & "\TicketData")
        tFileName2 = System.String.Concat(My.Application.Info.DirectoryPath, "\TicketData\TicketData" & Format(Now, "dd_MM_yyyy_hh_mm") & ".txt")

        If IO.File.Exists(tFileName2) Then IO.File.Delete(tFileName2)
        Try
            txt_Ticket.Text = ""
            With sp_Ticket
                If .IsOpen Then .Close()
                .PortName = cmbPortList.Text
                .RtsEnable = True
                .BaudRate = 115200
                .Parity = IO.Ports.Parity.None
                .ParityReplace = 8
                .StopBits = 1
                tAckChr = "D"
                .Open()
                .Write("$")

                btn_CollectTicket.Enabled = True
            End With
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            If sp_Ticket.IsOpen Then sp_Ticket.Close()
        End Try
    End Sub

    Private Sub sp_Ticket_DataReceived(sender As Object, e As SerialDataReceivedEventArgs) Handles sp_Ticket.DataReceived
        Dim tBuffer As String
        Dim tStr As String
        Dim tData As String
        Dim tcntr As Int16
        Dim tPrevFileName As String
        Try
            With sp_Ticket
                tBuffer = .ReadExisting
                If InStr(tBuffer, "$") > 0 Then 'tBuffer.StartsWith("$") Then
                    If Len(Trim(tAckChr)) <> 0 Then
                        .Write(tAckChr)
                        tAckChr = ""
                    Else
                        .Write("O")
                    End If
                ElseIf InStr(tBuffer, Chr(4)) <> 0 Then '  tBuffer.StartsWith(Chr(4)) Then
                    sp_Ticket.Close()
                    txt_Ticket.Text = txt_Ticket.Text & tBuffer
                    IO.File.AppendAllText(tFileName2, tBuffer)

                    tcntr = 1
                    tStr = ""
                    Dim tReader As New IO.StreamReader(tFileName2)
                    tPrevFileName = tFileName2
                    tFileName2 = ""
                    While Not tReader.EndOfStream
                        tData = tReader.ReadLine
                        If tData <> Chr(4) Then
                            tStr = tStr & tData & vbCrLf
                        End If
                        If tcntr = 1 Then
                            tFileName2 = Replace(tStr, vbCrLf, "")
                            tStr = ""
                        End If
                        tcntr = tcntr + 1
                    End While
                    tReader.Close()
                    tReader.Dispose()
                    'If Len(Trim(tFileName2)) > 0 Then
                    tStr = Replace(tStr, Chr(4), "")
                    IO.File.AppendAllText(tPrevFileName, tStr)
                    'End If
                    'MsgBox("Data download Successfully!!!", MsgBoxStyle.OkOnly)
                    'Me.Close()
                    btn_CollectTicket.Enabled = False
                    btn_UploadTicket.Enabled = True
                Else
                    txt_Ticket.Text = txt_Ticket.Text & tBuffer
                    IO.File.AppendAllText(tFileName2, tBuffer)
                End If
            End With
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.OkOnly)
            If sp_Ticket.IsOpen Then sp_Ticket.Close()
            'Me.Close()
        End Try

        CalculateTotalFare()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        btn_CollectTicket.Enabled = False
        If Not cmbPortList.Text = "" Then
            __DownloadTickets()
            btn_EraseTicket.Enabled = True
        Else
            MessageBox.Show("Port Number Cant be Blank")
        End If
        btn_CollectTicket.Enabled = True
    End Sub


    Private Sub IoPort_DataReceived(ByVal sender As Object, ByVal e As System.IO.Ports.SerialDataReceivedEventArgs) Handles IoPort.DataReceived
        Dim encodedString() As Byte
        Dim tBuffer As String
        Dim tFname As String
        Dim tCntr As Int64
        Dim tLCntr As Int64
        Dim tUCntr As Int64
        Dim tSendString As String

        Try
            With IoPort
                tBuffer = Chr(.ReadChar)
                'TextBox2.Text = TextBox2.Text & "Receive String : " & tBuffer
                If tBuffer.StartsWith("$") Then
                    'TextBox1.Text = tBuffer
                    If Len(tAckChr) <> 0 Then
                        .Write(tAckChr)
                        'TextBox2.Text = TextBox2.Text & "Sending String : " & tAckChr & vbCrLf
                        tAckChr = ""
                    End If
                ElseIf tBuffer.StartsWith("O") Then
                    'TextBox1.Text = tBuffer
                    If tDataCntr >= Len(tStr) Then
                        .Write(Chr(4))
                        Sleep(300)
                        .Close()
                        'System.IO.File.AppendAllText(My.Application.Info.DirectoryPath & "\Send.txt", TextBox2.Text)
                        'MsgBox("Process Completed Successfully!!!", MsgBoxStyle.OkOnly)
                        'txtProcStat.Text = ""
                    Else
                        tSendString = ""
                        For tCntr = tDataCntr To Len(tStr)
                            tSendString = tSendString & Mid(tStr, tCntr, 1)
                            If Mid(tStr, tCntr, 1) = "@" Then
                                Exit For
                            End If
                        Next tCntr
                        tDataCntr = tCntr + 1

                        tSendString = tSendString.Replace(vbCrLf, "")
                        tSendString = tSendString.Replace(vbCr, "")

                        'TextBox2.Text = tSendString
                        encodedString = encode(tSendString)
                        .Write(encodedString, 0, encodedString.Length)
                        'TextBox2.Text = "Send String :" & encodedString.ToString
                        'Call ProStat()
                        tLenCntr = tLenCntr + 1
                        tRecCntr = tRecCntr + 1
                        If tSendString = Chr(4) Then
                            Sleep(300)
                            .Close()
                            'MsgBox("Process Completed Successfully!!!", MsgBoxStyle.OkOnly)
                            'txtProcStat.Text = ""
                        End If
                    End If
                End If

            End With
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.OkOnly)
            'txtProcStat.Text = ""
            If IoPort.IsOpen Then IoPort.Close()
        End Try
    End Sub

    Public Shared Function encode(ByVal str As String) As Byte()
        Dim utf8Encoding As New System.Text.UTF8Encoding
        Dim encodedString() As Byte

        encodedString = utf8Encoding.GetBytes(str)

        Return encodedString
    End Function

End Class