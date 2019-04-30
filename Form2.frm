VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "自动休息 V3.14 -by JuncoJet"
   ClientHeight    =   3030
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4560
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   1  '所有者中心
   Begin VB.CheckBox Check3 
      Caption         =   "隐藏鼠标指针"
      Height          =   375
      Left            =   240
      TabIndex        =   7
      Top             =   960
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CheckBox Check2 
      Caption         =   "禁用鼠标键盘"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "允许手动退出"
      Height          =   330
      Left            =   240
      TabIndex        =   5
      Top             =   1320
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      Height          =   270
      Left            =   1440
      TabIndex        =   4
      Text            =   "30"
      Top             =   600
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Height          =   270
      Left            =   1440
      TabIndex        =   3
      Text            =   "60"
      Top             =   240
      Width           =   2895
   End
   Begin VB.CommandButton Command1 
      Caption         =   "开始"
      Default         =   -1  'True
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "休息间隔（分）"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   615
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "休息时长（秒）"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   255
      Width           =   1575
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub InitCommonControls Lib "comctl32" ()

Private Sub Command1_Click()
    Load Form1
    Form2.Hide
End Sub

Private Sub Form_Initialize()
    InitCommonControls
End Sub

