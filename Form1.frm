VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.Timer Timer2 
      Interval        =   1000
      Left            =   2160
      Top             =   1320
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   1680
      Top             =   1320
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Private Declare Function BlockInput Lib "user32.dll" (ByVal fBlockIt As Long) As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long
Const LWA_COLORKEY = &H1
Const LWA_ALPHA = &H2
Const GWL_EXSTYLE = (-20)
Const WS_EX_LAYERED = &H80000
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Type RECT
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type
Private Declare Function GetWindowRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Sub SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Const HWND_TOPMOST = -1
Const SWP_SHOWWINDOW = &H40
Dim x

Private Sub Form_Click()
    If Form2.Check1 Then
        x = GetTickCount
        Me.Hide
        Timer2.Enabled = True
        Timer1.Enabled = False
    End If
End Sub

Private Sub showTop()
    Dim rc As RECT
    GetWindowRect FindWindow("Progman", vbNullString), rc
    SetWindowPos Me.hWnd, HWND_TOPMOST, 0, 0, rc.Right, rc.Bottom, SWP_SHOWWINDOW
End Sub

Private Sub Form_Load()
    x = GetTickCount
    Dim Ret As Long
    Ret = GetWindowLong(Me.hWnd, GWL_EXSTYLE)
    Ret = Ret Or WS_EX_LAYERED
    SetWindowLong Me.hWnd, GWL_EXSTYLE, Ret
    SetLayeredWindowAttributes Me.hWnd, 0, 230, LWA_ALPHA
    Me.Hide
End Sub

Private Sub Timer1_Timer()
    showTop
    If Form2.Check2 Then
        BlockInput 1
    End If
    If GetTickCount > x + Form2.Text1 * 1000 Then
        x = GetTickCount
        If Form2.Check2 Then
            BlockInput 0
        End If
        Me.Hide
        ShowCursor True
        Timer2.Enabled = True
        Timer1.Enabled = False
    End If
End Sub

Private Sub Timer2_Timer()
    If GetTickCount > x + Form2.Text2 * 1000 * 60 Then
        x = GetTickCount
        Me.Show
        ShowCursor IIf(Form2.Check3.Value, False, True)
        Timer1.Enabled = True
        Timer2.Enabled = False
    End If
End Sub
