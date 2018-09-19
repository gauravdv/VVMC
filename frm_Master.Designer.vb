<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_Master
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
        Me.components = New System.ComponentModel.Container()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cmbPortList = New System.Windows.Forms.ComboBox()
        Me.lab_Port = New System.Windows.Forms.Label()
        Me.txt_WayBill = New System.Windows.Forms.TextBox()
        Me.btn_GetWayBill = New System.Windows.Forms.Button()
        Me.dgv_WayBillDetails = New System.Windows.Forms.DataGridView()
        Me.Column1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column10 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lab_User = New System.Windows.Forms.Label()
        Me.lab_UserName = New System.Windows.Forms.Label()
        Me.IoPort = New System.IO.Ports.SerialPort(Me.components)
        CType(Me.dgv_WayBillDetails, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(432, 52)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(381, 24)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "Vasai-Virar Municipal Transport (VVMT)"
        '
        'cmbPortList
        '
        Me.cmbPortList.FormattingEnabled = True
        Me.cmbPortList.Location = New System.Drawing.Point(629, 92)
        Me.cmbPortList.Name = "cmbPortList"
        Me.cmbPortList.Size = New System.Drawing.Size(72, 21)
        Me.cmbPortList.TabIndex = 10
        '
        'lab_Port
        '
        Me.lab_Port.AutoSize = True
        Me.lab_Port.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_Port.Location = New System.Drawing.Point(506, 92)
        Me.lab_Port.Name = "lab_Port"
        Me.lab_Port.Size = New System.Drawing.Size(117, 17)
        Me.lab_Port.TabIndex = 9
        Me.lab_Port.Text = "Select Serial Port"
        '
        'txt_WayBill
        '
        Me.txt_WayBill.Location = New System.Drawing.Point(480, 141)
        Me.txt_WayBill.Name = "txt_WayBill"
        Me.txt_WayBill.Size = New System.Drawing.Size(123, 20)
        Me.txt_WayBill.TabIndex = 11
        '
        'btn_GetWayBill
        '
        Me.btn_GetWayBill.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_GetWayBill.Location = New System.Drawing.Point(626, 138)
        Me.btn_GetWayBill.Name = "btn_GetWayBill"
        Me.btn_GetWayBill.Size = New System.Drawing.Size(96, 29)
        Me.btn_GetWayBill.TabIndex = 12
        Me.btn_GetWayBill.Text = "Get WayBill"
        Me.btn_GetWayBill.UseVisualStyleBackColor = True
        '
        'dgv_WayBillDetails
        '
        Me.dgv_WayBillDetails.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_WayBillDetails.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.Column2, Me.Column3, Me.Column4, Me.Column5, Me.Column6, Me.Column7, Me.Column8, Me.Column9, Me.Column10, Me.Column11})
        Me.dgv_WayBillDetails.Location = New System.Drawing.Point(275, 189)
        Me.dgv_WayBillDetails.Name = "dgv_WayBillDetails"
        Me.dgv_WayBillDetails.Size = New System.Drawing.Size(767, 257)
        Me.dgv_WayBillDetails.TabIndex = 13
        '
        'Column1
        '
        Me.Column1.HeaderText = "Way bIll No"
        Me.Column1.Name = "Column1"
        '
        'Column2
        '
        Me.Column2.HeaderText = "Conductor Id"
        Me.Column2.Name = "Column2"
        '
        'Column3
        '
        Me.Column3.HeaderText = "Driver Id"
        Me.Column3.Name = "Column3"
        '
        'Column4
        '
        Me.Column4.HeaderText = "Vehicle No"
        Me.Column4.Name = "Column4"
        '
        'Column5
        '
        Me.Column5.HeaderText = "Etm No"
        Me.Column5.Name = "Column5"
        '
        'Column6
        '
        Me.Column6.HeaderText = "Division Name"
        Me.Column6.Name = "Column6"
        '
        'Column7
        '
        Me.Column7.HeaderText = "Division No"
        Me.Column7.Name = "Column7"
        '
        'Column8
        '
        Me.Column8.HeaderText = "Depot Name"
        Me.Column8.Name = "Column8"
        '
        'Column9
        '
        Me.Column9.HeaderText = "Depot Code"
        Me.Column9.Name = "Column9"
        '
        'Column10
        '
        Me.Column10.HeaderText = "Shedule"
        Me.Column10.Name = "Column10"
        '
        'Column11
        '
        Me.Column11.HeaderText = "Way Bill Date"
        Me.Column11.Name = "Column11"
        '
        'Button1
        '
        Me.Button1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button1.Location = New System.Drawing.Point(549, 455)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(141, 33)
        Me.Button1.TabIndex = 14
        Me.Button1.Text = "Upload WayBill"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.lab_User)
        Me.Panel1.Controls.Add(Me.lab_UserName)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 540)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(1246, 23)
        Me.Panel1.TabIndex = 15
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
        'frm_Master
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1246, 563)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.dgv_WayBillDetails)
        Me.Controls.Add(Me.btn_GetWayBill)
        Me.Controls.Add(Me.txt_WayBill)
        Me.Controls.Add(Me.cmbPortList)
        Me.Controls.Add(Me.lab_Port)
        Me.Controls.Add(Me.Label1)
        Me.Name = "frm_Master"
        Me.Text = "Generate WayBill"
        CType(Me.dgv_WayBillDetails, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents cmbPortList As ComboBox
    Friend WithEvents lab_Port As Label
    Friend WithEvents txt_WayBill As TextBox
    Friend WithEvents btn_GetWayBill As Button
    Friend WithEvents dgv_WayBillDetails As DataGridView
    Friend WithEvents Column1 As DataGridViewTextBoxColumn
    Friend WithEvents Column2 As DataGridViewTextBoxColumn
    Friend WithEvents Column3 As DataGridViewTextBoxColumn
    Friend WithEvents Column4 As DataGridViewTextBoxColumn
    Friend WithEvents Column5 As DataGridViewTextBoxColumn
    Friend WithEvents Column6 As DataGridViewTextBoxColumn
    Friend WithEvents Column7 As DataGridViewTextBoxColumn
    Friend WithEvents Column8 As DataGridViewTextBoxColumn
    Friend WithEvents Column9 As DataGridViewTextBoxColumn
    Friend WithEvents Column10 As DataGridViewTextBoxColumn
    Friend WithEvents Column11 As DataGridViewTextBoxColumn
    Friend WithEvents Button1 As Button
    Friend WithEvents Panel1 As Panel
    Friend WithEvents lab_User As Label
    Friend WithEvents lab_UserName As Label
    Friend WithEvents IoPort As IO.Ports.SerialPort
End Class
