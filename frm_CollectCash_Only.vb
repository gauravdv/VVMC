Imports System.IO
Imports MySql.Data.MySqlClient

Public Class frm_CollectCash_Only
    Dim conn As New MySqlConnection
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader

    Dim _TotalCouponAmount As Int64 = frm_CouponCollection_Only._TotalCouponAmount
    Dim TotalCollection As Int64 = 0
    'Dim WayBillText As String = frm_Auditing.WayBillText
    Private _frm_Auditing As frm_Auditing
    Dim machineType As String
    Dim etmNumberValue As String
    Dim A1000 As Integer
    Dim A500 As String
    Dim A100 As String
    Dim A50 As String
    Dim A20 As String
    Dim A10 As String
    Dim A5 As String
    Dim A2 As String
    Dim A1 As String


    Dim db_Server As String
    Dim db_Name As String
    Dim db_UserID As String
    Dim db_Password As String

    Dim _ConEmpWayBill As String = frm_CouponCollection_Only._ConEmpWayBill
    Dim _UserId As String = frm_Login._UserId

    Dim _fldv_conductor_employee_code As String
    Dim _fldv_conductor_name As String
    Dim _fldv_driver_employee_code As String
    Dim _fldv_driver_name As String
    Dim _fldv_vehicle_number As String
    Dim _fldv_division_name As String
    Dim _fldv_division_code As String
    Dim _fldv_depot_name As String
    Dim _fldv_depot_code As String
    Dim _fldv_schedule As String
    Dim _fldv_etm_number As String
    Dim _fldc_status As String
    Dim _fldi_user_id As String
    Dim _fldv_waybill_created_date As String
    Dim _flddt_last_upd_date As String

    'Calculate Total Amount
    Private Sub AmountSum()
        Dim AmountSum As Integer
        AmountSum = (A1000 + A500 + A100 + A50 + A20 + A10 + A5 + A2 + A1)
        txt_TotalAmountCollection.Text = AmountSum
        If Not txt_TotalCollection.Text = "" Then
            txt_Diffrence.Text = txt_TotalCollection.Text - AmountSum
        End If
    End Sub

    'Upload Cash
    Private Sub get_CollectCash()
        If Not _ConEmpWayBill.Equals("") Then
            Dim Sql As String
            Dim rLine As String

            Dim _fldv_waybill_no As String = _ConEmpWayBill

            Dim _flddt_collection_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            Dim _fldv_collection_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")

            Dim _flddt_last_upd_date2 As String
            _flddt_last_upd_date2 = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")

            'Dim _fldv_conductor_employee_code As String
            'Dim _fldv_driver_employee_code As String


            'Dim _fldv_vehicle_number As String
            'Dim _fldv_division_name As String
            'Dim _fldv_division_code As String
            'Dim _fldv_depot_name As String
            'Dim _fldv_depot_code As String
            'Dim _fldv_schedule As String
            'Dim _fldv_etm_number As String

            Dim _fldv_collection_1000_count As String = txt_1000.Text
            Dim _fldf_collection_1000_amt As String = A1000
            Dim _fldv_collection_500_count As String = txt_500.Text
            Dim _fldf_collection_500_amt As String = A500
            Dim _fldv_collection_100_count As String = txt_100.Text
            Dim _fldf_collection_100_amt As String = A100
            Dim _fldv_collection_50_count As String = txt_50.Text
            Dim _fldf_collection_50_amt As String = A50
            Dim _fldv_collection_20_count As String = txt_20.Text
            Dim _fldf_collection_20_amt As String = A20
            Dim _fldv_collection_10_count As String = txt_10.Text
            Dim _fldf_collection_10_amt As String = A10
            Dim _fldv_collection_5_count As String = txt_5.Text
            Dim _fldf_collection_5_amt As String = A5
            Dim _fldv_collection_2_count As String = txt_2.Text
            Dim _fldf_collection_2_amt As String = A2
            Dim _fldv_collection_1_count As String = txt_1.Text
            Dim _fldf_collection_1_amt As String = A1
            Dim _fldf_collection_total_amt As String = txt_TotalAmountCollection.Text
            Dim _fldv_amount_difference As String = txt_Diffrence.Text



            Dim ConductorCode As String = _fldv_conductor_employee_code
            Dim DriverCode As String = _fldv_driver_employee_code
            'Dim ConductorName As String
            'Dim DriverName As String
            'Dim ConductorId As String
            'Dim DriverId As String
            'get_ConductorDetail(ConductorName, ConductorId, ConductorCode)
            'get_DriverDetail(DriverName, DriverId, DriverCode)
            'get_WayBillMast(_fldc_status, _fldi_user_id, _flddt_last_upd_date, _fldv_waybill_no)
            'Dim _fldi_conductor_id As String = ConductorId
            'Dim _fldv_conductor_name As String = ConductorName
            'Dim _fldv_driver_id As String = DriverId
            'Dim _fldv_driver_name As String = DriverName


            'MessageBox.Show(ConductorName + ConductorId)

            Sql = "INSERT INTO tbl_conductor_collection_amount (fldv_waybill_no, fldv_conductor_name, fldv_driver_name, fldv_vehicle_number,
                    fldv_division_name, fldv_division_code,fldv_depot_name, fldv_depot_code, fldv_schedule,
                    fldv_etm_number, flddt_collection_date,fldv_collection_1000_count, fldf_collection_1000_amt,fldv_collection_500_count, fldf_collection_500_amt,
                    fldv_collection_100_count,fldf_collection_100_amt,fldv_collection_50_count,fldf_collection_50_amt,fldv_collection_20_count,fldf_collection_20_amt,
                    fldv_collection_10_count,fldf_collection_10_amt,fldv_collection_5_count,fldf_collection_5_amt,fldv_collection_2_count,
                    fldf_collection_2_amt,fldv_collection_1_count,fldf_collection_1_amt,fldf_collection_total_amt,fldv_collection_date,fldc_status,
                    fldi_user_id,flddt_last_upd_date,fldv_amount_difference) 
                    Value ('" + _fldv_waybill_no + "', '" + ConductorCode + "', '" + DriverCode + "','" + _fldv_vehicle_number + "',
                    '" + _fldv_division_name + "','" + _fldv_division_code + "','" + _fldv_depot_name + "' , '" + _fldv_depot_code + "', '" + _fldv_schedule + "',
                    '" + _fldv_etm_number + "','" + _flddt_collection_date + "' ,'" + _fldv_collection_1000_count + "', '" + _fldf_collection_1000_amt + "','" + _fldv_collection_500_count + "','" + _fldf_collection_500_amt + "' ,
                   '" + _fldv_collection_100_count + "' , '" + _fldf_collection_100_amt + "', '" + _fldv_collection_50_count + "', '" + _fldf_collection_50_amt + "', '" + _fldv_collection_20_count + "', '" + _fldf_collection_20_amt + "',
                    '" + _fldv_collection_10_count + "', '" + _fldf_collection_10_amt + "', '" + _fldv_collection_5_count + "', '" + _fldf_collection_5_amt + "', '" + _fldv_collection_2_count + "',
                   '" + _fldf_collection_2_amt + "' , '" + _fldv_collection_1_count + "', '" + _fldf_collection_1_amt + "', '" + _fldf_collection_total_amt + "', '" + _fldv_collection_date + "', '" + _fldc_status + "',
                   '" + _UserId + "' , '" + _flddt_last_upd_date2 + "', '" + _fldv_amount_difference + "')"

            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbcomm.ExecuteNonQuery()
                MessageBox.Show("Data Upload Successfully")
                Me.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If


    End Sub

    Private Sub get_CollectCash2()
        If Not _ConEmpWayBill.Equals("") Then
            Dim Sql As String
            Dim rLine As String
            Dim _fldv_conductor_employee_code As String
            Dim _fldv_driver_employee_code As String
            Dim _fldv_waybill_no As String

            Dim _fldv_vehicle_number As String
            Dim _fldv_division_name As String
            Dim _fldv_division_code As String
            Dim _fldv_depot_name As String
            Dim _fldv_depot_code As String
            Dim _fldv_schedule As String
            Dim _fldv_etm_number As String
            Dim _fldv_waybill_date_time As String

            Dim _fldv_collection_1000_count As String = txt_1000.Text
            Dim _fldf_collection_1000_amt As String = A1000
            Dim _fldv_collection_500_count As String = txt_500.Text
            Dim _fldf_collection_500_amt As String = A500
            Dim _fldv_collection_100_count As String = txt_100.Text
            Dim _fldf_collection_100_amt As String = A100
            Dim _fldv_collection_50_count As String = txt_50.Text
            Dim _fldf_collection_50_amt As String = A50
            Dim _fldv_collection_20_count As String = txt_20.Text
            Dim _fldf_collection_20_amt As String = A20
            Dim _fldv_collection_10_count As String = txt_10.Text
            Dim _fldf_collection_10_amt As String = A10
            Dim _fldv_collection_5_count As String = txt_5.Text
            Dim _fldf_collection_5_amt As String = A5
            Dim _fldv_collection_2_count As String = txt_2.Text
            Dim _fldf_collection_2_amt As String = A2
            Dim _fldv_collection_1_count As String = txt_1.Text
            Dim _fldf_collection_1_amt As String = A1
            Dim _fldf_collection_total_amt As String = txt_TotalAmountCollection.Text
            Dim _fldc_status As String
            Dim _fldi_user_id As String
            Dim _flddt_last_upd_date As String
            Dim _fldv_amount_difference As String = txt_Diffrence.Text
            Dim _flddt_last_upd_date2 As String
            _flddt_last_upd_date2 = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")

            rLine = _ConEmpWayBill.Replace("$", "")
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

            Dim ConductorCode As String = _fldv_conductor_employee_code
            Dim DriverCode As String = _fldv_driver_employee_code
            Dim ConductorName As String
            Dim DriverName As String
            Dim ConductorId As String
            Dim DriverId As String
            get_ConductorDetail(ConductorName, ConductorId, ConductorCode)
            get_DriverDetail(DriverName, DriverId, DriverCode)
            get_WayBillMast(_fldc_status, _fldi_user_id, _flddt_last_upd_date, _fldv_waybill_no)
            Dim _fldi_conductor_id As String = ConductorId
            Dim _fldv_conductor_name As String = ConductorName
            Dim _fldv_driver_id As String = DriverId
            Dim _fldv_driver_name As String = DriverName
            Dim _flddt_collection_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            Dim _fldv_collection_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            'MessageBox.Show(ConductorName + ConductorId)

            Sql = "INSERT INTO tbl_conductor_collection_amount (fldv_waybill_no, fldv_conductor_name, fldv_driver_name, fldv_vehicle_number,
                    fldv_division_name, fldv_division_code,fldv_depot_name, fldv_depot_code, fldv_schedule,
                    fldv_etm_number, flddt_collection_date,fldv_collection_1000_count, fldf_collection_1000_amt,fldv_collection_500_count, fldf_collection_500_amt,
                    fldv_collection_100_count,fldf_collection_100_amt,fldv_collection_50_count,fldf_collection_50_amt,fldv_collection_20_count,fldf_collection_20_amt,
                    fldv_collection_10_count,fldf_collection_10_amt,fldv_collection_5_count,fldf_collection_5_amt,fldv_collection_2_count,
                    fldf_collection_2_amt,fldv_collection_1_count,fldf_collection_1_amt,fldf_collection_total_amt,fldv_collection_date,fldc_status,
                    fldi_user_id,flddt_last_upd_date,fldv_amount_difference) 
                    Value ('" + _fldv_waybill_no + "', '" + _fldv_conductor_employee_code + "', '" + _fldv_driver_name + "','" + _fldv_vehicle_number + "',
                    '" + _fldv_division_name + "','" + _fldv_division_code + "','" + _fldv_depot_name + "' , '" + _fldv_depot_code + "', '" + _fldv_schedule + "',
                    '" + _fldv_etm_number + "','" + _flddt_collection_date + "' ,'" + _fldv_collection_1000_count + "', '" + _fldf_collection_1000_amt + "','" + _fldv_collection_500_count + "','" + _fldf_collection_500_amt + "' ,
                   '" + _fldv_collection_100_count + "' , '" + _fldf_collection_100_amt + "', '" + _fldv_collection_50_count + "', '" + _fldf_collection_50_amt + "', '" + _fldv_collection_20_count + "', '" + _fldf_collection_20_amt + "',
                    '" + _fldv_collection_10_count + "', '" + _fldf_collection_10_amt + "', '" + _fldv_collection_5_count + "', '" + _fldf_collection_5_amt + "', '" + _fldv_collection_2_count + "',
                   '" + _fldf_collection_2_amt + "' , '" + _fldv_collection_1_count + "', '" + _fldf_collection_1_amt + "', '" + _fldf_collection_total_amt + "', '" + _fldv_collection_date + "', '" + _fldc_status + "',
                   '" + _fldi_user_id + "' , '" + _flddt_last_upd_date2 + "', '" + _fldv_amount_difference + "')"

            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbcomm.ExecuteNonQuery()
                MessageBox.Show("Data Upload Successfully")
                Me.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If


    End Sub

    'Conductor Detail
    Public Function get_ConductorDetail(ByRef ConductorName As String, ByRef ConductorId As String, ByRef ConductorCode As String)
        Dim Sql As String
        If Not ConductorCode = "" Then
            Sql = "select fldv_conductor_name, fldi_conductor_id From tbl_waybill_mst where fldv_conductor_employee_code = '" + ConductorCode + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    ConductorName = dbread.GetString("fldv_conductor_name")
                    ConductorId = dbread.GetString("fldi_conductor_id")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
        Return ConductorName
    End Function

    'Driver Detail
    Public Function get_DriverDetail(ByRef DriverName As String, ByRef DriverId As String, ByRef DriverCode As String)
        Dim Sql As String
        If Not DriverCode = "" Then
            Sql = "select fldv_driver_name, fldi_driver_id From tbl_waybill_mst where fldv_driver_employee_code = '" + DriverCode + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    DriverName = dbread.GetString("fldv_driver_name")
                    DriverId = dbread.GetString("fldi_driver_id")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
        Return DriverName
    End Function

    'WayBill Master
    Public Function get_WayBillMast(ByRef _fldc_status As String, ByRef _fldi_user_id As String, ByRef _flddt_last_upd_date As String, ByRef _fldv_waybill_no As String)
        Dim Sql As String
        If Not _fldv_waybill_no = "" Then
            Sql = "select fldc_status,fldi_user_id,	fldv_waybill_created_date  from  tbl_waybill_mst where fldv_waybill_no = '" + _fldv_waybill_no + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    _fldc_status = dbread.GetString("fldc_status")
                    _fldi_user_id = dbread.GetString("fldi_user_id")
                    _flddt_last_upd_date = dbread.GetString("fldv_waybill_created_date")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
        Return _fldc_status
    End Function

    Private Sub txt_1000_TextChanged(sender As Object, e As EventArgs) Handles txt_1000.TextChanged
        If IsNumeric(txt_1000.Text) Then
            If Not txt_1000.Text = "" Then
                A1000 = (1000 * txt_1000.Text)
                lab_1000.Text = A1000
                A1000 = Convert.ToInt64(lab_1000.Text)
            Else
                lab_1000.Text = ""
                A1000 = 0
            End If
        Else
            lab_1000.Text = ""
            txt_1000.Text = ""
            A1000 = 0
        End If

        AmountSum()
    End Sub

    Private Sub txt_500_TextChanged(sender As Object, e As EventArgs) Handles txt_500.TextChanged
        If IsNumeric(txt_500.Text) Then
            If Not txt_500.Text = "" Then
                A500 = (500 * txt_500.Text)
                lab_500.Text = A500
                A500 = Convert.ToInt64(lab_500.Text)
            Else
                lab_500.Text = ""
                A500 = 0
            End If
        Else
            lab_500.Text = ""
            txt_500.Text = ""
            A500 = 0
        End If

        AmountSum()
    End Sub

    Private Sub txt_100_TextChanged(sender As Object, e As EventArgs) Handles txt_100.TextChanged

        If IsNumeric(txt_100.Text) Then
            If Not txt_100.Text = "" Then
                A100 = (100 * txt_100.Text)
                lab_100.Text = A100
                A100 = Convert.ToInt64(lab_100.Text)
                AmountSum()
            Else
                lab_100.Text = ""
                A100 = 0
            End If
        Else
            lab_100.Text = ""
            txt_100.Text = ""
            A100 = 0
        End If
    End Sub

    Private Sub txt_50_TextChanged(sender As Object, e As EventArgs) Handles txt_50.TextChanged
        If IsNumeric(txt_50.Text) Then
            If Not txt_50.Text = "" Then
                A50 = (50 * txt_50.Text)
                lab_50.Text = A50
                A50 = Convert.ToInt64(lab_50.Text)
                AmountSum()
            Else
                lab_50.Text = ""
                A50 = 0
            End If
        Else
            lab_50.Text = ""
            txt_50.Text = ""
            A50 = 0
        End If
    End Sub

    Private Sub txt_20_TextChanged(sender As Object, e As EventArgs) Handles txt_20.TextChanged
        If IsNumeric(txt_20.Text) Then
            If Not txt_20.Text = "" Then
                A20 = (20 * txt_20.Text)
                lab_20.Text = A20
                A20 = Convert.ToInt64(lab_20.Text)
                AmountSum()
            Else
                lab_20.Text = ""
                A20 = 0
            End If
        Else
            lab_20.Text = ""
            txt_20.Text = ""
            A20 = 0
        End If
    End Sub

    Private Sub txt_10_TextChanged(sender As Object, e As EventArgs) Handles txt_10.TextChanged
        If IsNumeric(txt_10.Text) Then
            If Not txt_10.Text = "" Then
                A10 = (10 * txt_10.Text)
                lab_10.Text = A10
                A10 = Convert.ToInt64(lab_10.Text)
            Else
                lab_10.Text = ""
                A10 = 0
            End If
        Else
            lab_10.Text = ""
            txt_10.Text = ""
            A10 = 0
        End If
        AmountSum()
    End Sub

    Private Sub txt_5_TextChanged(sender As Object, e As EventArgs) Handles txt_5.TextChanged
        If IsNumeric(txt_5.Text) Then
            If Not txt_5.Text = "" Then
                A5 = (5 * txt_5.Text)
                lab_5.Text = A5
                A5 = Convert.ToInt64(lab_5.Text)
            Else
                lab_5.Text = ""
                A5 = 0
            End If
        Else
            lab_5.Text = ""
            txt_5.Text = ""
            A5 = 0
        End If
        AmountSum()
    End Sub

    Private Sub txt_2_TextChanged(sender As Object, e As EventArgs) Handles txt_2.TextChanged
        If IsNumeric(txt_2.Text) Then
            If Not txt_2.Text = "" Then
                A2 = (2 * txt_2.Text)
                lab_2.Text = A2
                A2 = Convert.ToInt64(lab_2.Text)
            Else
                lab_2.Text = ""
                A2 = 0
            End If
        Else
            lab_2.Text = ""
            txt_2.Text = ""
            A2 = 0
        End If
        AmountSum()
    End Sub

    Private Sub txt_1_TextChanged(sender As Object, e As EventArgs) Handles txt_1.TextChanged
        If IsNumeric(txt_1.Text) Then
            If Not txt_1.Text = "" Then
                A1 = (1 * txt_1.Text)
                lab_1.Text = A1
                A1 = Convert.ToInt64(lab_1.Text)
            Else
                lab_1.Text = ""
                A1 = 0
            End If
        Else
            lab_1.Text = ""
            txt_1.Text = ""
            A1 = 0
        End If
        AmountSum()
    End Sub

    'Get Combo Box Port
    Private Sub get_cmbPort()
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            cmbPortList.Items.Add(sp)
        Next
    End Sub

    'Get Machin Detail
    Private Sub get_EtimDetails()
        If Not _ConEmpWayBill.Equals("") Then
            Dim A As String = _ConEmpWayBill
            Dim rLine As String
            rLine = _ConEmpWayBill.Replace(" ", "")
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

    'For Database Connection
    Private Sub db_connection()
        Get_DataBaseDetail()
        Dim myCSB As MySqlConnectionStringBuilder = New MySqlConnectionStringBuilder()
        myCSB.Server = db_Server
        myCSB.Database = db_Name
        myCSB.UserID = db_UserID
        myCSB.Password = db_Password
        conn = New MySqlConnection(myCSB.ConnectionString)
        ' conn.ConnectionString = String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", db_Server, db_Name, db_UserID, db_Password)
        Try
            conn.Open()
            ' MsgBox("Connected")
        Catch ex As Exception
            MsgBox(ex.Message)
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

    ' Load Form 
    Private Sub frm_CollectCash_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        get_cmbPort()
        If Not TotalCollection = 0 Then
            Dim An As Int64
            An = TotalCollection + _TotalCouponAmount
            txt_TotalCollection.Text = An
            'txt_TotalCollection.Text = Convert.ToInt64(TotalCollection) + _TotalCouponAmount
            TotalCollection = 0
        Else
            txt_TotalCollection.Text = _TotalCouponAmount
        End If
        txt_CollectionDate.Text = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        db_connection()
        get_WayBillData()
    End Sub

    Private Sub btn_UploadCollection_Click(sender As Object, e As EventArgs) Handles btn_UploadCollection.Click
        btn_UploadCollection.Enabled = False
        get_CollectCash()
        'update_WayBillMst()
        btn_UploadCollection.Enabled = True
    End Sub

    Private Sub update_WayBillMst()
        Dim Sql As String
        Dim CurretDate As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not _ConEmpWayBill = "" Then
            Sql = "UPDATE tbl_waybill_mst SET  fldi_coupon_close_userid = '" + _UserId + "', fldi_collection_close_userid ='" + _UserId + "', 
                flddt_waybill_open_close_datetime = '" + CurretDate + "' WHERE fldv_waybill_no = '" + _ConEmpWayBill + "' "

            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbcomm.ExecuteNonQuery()
                MessageBox.Show("Data Upload Successfully")
                Me.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
    End Sub

    '\Get WatBill Mst DAta
    Private Sub get_WayBillData()
        Dim Sql As String
        If Not _ConEmpWayBill = "" Then
            Sql = "select fldv_conductor_employee_code, fldv_conductor_name, fldv_driver_employee_code ,fldv_driver_name,fldv_vehicle_number,fldv_division_name,
                                fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule, fldv_etm_number, fldc_status,fldi_user_id, fldv_waybill_created_date  
                            from  tbl_waybill_mst where fldv_waybill_no = '" + _ConEmpWayBill + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()

                    _fldv_conductor_employee_code = dbread.GetString("fldv_conductor_employee_code")
                    _fldv_conductor_name = dbread.GetString("fldv_conductor_name")
                    _fldv_driver_employee_code = dbread.GetString("fldv_driver_employee_code")
                    _fldv_driver_name = dbread.GetString("fldv_driver_name")
                    _fldv_vehicle_number = dbread.GetString("fldv_vehicle_number")
                    _fldv_division_name = dbread.GetString("fldv_division_name")
                    _fldv_division_code = dbread.GetString("fldv_division_code")
                    _fldv_depot_name = dbread.GetString("fldv_depot_name")
                    _fldv_depot_code = dbread.GetString("fldv_depot_code")
                    _fldv_schedule = dbread.GetString("fldv_schedule")
                    _fldv_etm_number = dbread.GetString("fldv_etm_number")
                    _fldc_status = dbread.GetString("fldc_status")
                    _fldi_user_id = dbread.GetString("fldi_user_id")
                    _fldv_waybill_created_date = dbread.GetString("fldv_waybill_created_date")
                    '_flddt_last_upd_date = dbread.GetString("fldv_waybill_created_date")
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
    End Sub

End Class