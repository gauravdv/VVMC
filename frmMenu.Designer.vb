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
        Me.components = New System.ComponentModel.Container()
        Me.btn_Master = New System.Windows.Forms.GroupBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.btn_Auditing = New System.Windows.Forms.Button()
        Me.btn_Push = New System.Windows.Forms.Button()
        Me.btnExit = New System.Windows.Forms.Button()
        Me.BtnErase = New System.Windows.Forms.Button()
        Me.btnDownLoad = New System.Windows.Forms.Button()
        Me.btnSendFile = New System.Windows.Forms.Button()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.lab_UserName = New System.Windows.Forms.Label()
        Me.lab_User = New System.Windows.Forms.Label()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.MasterToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AuditingToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CouponToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CloseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.btn_Master.SuspendLayout()
        Me.Panel1.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btn_Master
        '
        Me.btn_Master.Controls.Add(Me.Button1)
        Me.btn_Master.Controls.Add(Me.btn_Auditing)
        Me.btn_Master.Controls.Add(Me.btn_Push)
        Me.btn_Master.Controls.Add(Me.btnExit)
        Me.btn_Master.Controls.Add(Me.BtnErase)
        Me.btn_Master.Controls.Add(Me.btnDownLoad)
        Me.btn_Master.Controls.Add(Me.btnSendFile)
        Me.btn_Master.Location = New System.Drawing.Point(384, 363)
        Me.btn_Master.Name = "btn_Master"
        Me.btn_Master.Size = New System.Drawing.Size(50, 35)
        Me.btn_Master.TabIndex = 0
        Me.btn_Master.TabStop = False
        Me.btn_Master.Visible = False
        '
        'Button1
        '
        Me.Button1.BackColor = System.Drawing.Color.Blue
        Me.Button1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.Button1.Location = New System.Drawing.Point(23, 43)
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
        Me.btn_Auditing.Location = New System.Drawing.Point(23, 113)
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
        Me.btnExit.Location = New System.Drawing.Point(23, 184)
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
        Me.BtnErase.Location = New System.Drawing.Point(23, 184)
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
        Me.btnDownLoad.Location = New System.Drawing.Point(23, 184)
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
        Me.btnSendFile.Location = New System.Drawing.Point(23, 184)
        Me.btnSendFile.Name = "btnSendFile"
        Me.btnSendFile.Size = New System.Drawing.Size(193, 42)
        Me.btnSendFile.TabIndex = 0
        Me.btnSendFile.Text = "Send File"
        Me.btnSendFile.UseVisualStyleBackColor = False
        Me.btnSendFile.Visible = False
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
        'lab_User
        '
        Me.lab_User.AutoSize = True
        Me.lab_User.Location = New System.Drawing.Point(3, 5)
        Me.lab_User.Name = "lab_User"
        Me.lab_User.Size = New System.Drawing.Size(35, 13)
        Me.lab_User.TabIndex = 11
        Me.lab_User.Text = "User :"
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.lab_User)
        Me.Panel1.Controls.Add(Me.lab_UserName)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 408)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(434, 23)
        Me.Panel1.TabIndex = 12
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(61, 4)
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.MasterToolStripMenuItem, Me.AuditingToolStripMenuItem, Me.CouponToolStripMenuItem, Me.CloseToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(434, 24)
        Me.MenuStrip1.TabIndex = 14
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'MasterToolStripMenuItem
        '
        Me.MasterToolStripMenuItem.Name = "MasterToolStripMenuItem"
        Me.MasterToolStripMenuItem.Size = New System.Drawing.Size(55, 20)
        Me.MasterToolStripMenuItem.Text = "Master"
        '
        'AuditingToolStripMenuItem
        '
        Me.AuditingToolStripMenuItem.Name = "AuditingToolStripMenuItem"
        Me.AuditingToolStripMenuItem.Size = New System.Drawing.Size(65, 20)
        Me.AuditingToolStripMenuItem.Text = "Auditing"
        '
        'CouponToolStripMenuItem
        '
        Me.CouponToolStripMenuItem.Name = "CouponToolStripMenuItem"
        Me.CouponToolStripMenuItem.Size = New System.Drawing.Size(62, 20)
        Me.CouponToolStripMenuItem.Text = "Coupon"
        '
        'CloseToolStripMenuItem
        '
        Me.CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
        Me.CloseToolStripMenuItem.Size = New System.Drawing.Size(48, 20)
        Me.CloseToolStripMenuItem.Text = "Close"
        '
        'frmMenu
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(434, 431)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.btn_Master)
        Me.IsMdiContainer = True
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "frmMenu"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Vasai-Virar Municipal Transport (VVMT)"
        Me.btn_Master.ResumeLayout(False)
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btn_Master As System.Windows.Forms.GroupBox
    Friend WithEvents btnExit As System.Windows.Forms.Button
    Friend WithEvents BtnErase As System.Windows.Forms.Button
    Friend WithEvents btnDownLoad As System.Windows.Forms.Button
    Friend WithEvents btnSendFile As System.Windows.Forms.Button
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents btn_Push As Button
    Friend WithEvents btn_Auditing As Button
    Friend WithEvents Button1 As Button
    Friend WithEvents lab_UserName As Label
    Friend WithEvents lab_User As Label
    Friend WithEvents Panel1 As Panel
    Friend WithEvents ContextMenuStrip1 As ContextMenuStrip
    Friend WithEvents MenuStrip1 As MenuStrip
    Friend WithEvents MasterToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AuditingToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents CouponToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents CloseToolStripMenuItem As ToolStripMenuItem
End Class
