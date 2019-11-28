VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Arduino & Esp8266 Code Joiner"
   ClientHeight    =   13185
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   18360
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "esp8266"
   ScaleHeight     =   13185
   ScaleWidth      =   18360
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   30000
      Left            =   3600
      Top             =   6480
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Open Tagged INO"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   6360
      Width           =   2535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6480
      TabIndex        =   5
      Top             =   6360
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save INO"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8640
      TabIndex        =   4
      Top             =   6360
      Width           =   1935
   End
   Begin VB.TextBox Text2 
      Height          =   2175
      Left            =   10440
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Form1.frx":1CCA
      Top             =   3000
      Visible         =   0   'False
      Width           =   4695
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5895
      Left            =   2880
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   360
      Width           =   7815
   End
   Begin VB.FileListBox File1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5700
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   2655
   End
   Begin VB.Label Label2 
      Caption         =   "Merged Output"
      Height          =   255
      Left            =   2880
      TabIndex        =   7
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Merge File (Double Click)"
      Height          =   195
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1770
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCommand4_Click()

    'On Error Resume Next
    Dim File As String

    Dim data As String

    File = DialogFile(0, 1, "Open Ino File", "Sketch.ino", "*.*||*.*", "c:\", "*.ino")

    If (File <> "") Then

        Open File For Binary Access Read As #1
        data = String(LOF(1), 0)
        Get 1, , data
        Close #1

        If (data <> "") Then
            'add setup codes
            Text1.Text = Replace(Text1.Text, "void setup()", "void setup()" & vbCrLf & "//s-")
            
            Text1.Text = Replace(Text1.Text, "//l-", "}" & vbCrLf & vbCrLf & vbCrLf & "//" & String(35, "-") & vbCrLf & vbCrLf & "void loop(){" & vbCrLf & "//l-" & vbCrLf)
            Text1.Text = Replace(Text1.Text, "//f-", "}" & vbCrLf & vbCrLf & "//" & String(35, "-") & vbCrLf & "//f-" & vbCrLf & vbCrLf)

        End If
    End If

End Sub

Private Sub Command1_Click()

    On Error Resume Next

    Dim File As String

    Dim data As String

    If (Text1.Text) = "" Then
        MsgBox "Cannot Save Empty File!", vbCritical

        Exit Sub

    End If

    If checknosetup(Text1.Text) = False Then
        MsgBox "Setup or Loop Cannot be added before processing! I Will Put the Setup & Loop Functions Automatically!", vbInformation

        Exit Sub

    End If

    If checktags(Text1.Text) = False Then
        MsgBox "Some Tags Missing! BTW You can Export. Beaware while importing again!", vbInformation
    End If

    File = DialogFile(0, 2, "Save Ino File", "Sketch.ino", "All files (*.*)", Environ("USERPROFILE") & "\Desktop", "*.ino")

    If (File <> "") Then
        If LenB(Dir(File)) Then Kill File

        Text1.Text = Replace(Text1.Text, "//s-", vbCrLf & "//" & String(35, "-") & vbCrLf & vbCrLf & vbCrLf & "void setup(){" & vbCrLf & "//s-" & vbCrLf)
        Text1.Text = Replace(Text1.Text, "//l-", "}" & vbCrLf & vbCrLf & vbCrLf & "//" & String(35, "-") & vbCrLf & vbCrLf & "void loop(){" & vbCrLf & "//l-" & vbCrLf)
        Text1.Text = Replace(Text1.Text, "//f-", "}" & vbCrLf & vbCrLf & "//" & String(35, "-") & vbCrLf & "//f-" & vbCrLf & vbCrLf)

        'Text1.Text = Replace(Text1.Text, "//", "////", , , vbTextCompare)

        Text1.Text = Replace(Text1.Text, "//////", "////", , , vbTextCompare)

        Open File For Binary Access Write As #1
        data = Text1.Text
        Put 1, , data
        Close #1
        Text1.Text = ""
    End If

    Err.Clear
End Sub

Private Sub Command2_Click()
    Text1.Text = ""
End Sub

Private Sub Command3_Click()

    On Error Resume Next

    Dim File As String

    Dim data As String

    File = DialogFile(0, 1, "Open Ino File", "Sketch.ino", "*.*||*.*", "c:\", "*.ino")

    If (File <> "") Then

        Open File For Binary Access Read As #1
        data = String(LOF(1), 0)
        Get 1, , data
        Close #1

        If checktags(data) = False Then
            'Tag not found
            MsgBox "All Tags not found!", vbCritical

            Exit Sub

        End If

        If checknosetup(data) = False Then
            'Setup or Loop Found
            MsgBox "Setup or Loop Tags not Removed. Please remove both Functions to Start!", vbCritical

            Exit Sub

        End If

        'remove comments in tags
        'data = Replace(data, "////", "//", , , vbTextCompare)

        'load
        Text1.Text = data

    End If

End Sub

Private Sub File1_DblClick()

    Dim data As String, X As String, d1 As String

    If File1.FileName = "" Then Exit Sub

    Dim a As Long, b As Long, c As Long, d As Long, e As Long, f As Long, g As Long, h As Long

    Open File1.Path & "\" & File1.FileName For Binary Access Read As #1
    data = String(LOF(1), 0)
    Get 1, , data
    Close #1

    If checktags(Text1.Text) = False Then Text1.Text = Text2.Text

    Tag = "//i-"
    a = InStr(1, data, Tag)
    d1 = Mid(data, 1, a - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    Tag = "//v-"
    b = InStr(1, data, Tag)
    d1 = Mid(data, a + Len(Tag) + 1, b - (a + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)

    Text1.Text = X

    d1 = ""
    Tag = "//s-"
    c = InStr(1, data, Tag)
    d1 = Mid(data, b + Len(Tag) + 1, c - (b + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    Tag = "//sb-"
    d = InStr(1, data, Tag)
    d1 = Mid(data, c + Len(Tag) + 1, d - (c + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    Tag = "//l-"
    e = InStr(1, data, Tag)
    d1 = Mid(data, d + Len(Tag) + 1, e - (d + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    Tag = "//lb-"
    f = InStr(1, data, Tag)
    d1 = Mid(data, e + Len(Tag) + 1, f - (e + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    Tag = "//f-"
    g = InStr(1, data, Tag)
    d1 = Mid(data, f + Len(Tag) + 1, g - (f + Len(Tag)) - 1)
    d1 = xtrim(d1)
    X = Replace(Text1.Text, Tag, d1 & Tag)
    Text1.Text = X

    d1 = ""
    d1 = Mid(data, g + Len(Tag) + 1)
    d1 = xtrim(d1)
    X = d1

    Text1.Text = "//Added: " & File1.FileName & vbCrLf & vbCrLf & Text1.Text & X

End Sub

Function xtrim(data As String)
    xtrim = RTrim(data)
    xtrim = LTrim(data)
    xtrim = Trim(data)
    xtrim = Replace(data, vbCrLf & vbCrLf, vbCrLf)
    xtrim = Replace(data, vbCrLf & vbCrLf, vbCrLf)
    xtrim = Replace(data, vbCrLf & vbCrLf, vbCrLf)
End Function

Private Sub Form_Load()
    File1.Path = App.Path
    File1.Pattern = "*.cpp"
    File1.Refresh

    Me.Caption = "Arduino & Esp8266 Code Joiner " & App.Major & "." & App.Minor

    Me.Left = Val(GetSetting(App.Title, "Settings", "x", Me.Left))
    Me.Top = Val(GetSetting(App.Title, "Settings", "y", Me.Top))
    Me.Width = Val(GetSetting(App.Title, "Settings", "w", Me.Width))
    Me.Height = Val(GetSetting(App.Title, "Settings", "h", Me.Height))

    If (Me.Left < 0) Then Me.Left = 0
    If (Me.Top < 0) Then Me.Top = 0

    If (Me.Width < 10000) Then Me.Width = 10000
    If (Me.Height < 7000) Then Me.Height = 7000

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    SaveSetting App.Title, "Settings", "x", Me.Left
    SaveSetting App.Title, "Settings", "y", Me.Top
    SaveSetting App.Title, "Settings", "w", Me.Width
    SaveSetting App.Title, "Settings", "h", Me.Height
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    Dim fh As Long

    Dim m  As Long

    Dim fw As Long

    fw = Me.Width - 300
    fh = Me.Height - 1250
    m = 100
    File1.Height = fh - (File1.Top)
    File1.Width = Me.Width / 3
    Text1.Left = File1.Left + File1.Width + m
    Text1.Width = fw - (File1.Left + File1.Width + m)
    Text1.Height = fh - (Text1.Top)
    Label2.Left = Text1.Left

    Command1.Top = Text1.Top + Text1.Height + m
    Command1.Left = fw - (Command1.Width + m)
    Command2.Left = Command1.Left - (Command2.Width + m)
    Command2.Top = Command1.Top

    Command3.Left = Text1.Left
    Command3.Top = Command1.Top

    Text1.FontSize = (fw / 1000)
    File1.FontSize = Text1.FontSize

    If (Me.Left < 0) Then Me.Left = 0
    If (Me.Top < 0) Then Me.Top = 0
    If (Me.Width < 10000) Then Me.Width = 10000
    If (Me.Height < 7000) Then Me.Height = 7000
    Me.Refresh

    If Err.Number <> 0 Then Err.Clear
End Sub

Function checknosetup(d As String) As Boolean

    If InStr(1, " " & d, "void setup", vbTextCompare) > 0 Or InStr(1, " " & d, "void loop", vbTextCompare) > 0 Then checknosetup = False Else checknosetup = True
End Function

Function checktags(d As String) As Boolean

    Dim tags As String

    If InStr(1, " " & d, "//v-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//i-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//s-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//sb-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//l-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//lb-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    If InStr(1, " " & d, "//f-", vbTextCompare) <= 0 Then
        checktags = False

        Exit Function

    End If

    checktags = True

End Function

Private Sub Timer1_Timer()
    File1.Path = App.Path
    File1.Pattern = "*.cpp"
    File1.Refresh
End Sub
