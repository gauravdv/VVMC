<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_CouponCollection
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lab_User = New System.Windows.Forms.Label()
        Me.lab_UserName = New System.Windows.Forms.Label()
        Me.cmbPortList = New System.Windows.Forms.ComboBox()
        Me.lab_Port = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.cmb_WayBillNo = New System.Windows.Forms.ComboBox()
        Me.cmb_ConductorId = New System.Windows.Forms.ComboBox()
        Me.btn_GetConductorTicketDetail = New System.Windows.Forms.Button()
        Me.dgv_WayBillDetails = New System.Windows.Forms.DataGridView()
        Me.Column1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CB_NoTicketSold = New System.Windows.Forms.CheckBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txt_totalAmount = New System.Windows.Forms.TextBox()
        Me.btn_UploadTicketsData = New System.Windows.Forms.Button()
        Me.btn_CollectCash = New System.Windows.Forms.Button()
        Me.txt_Date = New System.Windows.Forms.TextBox()
        Me.Panel1.SuspendLayout()
        CType(Me.dgv_WayBillDetails, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(414, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(381, 24)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Vasai-Virar Municipal Transport (VVMT)"
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.lab_User)
        Me.Panel1.Controls.Add(Me.lab_UserName)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 609)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(1235, 22)
        Me.Panel1.TabIndex = 24
        Me.Panel1.Visible = False
        '
        'lab_User
        '
        Me.lab_User.AutoSize = True
        Me.lab_User.Location = New System.Drawing.Point(3, 5)
        Me.lab_User.Name = "lab_User"
        Me.lab_User.Size = New System.Drawing.Size(35, 13)
        Me.lab_User.TabIndex = 11
        Me.lab_User.Text = "User :"
        '
        'lab_UserName
        '
        Me.lab_UserName.AutoSize = True
        Me.lab_UserName.Location = New System.Drawing.Point(38, 5)
        Me.lab_UserName.Name = "lab_UserName"
        Me.lab_UserName.Size = New System.Drawing.Size(57, 13)
        Me.lab_UserName.TabIndex = 10
        Me.lab_UserName.Text = "UserName"
        '
        'cmbPortList
        '
        Me.cmbPortList.FormattingEnabled = True
        Me.cmbPortList.Location = New System.Drawing.Point(633, 48)
        Me.cmbPortList.Name = "cmbPortList"
        Me.cmbPortList.Size = New System.Drawing.Size(82, 21)
        Me.cmbPortList.TabIndex = 26
        Me.cmbPortList.Visible = False
        '
        'lab_Port
        '
        Me.lab_Port.AutoSize = True
        Me.lab_Port.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_Port.Location = New System.Drawing.Point(510, 48)
        Me.lab_Port.Name = "lab_Port"
        Me.lab_Port.Size = New System.Drawing.Size(117, 17)
        Me.lab_Port.TabIndex = 25
        Me.lab_Port.Text = "Select Serial Port"
        Me.lab_Port.Visible = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(536, 72)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 17)
        Me.Label2.TabIndex = 27
        Me.Label2.Text = "Conductor Id"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(515, 97)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(108, 17)
        Me.Label3.TabIndex = 28
        Me.Label3.Text = "WayBill Number"
        '
        'cmb_WayBillNo
        '
        Me.cmb_WayBillNo.FormattingEnabled = True
        Me.cmb_WayBillNo.Location = New System.Drawing.Point(633, 98)
        Me.cmb_WayBillNo.Name = "cmb_WayBillNo"
        Me.cmb_WayBillNo.Size = New System.Drawing.Size(82, 21)
        Me.cmb_WayBillNo.TabIndex = 29
        '
        'cmb_ConductorId
        '
        Me.cmb_ConductorId.FormattingEnabled = True
        Me.cmb_ConductorId.Location = New System.Drawing.Point(633, 73)
        Me.cmb_ConductorId.Name = "cmb_ConductorId"
        Me.cmb_ConductorId.Size = New System.Drawing.Size(82, 21)
        Me.cmb_ConductorId.TabIndex = 30
        '
        'btn_GetConductorTicketDetail
        '
        Me.btn_GetConductorTicketDetail.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_GetConductorTicketDetail.Location = New System.Drawing.Point(518, 154)
        Me.btn_GetConductorTicketDetail.Name = "btn_GetConductorTicketDetail"
        Me.btn_GetConductorTicketDetail.Size = New System.Drawing.Size(219, 27)
        Me.btn_GetConductorTicketDetail.TabIndex = 31
        Me.btn_GetConductorTicketDetail.Text = "Get Conductor Ticket Details"
        Me.btn_GetConductorTicketDetail.UseVisualStyleBackColor = True
        '
        'dgv_WayBillDetails
        '
        Me.dgv_WayBillDetails.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_WayBillDetails.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.Column2, Me.Column3, Me.Column4, Me.Column5, Me.Column6, Me.Column7, Me.Column8})
        Me.dgv_WayBillDetails.Location = New System.Drawing.Point(234, 197)
        Me.dgv_WayBillDetails.Name = "dgv_WayBillDetails"
        Me.dgv_WayBillDetails.Size = New System.Drawing.Size(793, 325)
        Me.dgv_WayBillDetails.TabIndex = 33
        '
        'Column1
        '
        Me.Column1.HeaderText = "Denomination"
        Me.Column1.Name = "Column1"
        '
        'Column2
        '
        Me.Column2.HeaderText = "Ticket Block Series No"
        Me.Column2.Name = "Column2"
        Me.Column2.Width = 150
        '
        'Column3
        '
        Me.Column3.HeaderText = "Ticket Start Number"
        Me.Column3.Name = "Column3"
        Me.Column3.Width = 150
        '
        'Column4
        '
        Me.Column4.HeaderText = "Ticket End Number"
        Me.Column4.Name = "Column4"
        Me.Column4.Width = 150
        '
        'Column5
        '
        Me.Column5.HeaderText = "No of Tickets"
        Me.Column5.Name = "Column5"
        '
        'Column6
        '
        Me.Column6.HeaderText = "Amount"
        Me.Column6.Name = "Column6"
        '
        'Column7
        '
        Me.Column7.HeaderText = "Nutrition Tax"
        Me.Column7.Name = "Column7"
        '
        'Column8
        '
        Me.Column8.HeaderText = "Ticket Max Number"
        Me.Column8.Name = "Column8"
        '
        'CB_NoTicketSold
        '
        Me.CB_NoTicketSold.AutoSize = True
        Me.CB_NoTicketSold.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CB_NoTicketSold.Location = New System.Drawing.Point(537, 529)
        Me.CB_NoTicketSold.Name = "CB_NoTicketSold"
        Me.CB_NoTicketSold.Size = New System.Drawing.Size(126, 21)
        Me.CB_NoTicketSold.TabIndex = 34
        Me.CB_NoTicketSold.Text = "No Tickets Sold"
        Me.CB_NoTicketSold.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(457, 559)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(134, 17)
        Me.Label4.TabIndex = 35
        Me.Label4.Text = "Total Ticket Amount"
        '
        'txt_totalAmount
        '
        Me.txt_totalAmount.Location = New System.Drawing.Point(597, 557)
        Me.txt_totalAmount.Name = "txt_totalAmount"
        Me.txt_totalAmount.Size = New System.Drawing.Size(137, 20)
        Me.txt_totalAmount.TabIndex = 36
        Me.txt_totalAmount.Text = "0"
        '
        'btn_UploadTicketsData
        '
        Me.btn_UploadTicketsData.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_UploadTicketsData.Location = New System.Drawing.Point(431, 584)
        Me.btn_UploadTicketsData.Name = "btn_UploadTicketsData"
        Me.btn_UploadTicketsData.Size = New System.Drawing.Size(157, 31)
        Me.btn_UploadTicketsData.TabIndex = 37
        Me.btn_UploadTicketsData.Text = "Upload Ticket Data"
        Me.btn_UploadTicketsData.UseVisualStyleBackColor = True
        '
        'btn_CollectCash
        '
        Me.btn_CollectCash.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_CollectCash.Location = New System.Drawing.Point(594, 583)
        Me.btn_CollectCash.Name = "btn_CollectCash"
        Me.btn_CollectCash.Size = New System.Drawing.Size(146, 33)
        Me.btn_CollectCash.TabIndex = 38
        Me.btn_CollectCash.Text = "Collect Cash"
        Me.btn_CollectCash.UseVisualStyleBackColor = True
        '
        'txt_Date
        '
        Me.txt_Date.Location = New System.Drawing.Point(615, 128)
        Me.txt_Date.Name = "txt_Date"
        Me.txt_Date.Size = New System.Drawing.Size(100, 20)
        Me.txt_Date.TabIndex = 32
        '
        'frm_CouponCollection
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1235, 631)
        Me.Controls.Add(Me.btn_CollectCash)
        Me.Controls.Add(Me.btn_UploadTicketsData)
        Me.Controls.Add(Me.txt_totalAmount)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.CB_NoTicketSold)
        Me.Controls.Add(Me.dgv_WayBillDetails)
        Me.Controls.Add(Me.txt_Date)
        Me.Controls.Add(Me.btn_GetConductorTicketDetail)
        Me.Controls.Add(Me.cmb_ConductorId)
        Me.Controls.Add(Me.cmb_WayBillNo)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.cmbPortList)
        Me.Controls.Add(Me.lab_Port)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.Label1)
        Me.Name = "frm_CouponCollection"
        Me.Text = "Coupon Cololection "
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        CType(Me.dgv_WayBillDetails, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Panel1 As Panel
    Friend WithEvents lab_User As Label
    Friend WithEvents lab_UserName As Label
    Friend WithEvents cmbPortList As ComboBox
    Friend WithEvents lab_Port As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents cmb_WayBillNo As ComboBox
    Friend WithEvents cmb_ConductorId As ComboBox
    Friend WithEvents btn_GetConductorTicketDetail As Button
    Friend WithEvents dgv_WayBillDetails As DataGridView
    Friend WithEvents CB_NoTicketSold As CheckBox
    Friend WithEvents Label4 As Label
    Friend WithEvents txt_totalAmount As TextBox
    Friend WithEvents btn_UploadTicketsData As Button
    Friend WithEvents btn_CollectCash As Button
    Friend WithEvents Column1 As DataGridViewTextBoxColumn
    Friend WithEvents Column2 As DataGridViewTextBoxColumn
    Friend WithEvents Column3 As DataGridViewTextBoxColumn
    Friend WithEvents Column4 As DataGridViewTextBoxColumn
    Friend WithEvents Column5 As DataGridViewTextBoxColumn
    Friend WithEvents Column6 As DataGridViewTextBoxColumn
    Friend WithEvents Column7 As DataGridViewTextBoxColumn
    Friend WithEvents Column8 As DataGridViewTextBoxColumn
    Friend WithEvents txt_Date As TextBox
End Class
