<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_Login
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
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.btn_LogIn = New System.Windows.Forms.Button()
        Me.txt_Password = New System.Windows.Forms.TextBox()
        Me.txt_UserName = New System.Windows.Forms.TextBox()
        Me.lab_Pasword = New System.Windows.Forms.Label()
        Me.lab_UserName = New System.Windows.Forms.Label()
        Me.Panel1.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(8, 12)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(381, 24)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "Vasai-Virar Municipal Transport (VVMT)"
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.Label1)
        Me.Panel1.Location = New System.Drawing.Point(12, 12)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(397, 52)
        Me.Panel1.TabIndex = 11
        '
        'Panel2
        '
        Me.Panel2.Controls.Add(Me.btn_LogIn)
        Me.Panel2.Controls.Add(Me.txt_Password)
        Me.Panel2.Controls.Add(Me.txt_UserName)
        Me.Panel2.Controls.Add(Me.lab_Pasword)
        Me.Panel2.Controls.Add(Me.lab_UserName)
        Me.Panel2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Panel2.Location = New System.Drawing.Point(12, 70)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(397, 182)
        Me.Panel2.TabIndex = 12
        '
        'btn_LogIn
        '
        Me.btn_LogIn.Location = New System.Drawing.Point(170, 136)
        Me.btn_LogIn.Name = "btn_LogIn"
        Me.btn_LogIn.Size = New System.Drawing.Size(81, 34)
        Me.btn_LogIn.TabIndex = 4
        Me.btn_LogIn.Text = "LogIn"
        Me.btn_LogIn.UseVisualStyleBackColor = True
        '
        'txt_Password
        '
        Me.txt_Password.Location = New System.Drawing.Point(153, 89)
        Me.txt_Password.Name = "txt_Password"
        Me.txt_Password.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.txt_Password.Size = New System.Drawing.Size(174, 23)
        Me.txt_Password.TabIndex = 3
        '
        'txt_UserName
        '
        Me.txt_UserName.Location = New System.Drawing.Point(153, 47)
        Me.txt_UserName.Name = "txt_UserName"
        Me.txt_UserName.Size = New System.Drawing.Size(174, 23)
        Me.txt_UserName.TabIndex = 2
        '
        'lab_Pasword
        '
        Me.lab_Pasword.AutoSize = True
        Me.lab_Pasword.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_Pasword.Location = New System.Drawing.Point(74, 89)
        Me.lab_Pasword.Name = "lab_Pasword"
        Me.lab_Pasword.Size = New System.Drawing.Size(77, 17)
        Me.lab_Pasword.TabIndex = 1
        Me.lab_Pasword.Text = "Password :"
        '
        'lab_UserName
        '
        Me.lab_UserName.AutoSize = True
        Me.lab_UserName.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lab_UserName.Location = New System.Drawing.Point(64, 50)
        Me.lab_UserName.Name = "lab_UserName"
        Me.lab_UserName.Size = New System.Drawing.Size(91, 17)
        Me.lab_UserName.TabIndex = 0
        Me.lab_UserName.Text = "User Name : "
        '
        'frm_Login
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(421, 264)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Panel1)
        Me.Name = "frm_Login"
        Me.Text = " Login User"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Panel1 As Panel
    Friend WithEvents Panel2 As Panel
    Friend WithEvents btn_LogIn As Button
    Friend WithEvents txt_Password As TextBox
    Friend WithEvents txt_UserName As TextBox
    Friend WithEvents lab_Pasword As Label
    Friend WithEvents lab_UserName As Label
End Class
