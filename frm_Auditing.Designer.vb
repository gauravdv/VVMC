<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frm_Auditing
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lab_Port = New System.Windows.Forms.Label()
        Me.lab_WayBill = New System.Windows.Forms.Label()
        Me.lab_Ticket = New System.Windows.Forms.Label()
        Me.lab_SmartCard = New System.Windows.Forms.Label()
        Me.cmbPortList = New System.Windows.Forms.ComboBox()
        Me.txt_WayBill = New System.Windows.Forms.RichTextBox()
        Me.btn_CollectWayBill = New System.Windows.Forms.Button()
        Me.txt_Ticket = New System.Windows.Forms.RichTextBox()
        Me.txt_SmartCard = New System.Windows.Forms.RichTextBox()
        Me.btn_CollectTicket = New System.Windows.Forms.Button()
        Me.btn_UploadTicket = New System.Windows.Forms.Button()
        Me.btn_CollectCardData = New System.Windows.Forms.Button()
        Me.btn_UploadCardData = New System.Windows.Forms.Button()
        Me.btn_CollectCash = New System.Windows.Forms.Button()
        Me.btn_EraseTicket = New System.Windows.Forms.Button()
        Me.btn_DeleteBill = New System.Windows.Forms.Button()
        Me.lab_TotalTicketCollection = New System.Windows.Forms.Label()
        Me.lab_TotalTopupCollection = New System.Windows.Forms.Label()
        Me.lab_TotalCollection = New System.Windows.Forms.Label()
        Me.txt_TotalTicketCollection = New System.Windows.Forms.TextBox()
        Me.txt_TotalTopupCollection = New System.Windows.Forms.TextBox()
        Me.txt_TotalCollection = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(311, 43)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(381, 24)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Vasai-Virar Municipal Transport (VVMT)"
        '
        'lab_Port
        '
        Me.lab_Port.AutoSize = True
        Me.lab_Port.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_Port.Location = New System.Drawing.Point(378, 116)
        Me.lab_Port.Name = "lab_Port"
        Me.lab_Port.Size = New System.Drawing.Size(117, 17)
        Me.lab_Port.TabIndex = 1
        Me.lab_Port.Text = "Select Serial Port"
        '
        'lab_WayBill
        '
        Me.lab_WayBill.AutoSize = True
        Me.lab_WayBill.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_WayBill.Location = New System.Drawing.Point(65, 180)
        Me.lab_WayBill.Name = "lab_WayBill"
        Me.lab_WayBill.Size = New System.Drawing.Size(54, 17)
        Me.lab_WayBill.TabIndex = 2
        Me.lab_WayBill.Text = "WayBill"
        '
        'lab_Ticket
        '
        Me.lab_Ticket.AutoSize = True
        Me.lab_Ticket.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_Ticket.Location = New System.Drawing.Point(65, 249)
        Me.lab_Ticket.Name = "lab_Ticket"
        Me.lab_Ticket.Size = New System.Drawing.Size(46, 17)
        Me.lab_Ticket.TabIndex = 3
        Me.lab_Ticket.Text = "Ticket"
        '
        'lab_SmartCard
        '
        Me.lab_SmartCard.AutoSize = True
        Me.lab_SmartCard.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_SmartCard.Location = New System.Drawing.Point(52, 362)
        Me.lab_SmartCard.Name = "lab_SmartCard"
        Me.lab_SmartCard.Size = New System.Drawing.Size(79, 17)
        Me.lab_SmartCard.TabIndex = 4
        Me.lab_SmartCard.Text = "Smart Card"
        '
        'cmbPortList
        '
        Me.cmbPortList.FormattingEnabled = True
        Me.cmbPortList.Location = New System.Drawing.Point(501, 116)
        Me.cmbPortList.Name = "cmbPortList"
        Me.cmbPortList.Size = New System.Drawing.Size(82, 21)
        Me.cmbPortList.TabIndex = 5
        '
        'txt_WayBill
        '
        Me.txt_WayBill.Location = New System.Drawing.Point(171, 162)
        Me.txt_WayBill.Name = "txt_WayBill"
        Me.txt_WayBill.Size = New System.Drawing.Size(811, 56)
        Me.txt_WayBill.TabIndex = 6
        Me.txt_WayBill.Text = ""
        '
        'btn_CollectWayBill
        '
        Me.btn_CollectWayBill.Location = New System.Drawing.Point(140, 452)
        Me.btn_CollectWayBill.Name = "btn_CollectWayBill"
        Me.btn_CollectWayBill.Size = New System.Drawing.Size(100, 30)
        Me.btn_CollectWayBill.TabIndex = 7
        Me.btn_CollectWayBill.Text = "Collect WayBill"
        Me.btn_CollectWayBill.UseVisualStyleBackColor = True
        '
        'txt_Ticket
        '
        Me.txt_Ticket.Location = New System.Drawing.Point(171, 224)
        Me.txt_Ticket.Name = "txt_Ticket"
        Me.txt_Ticket.Size = New System.Drawing.Size(811, 121)
        Me.txt_Ticket.TabIndex = 8
        Me.txt_Ticket.Text = ""
        '
        'txt_SmartCard
        '
        Me.txt_SmartCard.Location = New System.Drawing.Point(171, 351)
        Me.txt_SmartCard.Name = "txt_SmartCard"
        Me.txt_SmartCard.Size = New System.Drawing.Size(811, 28)
        Me.txt_SmartCard.TabIndex = 9
        Me.txt_SmartCard.Text = ""
        '
        'btn_CollectTicket
        '
        Me.btn_CollectTicket.Location = New System.Drawing.Point(246, 452)
        Me.btn_CollectTicket.Name = "btn_CollectTicket"
        Me.btn_CollectTicket.Size = New System.Drawing.Size(100, 30)
        Me.btn_CollectTicket.TabIndex = 10
        Me.btn_CollectTicket.Text = "Collect Ticket"
        Me.btn_CollectTicket.UseVisualStyleBackColor = True
        '
        'btn_UploadTicket
        '
        Me.btn_UploadTicket.Location = New System.Drawing.Point(352, 452)
        Me.btn_UploadTicket.Name = "btn_UploadTicket"
        Me.btn_UploadTicket.Size = New System.Drawing.Size(100, 30)
        Me.btn_UploadTicket.TabIndex = 11
        Me.btn_UploadTicket.Text = "Upload Ticket"
        Me.btn_UploadTicket.UseVisualStyleBackColor = True
        '
        'btn_CollectCardData
        '
        Me.btn_CollectCardData.Location = New System.Drawing.Point(458, 452)
        Me.btn_CollectCardData.Name = "btn_CollectCardData"
        Me.btn_CollectCardData.Size = New System.Drawing.Size(100, 30)
        Me.btn_CollectCardData.TabIndex = 12
        Me.btn_CollectCardData.Text = "Collect Card Data"
        Me.btn_CollectCardData.UseVisualStyleBackColor = True
        '
        'btn_UploadCardData
        '
        Me.btn_UploadCardData.Location = New System.Drawing.Point(564, 452)
        Me.btn_UploadCardData.Name = "btn_UploadCardData"
        Me.btn_UploadCardData.Size = New System.Drawing.Size(100, 30)
        Me.btn_UploadCardData.TabIndex = 13
        Me.btn_UploadCardData.Text = "Upload card Data"
        Me.btn_UploadCardData.UseVisualStyleBackColor = True
        '
        'btn_CollectCash
        '
        Me.btn_CollectCash.Location = New System.Drawing.Point(670, 452)
        Me.btn_CollectCash.Name = "btn_CollectCash"
        Me.btn_CollectCash.Size = New System.Drawing.Size(100, 30)
        Me.btn_CollectCash.TabIndex = 14
        Me.btn_CollectCash.Text = "Collect Cash"
        Me.btn_CollectCash.UseVisualStyleBackColor = True
        '
        'btn_EraseTicket
        '
        Me.btn_EraseTicket.Location = New System.Drawing.Point(776, 452)
        Me.btn_EraseTicket.Name = "btn_EraseTicket"
        Me.btn_EraseTicket.Size = New System.Drawing.Size(100, 30)
        Me.btn_EraseTicket.TabIndex = 15
        Me.btn_EraseTicket.Text = "Erase Ticket"
        Me.btn_EraseTicket.UseVisualStyleBackColor = True
        '
        'btn_DeleteBill
        '
        Me.btn_DeleteBill.Location = New System.Drawing.Point(882, 452)
        Me.btn_DeleteBill.Name = "btn_DeleteBill"
        Me.btn_DeleteBill.Size = New System.Drawing.Size(100, 30)
        Me.btn_DeleteBill.TabIndex = 16
        Me.btn_DeleteBill.Text = "Delete WayBill"
        Me.btn_DeleteBill.UseVisualStyleBackColor = True
        '
        'lab_TotalTicketCollection
        '
        Me.lab_TotalTicketCollection.AutoSize = True
        Me.lab_TotalTicketCollection.Location = New System.Drawing.Point(306, 526)
        Me.lab_TotalTicketCollection.Name = "lab_TotalTicketCollection"
        Me.lab_TotalTicketCollection.Size = New System.Drawing.Size(113, 13)
        Me.lab_TotalTicketCollection.TabIndex = 17
        Me.lab_TotalTicketCollection.Text = "Total Ticket Collection"
        '
        'lab_TotalTopupCollection
        '
        Me.lab_TotalTopupCollection.AutoSize = True
        Me.lab_TotalTopupCollection.Location = New System.Drawing.Point(307, 557)
        Me.lab_TotalTopupCollection.Name = "lab_TotalTopupCollection"
        Me.lab_TotalTopupCollection.Size = New System.Drawing.Size(114, 13)
        Me.lab_TotalTopupCollection.TabIndex = 18
        Me.lab_TotalTopupCollection.Text = "Total Topup Collection"
        '
        'lab_TotalCollection
        '
        Me.lab_TotalCollection.AutoSize = True
        Me.lab_TotalCollection.Location = New System.Drawing.Point(307, 586)
        Me.lab_TotalCollection.Name = "lab_TotalCollection"
        Me.lab_TotalCollection.Size = New System.Drawing.Size(80, 13)
        Me.lab_TotalCollection.TabIndex = 19
        Me.lab_TotalCollection.Text = "Total Collection"
        '
        'txt_TotalTicketCollection
        '
        Me.txt_TotalTicketCollection.Location = New System.Drawing.Point(457, 518)
        Me.txt_TotalTicketCollection.Name = "txt_TotalTicketCollection"
        Me.txt_TotalTicketCollection.Size = New System.Drawing.Size(100, 20)
        Me.txt_TotalTicketCollection.TabIndex = 20
        '
        'txt_TotalTopupCollection
        '
        Me.txt_TotalTopupCollection.Location = New System.Drawing.Point(457, 551)
        Me.txt_TotalTopupCollection.Name = "txt_TotalTopupCollection"
        Me.txt_TotalTopupCollection.Size = New System.Drawing.Size(100, 20)
        Me.txt_TotalTopupCollection.TabIndex = 21
        '
        'txt_TotalCollection
        '
        Me.txt_TotalCollection.Location = New System.Drawing.Point(457, 583)
        Me.txt_TotalCollection.Name = "txt_TotalCollection"
        Me.txt_TotalCollection.Size = New System.Drawing.Size(100, 20)
        Me.txt_TotalCollection.TabIndex = 22
        '
        'frm_Auditing
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1006, 608)
        Me.Controls.Add(Me.txt_TotalCollection)
        Me.Controls.Add(Me.txt_TotalTopupCollection)
        Me.Controls.Add(Me.txt_TotalTicketCollection)
        Me.Controls.Add(Me.lab_TotalCollection)
        Me.Controls.Add(Me.lab_TotalTopupCollection)
        Me.Controls.Add(Me.lab_TotalTicketCollection)
        Me.Controls.Add(Me.btn_DeleteBill)
        Me.Controls.Add(Me.btn_EraseTicket)
        Me.Controls.Add(Me.btn_CollectCash)
        Me.Controls.Add(Me.btn_UploadCardData)
        Me.Controls.Add(Me.btn_CollectCardData)
        Me.Controls.Add(Me.btn_UploadTicket)
        Me.Controls.Add(Me.btn_CollectTicket)
        Me.Controls.Add(Me.txt_SmartCard)
        Me.Controls.Add(Me.txt_Ticket)
        Me.Controls.Add(Me.btn_CollectWayBill)
        Me.Controls.Add(Me.txt_WayBill)
        Me.Controls.Add(Me.cmbPortList)
        Me.Controls.Add(Me.lab_SmartCard)
        Me.Controls.Add(Me.lab_Ticket)
        Me.Controls.Add(Me.lab_WayBill)
        Me.Controls.Add(Me.lab_Port)
        Me.Controls.Add(Me.Label1)
        Me.Name = "frm_Auditing"
        Me.Text = "Auditing"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents lab_Port As Label
    Friend WithEvents lab_WayBill As Label
    Friend WithEvents lab_Ticket As Label
    Friend WithEvents lab_SmartCard As Label
    Friend WithEvents cmbPortList As ComboBox
    Friend WithEvents txt_WayBill As RichTextBox
    Friend WithEvents btn_CollectWayBill As Button
    Friend WithEvents txt_Ticket As RichTextBox
    Friend WithEvents txt_SmartCard As RichTextBox
    Friend WithEvents btn_CollectTicket As Button
    Friend WithEvents btn_UploadTicket As Button
    Friend WithEvents btn_CollectCardData As Button
    Friend WithEvents btn_UploadCardData As Button
    Friend WithEvents btn_CollectCash As Button
    Friend WithEvents btn_EraseTicket As Button
    Friend WithEvents btn_DeleteBill As Button
    Friend WithEvents lab_TotalTicketCollection As Label
    Friend WithEvents lab_TotalTopupCollection As Label
    Friend WithEvents lab_TotalCollection As Label
    Friend WithEvents txt_TotalTicketCollection As TextBox
    Friend WithEvents txt_TotalTopupCollection As TextBox
    Friend WithEvents txt_TotalCollection As TextBox
End Class
