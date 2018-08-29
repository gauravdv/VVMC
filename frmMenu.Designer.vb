<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmMenu
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
        Me.btn_Master = New System.Windows.Forms.GroupBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.btn_Auditing = New System.Windows.Forms.Button()
        Me.btn_Push = New System.Windows.Forms.Button()
        Me.btnExit = New System.Windows.Forms.Button()
        Me.BtnErase = New System.Windows.Forms.Button()
        Me.btnDownLoad = New System.Windows.Forms.Button()
        Me.btnSendFile = New System.Windows.Forms.Button()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.txtProcStat = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.CMBPORTNO = New System.Windows.Forms.ComboBox()
        Me.btn_Master.SuspendLayout()
        Me.SuspendLayout()
        '
        'btn_Master
        '
        Me.btn_Master.Controls.Add(Me.Button1)
        Me.btn_Master.Controls.Add(Me.btn_Auditing)
        Me.btn_Master.Controls.Add(Me.btn_Push)
        Me.btn_Master.Controls.Add(Me.CMBPORTNO)
        Me.btn_Master.Controls.Add(Me.btnExit)
        Me.btn_Master.Controls.Add(Me.BtnErase)
        Me.btn_Master.Controls.Add(Me.btnDownLoad)
        Me.btn_Master.Controls.Add(Me.btnSendFile)
        Me.btn_Master.Location = New System.Drawing.Point(97, 70)
        Me.btn_Master.Name = "btn_Master"
        Me.btn_Master.Size = New System.Drawing.Size(241, 282)
        Me.btn_Master.TabIndex = 0
        Me.btn_Master.TabStop = False
        '
        'Button1
        '
        Me.Button1.BackColor = System.Drawing.Color.Blue
        Me.Button1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.Button1.Location = New System.Drawing.Point(23, 66)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(193, 42)
        Me.Button1.TabIndex = 7
        Me.Button1.Text = "Master"
        Me.Button1.UseVisualStyleBackColor = False
        '
        'btn_Auditing
        '
        Me.btn_Auditing.BackColor = System.Drawing.Color.Blue
        Me.btn_Auditing.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_Auditing.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.btn_Auditing.Location = New System.Drawing.Point(23, 136)
        Me.btn_Auditing.Name = "btn_Auditing"
        Me.btn_Auditing.Size = New System.Drawing.Size(193, 42)
        Me.btn_Auditing.TabIndex = 6
        Me.btn_Auditing.Text = "Auditing"
        Me.btn_Auditing.UseVisualStyleBackColor = False
        '
        'btn_Push
        '
        Me.btn_Push.Location = New System.Drawing.Point(23, 265)
        Me.btn_Push.Name = "btn_Push"
        Me.btn_Push.Size = New System.Drawing.Size(10, 29)
        Me.btn_Push.TabIndex = 5
        Me.btn_Push.Text = "Push"
        Me.btn_Push.UseVisualStyleBackColor = True
        Me.btn_Push.Visible = False
        '
        'btnExit
        '
        Me.btnExit.BackColor = System.Drawing.Color.Blue
        Me.btnExit.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnExit.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.btnExit.Location = New System.Drawing.Point(23, 207)
        Me.btnExit.Name = "btnExit"
        Me.btnExit.Size = New System.Drawing.Size(193, 42)
        Me.btnExit.TabIndex = 3
        Me.btnExit.Text = "Close"
        Me.btnExit.UseVisualStyleBackColor = False
        '
        'BtnErase
        '
        Me.BtnErase.BackColor = System.Drawing.Color.Blue
        Me.BtnErase.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BtnErase.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.BtnErase.Location = New System.Drawing.Point(23, 207)
        Me.BtnErase.Name = "BtnErase"
        Me.BtnErase.Size = New System.Drawing.Size(193, 42)
        Me.BtnErase.TabIndex = 2
        Me.BtnErase.Text = "Erase"
        Me.BtnErase.UseVisualStyleBackColor = False
        Me.BtnErase.Visible = False
        '
        'btnDownLoad
        '
        Me.btnDownLoad.BackColor = System.Drawing.Color.Blue
        Me.btnDownLoad.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnDownLoad.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.btnDownLoad.Location = New System.Drawing.Point(23, 207)
        Me.btnDownLoad.Name = "btnDownLoad"
        Me.btnDownLoad.Size = New System.Drawing.Size(193, 42)
        Me.btnDownLoad.TabIndex = 1
        Me.btnDownLoad.Text = "Download"
        Me.btnDownLoad.UseVisualStyleBackColor = False
        Me.btnDownLoad.Visible = False
        '
        'btnSendFile
        '
        Me.btnSendFile.BackColor = System.Drawing.Color.Blue
        Me.btnSendFile.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSendFile.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.btnSendFile.Location = New System.Drawing.Point(23, 207)
        Me.btnSendFile.Name = "btnSendFile"
        Me.btnSendFile.Size = New System.Drawing.Size(193, 42)
        Me.btnSendFile.TabIndex = 0
        Me.btnSendFile.Text = "Send File"
        Me.btnSendFile.UseVisualStyleBackColor = False
        Me.btnSendFile.Visible = False
        '
        'txtProcStat
        '
        Me.txtProcStat.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.txtProcStat.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtProcStat.ForeColor = System.Drawing.Color.Red
        Me.txtProcStat.Location = New System.Drawing.Point(0, 442)
        Me.txtProcStat.Name = "txtProcStat"
        Me.txtProcStat.Size = New System.Drawing.Size(359, 15)
        Me.txtProcStat.TabIndex = 8
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(34, 27)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(381, 24)
        Me.Label1.TabIndex = 9
        Me.Label1.Text = "Vasai-Virar Municipal Transport (VVMT)"
        '
        'CMBPORTNO
        '
        Me.CMBPORTNO.FormattingEnabled = True
        Me.CMBPORTNO.Location = New System.Drawing.Point(71, 19)
        Me.CMBPORTNO.Name = "CMBPORTNO"
        Me.CMBPORTNO.Size = New System.Drawing.Size(82, 21)
        Me.CMBPORTNO.TabIndex = 4
        '
        'frmMenu
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(434, 427)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.txtProcStat)
        Me.Controls.Add(Me.btn_Master)
        Me.Name = "frmMenu"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "PC2M"
        Me.btn_Master.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btn_Master As System.Windows.Forms.GroupBox
    Friend WithEvents btnExit As System.Windows.Forms.Button
    Friend WithEvents BtnErase As System.Windows.Forms.Button
    Friend WithEvents btnDownLoad As System.Windows.Forms.Button
    Friend WithEvents btnSendFile As System.Windows.Forms.Button
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents txtProcStat As System.Windows.Forms.TextBox
    Friend WithEvents btn_Push As Button
    Friend WithEvents btn_Auditing As Button
    Friend WithEvents Button1 As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents CMBPORTNO As ComboBox
End Class
