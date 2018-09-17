Imports PC2M.PC2M
Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Text

Public Class frm_CouponCollection
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

    Dim selectedItem As String
    Dim _UserName As String = frm_Login._UserName
    Dim _UserId As String = frm_Login._UserId

    Dim _ConductorEmpCOde As String = frm_Auditing._ConductorEmpCOde
    Dim _ConductorWayBillNo As String = frm_Auditing._ConducotWayBillNo


    Public Shared _ConEmpWayBill As String
    Public Shared _TotalCouponAmount As Int64

    'Upload Tickets Data
    Private Sub Upload_TicketData()
        Dim sql As String
        Dim ConductorId As String = cmb_ConductorId.Text
        Dim WayBillMst As String
        Dim WayBillNoMst As String = cmb_WayBillNo.Text
        Dim dgv_Count As Integer = dgv_WayBillDetails.Rows.Count - 1
        'Dim _flddt_date = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")

        If Not ConductorId = "" Then
            Try
                sql = "SELECT fldv_waybill_no from  tbl_waybill_mst	where fldv_conductor_employee_code = '" + ConductorId + "'
							and fldc_status = 'Y'and fldc_waybill_open_close_status = 'N' order by flddt_date "
                'last waybill no that conductor
                '"SELECT fldi_waybill_id, fldv_waybill_no, fldv_waybill_created_date FROM tbl_waybill_mst    where fldv_conductor_employee_code = '" + ConductorId + "'
                '    ORDER BY  fldi_waybill_id DESC LIMIT 1"
                conn.Open()
                dbcomm = New MySqlCommand(sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    WayBillMst = dbread.GetString("fldv_waybill_no")
                End While
                conn.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            Try
                If Not WayBillNoMst = "" Then
                    Dim sCommand As StringBuilder = New StringBuilder("INSERT INTO tbl_conductor_coupon_collection_dummy (fldi_conductor_id,fldv_conductor_name,fldv_employee_code, 
                            fldi_coupon_id,fldv_coupon_blok_no,fldi_coupon_amount,fldi_coupon_start_number,fldi_coupon_end_number,
                            fldv_total_amount,fldi_no_of_tickets,flddt_date,fldc_status,fldi_user_id,flddt_last_upd_date,fldv_waybill_no) VALUES ")

                    Dim Rows As List(Of String) = New List(Of String)()

                    For Each row As DataGridViewRow In dgv_WayBillDetails.Rows
                        Dim _fldi_conductor_id As String = 0
                        Dim _fldv_conductor_name As String = ""
                        Dim _fldv_employee_code As String = ConductorId
                        Dim _fldi_coupon_id As String = 0
                        Dim _fldv_coupon_blok_no As String = row.Cells("Column2").Value  'Ticket Block Series No 
                        Dim _fldi_coupon_amount As String = row.Cells("Column1").Value 'Denomination 
                        Dim _fldi_coupon_start_number As String = row.Cells("Column3").Value  'Ticket Start Number
                        Dim _fldi_coupon_end_number As String = row.Cells("Column4").Value  'Ticket End Number
                        Dim _fldv_total_amount As String = row.Cells("Column6").Value  'Amount
                        Dim _fldi_no_of_tickets As String = row.Cells("Column5").Value  'No of Tickets
                        Dim _flddt_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
                        Dim _fldc_status As String = "N"
                        Dim _fldi_user_id As String = _UserId
                        Dim _flddt_last_upd_date As String = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")

                        If row.Cells("Column2").Value Is Nothing Then
                        Else

                            Rows.Add(String.Format("('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}')",
                                                   MySqlHelper.EscapeString(_fldi_conductor_id), MySqlHelper.EscapeString(_fldv_conductor_name),
                                                   MySqlHelper.EscapeString(_fldv_employee_code), MySqlHelper.EscapeString(_fldi_coupon_id),
                                                   MySqlHelper.EscapeString(_fldv_coupon_blok_no), MySqlHelper.EscapeString(_fldi_coupon_amount),
                                                   MySqlHelper.EscapeString(_fldi_coupon_start_number), MySqlHelper.EscapeString(_fldi_coupon_end_number), MySqlHelper.EscapeString(_fldv_total_amount),
                                                   MySqlHelper.EscapeString(_fldi_no_of_tickets),
                                                   MySqlHelper.EscapeString(_flddt_date), MySqlHelper.EscapeString(_fldc_status), MySqlHelper.EscapeString(_fldi_user_id),
                                                   MySqlHelper.EscapeString(_flddt_last_upd_date), MySqlHelper.EscapeString(WayBillNoMst)))

                        End If

                    Next
                    sCommand.Append(String.Join(",", Rows.ToArray()))
                    sCommand.Append(";")
                    conn.Open()
                    dbcomm = New MySqlCommand(sCommand.ToString(), conn)
                    dbcomm.ExecuteNonQuery()
                    conn.Close()
                    MessageBox.Show("Data Upload Successfully")
                    btn_CollectCash.Enabled = True
                Else
                    MessageBox.Show("WayBill Number Cant Blank")
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Else
            MessageBox.Show("Please Select Condutor")
        End If
    End Sub

    Private Sub Upload_TicketData2()
        Dim sql As String
        Dim ConductorId As String = cmb_ConductorId.Text
        Dim WayBillMst As String
        Dim WayBillNoMst As String = cmb_WayBillNo.Text
        Dim dgv_Count As Integer = dgv_WayBillDetails.Rows.Count - 1
        Dim _flddt_date = System.DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not ConductorId = "" Then

            Try
                sql = "SELECT fldv_waybill_no from  tbl_waybill_mst	where fldv_conductor_employee_code = '" + ConductorId + "'
							and fldc_status = 'Y'and fldc_waybill_open_close_status = 'N' order by flddt_date "
                'last waybill no that conductor
                '"SELECT fldi_waybill_id, fldv_waybill_no, fldv_waybill_created_date FROM tbl_waybill_mst    where fldv_conductor_employee_code = '" + ConductorId + "'
                '    ORDER BY  fldi_waybill_id DESC LIMIT 1"
                conn.Open()
                dbcomm = New MySqlCommand(sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    WayBillMst = dbread.GetString("fldv_waybill_no")
                End While
                conn.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            Try

                For Each row As DataGridViewRow In dgv_WayBillDetails.Rows

                    If row.Cells("Column2").Value Is Nothing Then

                    Else
                        If Not WayBillNoMst = "" Then
                            sql = "insert into  tbl_conductor_coupon_collection_dummy (fldi_conductor_id,fldv_conductor_name,fldv_employee_code, 
                            fldi_coupon_id,fldv_coupon_blok_no,fldi_coupon_amount,fldi_coupon_start_number,fldi_coupon_end_number,
                            fldv_total_amount,fldi_no_of_tickets,flddt_date,fldc_status,fldi_user_id,flddt_last_upd_date,fldv_waybill_no)
                            values (@fldi_conductor_id, @fldv_conductor_name, @fldv_employee_code, @fldi_coupon_id, @fldv_coupon_blok_no, 
                                    @fldi_coupon_amount, @fldi_coupon_start_number, @fldi_coupon_end_number, @fldv_total_amount, 
                                    @fldi_no_of_tickets, @flddt_date, @fldc_status, @fldi_user_id, @flddt_last_upd_date, @fldv_waybill_no  )"
                            conn.Open()
                            dbcomm = New MySqlCommand(sql, conn)
                            dbcomm.Parameters.AddWithValue("@fldi_conductor_id", 0)
                            dbcomm.Parameters.AddWithValue("@fldv_conductor_name", "")
                            dbcomm.Parameters.AddWithValue("@fldv_employee_code", ConductorId)
                            dbcomm.Parameters.AddWithValue("@fldi_coupon_id", 0)
                            dbcomm.Parameters.AddWithValue("@fldv_coupon_blok_no", row.Cells("Column2").Value)  'Ticket Block Series No 
                            dbcomm.Parameters.AddWithValue("@fldi_coupon_amount", row.Cells("Column1").Value)   'Denomination 
                            dbcomm.Parameters.AddWithValue("@fldi_coupon_start_number", row.Cells("Column3").Value)    'Ticket Start Number
                            dbcomm.Parameters.AddWithValue("@fldi_coupon_end_number", row.Cells("Column4").Value)  'Ticket End Number
                            dbcomm.Parameters.AddWithValue("@fldv_total_amount", row.Cells("Column6").Value)   'Amount
                            dbcomm.Parameters.AddWithValue("@fldi_no_of_tickets", row.Cells("Column5").Value)  'No of Tickets
                            dbcomm.Parameters.AddWithValue("@flddt_date", _flddt_date)
                            dbcomm.Parameters.AddWithValue("@fldc_status", "N")
                            dbcomm.Parameters.AddWithValue("@fldi_user_id", _UserId)
                            dbcomm.Parameters.AddWithValue("@flddt_last_upd_date", _flddt_date)
                            dbcomm.Parameters.AddWithValue("@fldv_waybill_no", WayBillNoMst)
                            dbcomm.ExecuteNonQuery()
                            conn.Close()
                        Else
                            MessageBox.Show("WayBill Canot Blank")
                        End If
                    End If
                Next
                MessageBox.Show("Data Upload Successfully")
                btn_CollectCash.Enabled = True
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Else
            MessageBox.Show("Please Select Condutor")
        End If
    End Sub

    'Upload No Tickets Data
    Private Sub Upload_NoTicketData()
        For i As Integer = 0 To dgv_WayBillDetails.RowCount - 1
            dgv_WayBillDetails.Rows(i).Cells(3).Value = dgv_WayBillDetails.Rows(i).Cells(2).Value
            dgv_WayBillDetails.Rows(i).Cells(4).Value = 0
            dgv_WayBillDetails.Rows(i).Cells(5).Value = 0.0
            txt_totalAmount.Text = 0
        Next
    End Sub

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

    'Get Conductor Tickets Deatils
    Private Sub get_CoductorTicketDetails()
        Dim sQL As String
        Dim ConductorCode As String
        Dim _fldi_coupon_allocation_id As String
        Dim _fldv_coupon_blok_no As String
        Dim _fldi_coupon_next_numberas As String
        Dim _fldi_coupon_amountas As String
        Dim _fldv_nutrition_tax As String
        Dim _fldi_coupon_end_number As String

        If Not cmb_ConductorId.Text = "" Then
            ConductorCode = cmb_ConductorId.Text
            sQL = "SELECT a.fldi_coupon_allocation_id, a.fldv_coupon_blok_no, a.fldi_coupon_next_number, a.fldi_coupon_amount, b.fldv_nutrition_tax, fldi_coupon_end_number
                    FROM tbl_coupon_allocation_data AS a, tbl_coupon_amount_mst AS b
                    WHERE a.fldi_coupon_amt_id = b.fldi_coupon_amt_id
                        AND a.fldi_coupon_amount = b.fldi_coupon_amount
                        AND a.fldv_employee_code =  '" + ConductorCode + "'
                        AND a.fldc_coupon_completed =  'N'
                    ORDER BY a.fldi_coupon_amount, a.fldi_coupon_start_number"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(sQL, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    _fldi_coupon_allocation_id = dbread.GetString("fldi_coupon_allocation_id")
                    _fldv_coupon_blok_no = dbread.GetString("fldv_coupon_blok_no")
                    _fldi_coupon_next_numberas = dbread.GetString("fldi_coupon_next_number")
                    _fldi_coupon_amountas = dbread.GetString("fldi_coupon_amount")
                    _fldv_nutrition_tax = dbread.GetString("fldv_nutrition_tax")
                    _fldi_coupon_end_number = dbread.GetString("fldi_coupon_end_number")

                    'Grid View
                    dgv_WayBillDetails.Rows.Add(New String() {_fldi_coupon_amountas, _fldv_coupon_blok_no, _fldi_coupon_next_numberas, _fldi_coupon_next_numberas,
                                                0, "0.0", _fldv_nutrition_tax, _fldi_coupon_end_number})

                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        Else
            MessageBox.Show("Please Select Condutor")
        End If
    End Sub

    'DatagridView Calculations
    Private Sub dgv_Calculations()
        Dim Amount As Double

        For i As Integer = 0 To dgv_WayBillDetails.RowCount - 1
            Dim _NutritionTax As Double = CDbl(dgv_WayBillDetails.Rows(i).Cells(6).Value)

            If CInt(dgv_WayBillDetails.Rows(i).Cells(7).Value) >= CInt(dgv_WayBillDetails.Rows(i).Cells(3).Value) And
                    CInt(dgv_WayBillDetails.Rows(i).Cells(2).Value) <= CInt(dgv_WayBillDetails.Rows(i).Cells(3).Value) Then
                dgv_WayBillDetails.Rows(i).Cells(4).Value = dgv_WayBillDetails.Rows(i).Cells(3).Value - dgv_WayBillDetails.Rows(i).Cells(2).Value

                ' If Tax = 0
                If Not _NutritionTax = 0 Then
                    Dim _Denomination As Double = Math.Round(CDbl(dgv_WayBillDetails.Rows(i).Cells(0).Value))
                    dgv_WayBillDetails.Rows(i).Cells(5).Value = _Denomination * CDbl(dgv_WayBillDetails.Rows(i).Cells(4).Value)
                    Amount = CDbl(dgv_WayBillDetails.Rows(i).Cells(5).Value) + Amount
                    txt_totalAmount.Text = Amount
                Else
                    Dim _AddTax As Double = CDbl(dgv_WayBillDetails.Rows(i).Cells(0).Value) + _NutritionTax
                    Dim _Denomination As Double = Math.Round(_AddTax)
                    dgv_WayBillDetails.Rows(i).Cells(5).Value = _Denomination * CDbl(dgv_WayBillDetails.Rows(i).Cells(4).Value)
                    Amount = CDbl(dgv_WayBillDetails.Rows(i).Cells(5).Value) + Amount
                    txt_totalAmount.Text = Amount
                End If
            Else
                MessageBox.Show("Enter Valid Tickets Number")
                dgv_WayBillDetails.Rows(i).Cells(3).Value = dgv_WayBillDetails.Rows(i).Cells(2).Value
            End If

        Next
    End Sub

    'Get Way bill Create DAte
    Private Sub get_WayBillCreateDate()
        selectedItem = cmb_WayBillNo.Text
        If selectedItem = "" Then
        Else
            Dim Sql As String
            Dim waybill_created_date As String
            If Not conn Is Nothing Then conn.Close()
            Sql = "SELECT fldv_waybill_created_date FROM tbl_waybill_mst WHERE fldv_waybill_no = '" + selectedItem + "'"
            Try
                conn.Open()
                dbcomm = New MySqlCommand(Sql, conn)
                dbread = dbcomm.ExecuteReader
                While dbread.Read()
                    waybill_created_date = dbread.GetString("fldv_waybill_created_date")
                    txt_Date.Text = waybill_created_date
                End While
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
    End Sub

    'Combo box Conductor Id
    Private Sub cmb_ConductorCode()
        Dim Sql As String
        Sql = "SELECT fldi_conductor_id,fldv_employee_code FROM tbl_conductor_mst"
        Try
            conn.Open()
            dbcomm = New MySqlCommand(Sql, conn)
            Dim daAp As MySqlDataAdapter = New MySqlDataAdapter(dbcomm)
            Dim table As New DataTable()

            daAp.Fill(table)
            cmb_ConductorId.DataSource = table
            cmb_ConductorId.ValueMember = "fldi_conductor_id"
            cmb_ConductorId.DisplayMember = "fldv_employee_code"

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    'Combo Box Waybill Id
    Private Sub cmb_WayBillId()
        Dim Sql As String
        Dim ConductorId = cmb_ConductorId.Text
        'Sql = "SELECT fldi_waybill_id,fldv_waybill_no,fldv_waybill_created_date FROM tbl_waybill_mst"
        ' Sql = "SELECT fldi_waybill_id, fldv_waybill_no,fldv_waybill_created_date from  tbl_waybill_mst	where fldv_conductor_employee_code = '" + ConductorId + "'
        'and fldc_status = 'Y'and fldc_waybill_open_close_status = 'N' order by flddt_date"

        Sql = "SELECT fldi_waybill_id, fldv_waybill_no, fldv_waybill_created_date FROM tbl_waybill_mst    where fldv_conductor_employee_code = '" + ConductorId + "'
                    ORDER BY  fldi_waybill_id DESC LIMIT 1"

        Try
            conn.Open()
            dbcomm = New MySqlCommand(Sql, conn)
            Dim daAp As MySqlDataAdapter = New MySqlDataAdapter(dbcomm)
            Dim table As New DataTable()

            daAp.Fill(table)
            cmb_WayBillNo.DataSource = table
            cmb_WayBillNo.ValueMember = "fldi_waybill_id"
            cmb_WayBillNo.DisplayMember = "fldv_waybill_no"

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    'Combo Box Port
    Private Sub get_cmbPort()
        System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = False
        For Each sp As String In My.Computer.Ports.SerialPortNames
            cmbPortList.Items.Add(sp)
        Next
    End Sub

    'DataBase
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

    'Form Load
    Private Sub frm_CouponCollection_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        btn_CollectCash.Enabled = False
        get_cmbPort()
        lab_UserName.Text = _UserName
        cmb_ConductorId.Text = _ConductorEmpCOde
        cmb_WayBillNo.Text = _ConductorWayBillNo
        db_connection()
        login_UserId()
        get_WayBillCreateDate()
    End Sub

    'Combo Box Click
    Private Sub cmb_ConductorId_Click(sender As Object, e As EventArgs) Handles cmb_ConductorId.Click
        cmb_ConductorCode()
    End Sub

    'Combo box Select index
    Private Sub cmb_WayBillNo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmb_WayBillNo.SelectedIndexChanged
        get_WayBillCreateDate()
    End Sub

    Private Sub cmb_WayBillNo_Click(sender As Object, e As EventArgs) Handles cmb_WayBillNo.Click
        cmb_WayBillId()
    End Sub

    'btn Get Conductor Ticket details
    Private Sub btn_GetConductorTicketDetail_Click(sender As Object, e As EventArgs) Handles btn_GetConductorTicketDetail.Click
        btn_GetConductorTicketDetail.Enabled = False
        dgv_WayBillDetails.Rows.Clear()
        get_CoductorTicketDetails()
        btn_GetConductorTicketDetail.Enabled = True
    End Sub

    'DataGridView
    Private Sub dgv_WayBillDetails_CellEndEdit(sender As Object, e As DataGridViewCellEventArgs) Handles dgv_WayBillDetails.CellEndEdit
        dgv_Calculations()

    End Sub

    'btn Upload ticket Data
    Private Sub btn_UploadTicketsData_Click(sender As Object, e As EventArgs) Handles btn_UploadTicketsData.Click
        btn_UploadTicketsData.Enabled = False
        Upload_TicketData()
        btn_UploadTicketsData.Enabled = True
    End Sub

    'btn Cash Collection
    Private Sub btn_CollectCash_Click(sender As Object, e As EventArgs) Handles btn_CollectCash.Click
        btn_CollectCash.Enabled = False
        _TotalCouponAmount = txt_totalAmount.Text
        _ConEmpWayBill = cmb_WayBillNo.Text
        If CB_NoTicketSold.Checked = True Then
            _TotalCouponAmount = 0
            Me.Close()
            Dim CollectCash = New frm_CollectCash
            CollectCash.Show()
        Else
            Dim CollectCash = New frm_CollectCash
            CollectCash.Show()
        End If
        update_WayBillMst()
        btn_CollectCash.Enabled = True
    End Sub

    Private Sub CB_NoTicketSold_CheckedChanged(sender As Object, e As EventArgs) Handles CB_NoTicketSold.CheckedChanged
        Upload_NoTicketData()
        'Upload_TicketData()
    End Sub

    'Update wAYbILL maSTER
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
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            conn.Close()
        End If
    End Sub


End Class