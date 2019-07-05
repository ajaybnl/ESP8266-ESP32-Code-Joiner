Attribute VB_Name = "CommonDialog"

Option Explicit
Private Type OPENFILENAME
    lStructSize                                     As Long
    hwnd                                            As Long
    hInstance                                       As Long
    lpstrFilter                                     As String
    lpstrCustomFilter                               As String
    nMaxCustFilter                                  As Long
    nFilterIndex                                    As Long
    lpstrFile                                       As String
    nMaxFile                                        As Long
    lpstrFileTitle                                  As String
    nMaxFileTitle                                   As Long
    lpstrInitialDir                                 As String
    lpstrTitle                                      As String
    Flags                                           As Long
    nFileOffset                                     As Integer
    nFileExtension                                  As Integer
    lpstrDefExt                                     As String
    lCustData                                       As Long
    lpfnHook                                        As Long
    lpTemplateName                                  As String
End Type
Private Type COLORSTRUC
    lStructSize                                     As Long
    hwnd                                            As Long
    hInstance                                       As Long
    rgbResult                                       As Long
    lpCustColors                                    As String
    Flags                                           As Long
    lCustData                                       As Long
    lpfnHook                                        As Long
    lpTemplateName                                  As String
End Type
Private Const LF_FACESIZE                       As Integer = 32
Private Type LOGFONT
    lfHeight                                        As Long
    lfWidth                                         As Long
    lfEscapement                                    As Long
    lfOrientation                                   As Long
    lfWeight                                        As Long
    lfItalic                                        As Byte
    lfUnderline                                     As Byte
    lfStrikeOut                                     As Byte
    lfCharSet                                       As Byte
    lfOutPrecision                                  As Byte
    lfClipPrecision                                 As Byte
    lfQuality                                       As Byte
    lfPitchAndFamily                                As Byte
    lfFaceName(LF_FACESIZE)                         As Byte
End Type
Private Type FONTSTRUC
    lStructSize                                     As Long
    hwnd                                            As Long
    hdc                                             As Long
    lpLogFont                                       As Long
    iPointSize                                      As Long
    Flags                                           As Long
    rgbColors                                       As Long
    lCustData                                       As Long
    lpfnHook                                        As Long
    lpTemplateName                                  As String
    hInstance                                       As Long
    lpszStyle                                       As String
    nFontType                                       As Integer
    MISSING_ALIGNMENT                               As Integer
    nSizeMin                                        As Long
    nSizeMax                                        As Long
End Type
Public Type DEVMODE
    dmDeviceName                                    As String * 32
    dmSpecVersion                                   As Integer
    dmDriverVersion                                 As Integer
    dmSize                                          As Integer
    dmDriverExtra                                   As Integer
    dmFields                                        As Long
    dmOrientation                                   As Integer
    dmPaperSize                                     As Integer
    dmPaperLength                                   As Integer
    dmPaperWidth                                    As Integer
    dmScale                                         As Integer
    dmCopies                                        As Integer
    dmDefaultSource                                 As Integer
    dmPrintQuality                                  As Integer
    dmColor                                         As Integer
    dmDuplex                                        As Integer
    dmYResolution                                   As Integer
    dmTTOption                                      As Integer
    dmCollate                                       As Integer
    dmFormName                                      As String * 32
    dmUnusedPadding                                 As Integer
    dmBitsPerPel                                    As Integer
    dmPelsWidth                                     As Long
    dmPelsHeight                                    As Long
    dmDisplayFlags                                  As Long
    dmDisplayFreq                                   As Long
End Type
Private Type PRINTDLGSTRUC
    lStructSize                                     As Long
    hwnd                                            As Long
    hDevMode                                        As Long
    hDevNames                                       As Long
    hdc                                             As Long
    Flags                                           As Long
    nFromPage                                       As Integer
    nToPage                                         As Integer
    nMinPage                                        As Integer
    nMaxPage                                        As Integer
    nCopies                                         As Integer
    hInstance                                       As Long
    lCustData                                       As Long
    lpfnPrintHook                                   As Long
    lpfnSetupHook                                   As Long
    lpPrintTemplateName                             As String
    lpSetupTemplateName                             As String
    hPrintTemplate                                  As Long
    hSetupTemplate                                  As Long
End Type
Public Type PRINTPROPS
    Cancel                                          As Boolean
    Device                                          As String
    Copies                                          As Integer
    Collate                                         As Boolean
    File                                            As Boolean
    All                                             As Boolean
    Pages                                           As Boolean
    selection                                       As Boolean
    FromPage                                        As Integer
    ToPage                                          As Integer
    DM                                              As DEVMODE
End Type
Private Type SHITEMID
    cb                                              As Long
    abID                                            As Byte
End Type
Private Type ITEMIDLIST
    mkid                                            As SHITEMID
End Type
Private Type BROWSEINFO
    hOwner                                          As Long
    pidlRoot                                        As Long
    pszDisplayName                                  As String
    lpszTitle                                       As String
    ulFlags                                         As Long
    lpfn                                            As Long
    lParam                                          As Long
    iImage                                          As Long
End Type
Private Const WM_USER                           As Long = &H400
Private Const BFFM_INITIALIZED                  As Integer = 1
Private Const BFFM_SELCHANGED                   As Integer = 2
Private Const BFFM_SETSTATUSTEXT                As Double = (WM_USER + 100)
Private Const BFFM_SETSELECTION                 As Double = (WM_USER + 102)
''Private Const PD_NOSELECTION                    As Long = &H4
''Private Const PD_DISABLEPRINTTOFILE             As Long = &H80000
''Private Const PD_PRINTTOFILE                    As Long = &H20
''Private Const PD_RETURNDC                       As Long = &H100
''Private Const PD_RETURNDEFAULT                  As Long = &H400
''Private Const PD_RETURNIC                       As Long = &H200
''Private Const PD_SELECTION                      As Long = &H1
''Private Const PD_SHOWHELP                       As Long = &H800
''Private Const PD_NOPAGENUMS                     As Long = &H8
''Private Const PD_PAGENUMS                       As Long = &H2
''Private Const PD_ALLPAGES                       As Long = &H0
''Private Const PD_COLLATE                        As Long = &H10
''Private Const PD_HIDEPRINTTOFILE                As Long = &H100000
''Private Const HELP_COMMAND                      As Long = &H102
''Private Const HELP_CONTENTS                     As Long = &H3
''Private Const HELP_CONTEXT                      As Long = &H1
''Private Const HELP_CONTEXTPOPUP                 As Long = &H8
''Private Const HELP_FORCEFILE                    As Long = &H9
''Private Const HELP_HELPONHELP                   As Long = &H4
''Private Const HELP_INDEX                        As Long = &H3
''Private Const HELP_KEY                          As Long = &H101
''Private Const HELP_MULTIKEY                     As Long = &H201
''Private Const HELP_PARTIALKEY                   As Long = &H105
''Private Const HELP_QUIT                         As Long = &H2
''Private Const HELP_SETCONTENTS                  As Long = &H5
''Private Const HELP_SETINDEX                     As Long = &H5
''Private Const HELP_SETWINPOS                    As Long = &H203
''Private Const HH_DISPLAY_TOPIC                  As Long = &H0
''Private Const HH_HELP_FINDER                    As Long = &H0
''Private Const HH_DISPLAY_TOC                    As Long = &H1
''Private Const HH_DISPLAY_INDEX                  As Long = &H2
''Private Const HH_DISPLAY_SEARCH                 As Long = &H3
''Private Const HH_SET_WIN_TYPE                   As Long = &H4
''Private Const HH_GET_WIN_TYPE                   As Long = &H5
''Private Const HH_GET_WIN_HANDLE                 As Long = &H6
''Private Const HH_ENUM_INFO_TYPE                 As Long = &H7
''Private Const HH_SET_INFO_TYPE                  As Long = &H8
''Private Const HH_SYNC                           As Long = &H9
''Private Const HH_ADD_NAV_UI                     As Long = &H10
''Private Const HH_ADD_BUTTON                     As Long = &H11
''Private Const HH_GETBROWSER_APP                 As Long = &H12
''Private Const HH_KEYWORD_LOOKUP                 As Long = &H13
''Private Const HH_DISPLAY_TEXT_POPUP             As Long = &H14
''Private Const HH_HELP_CONTEXT                   As Long = &H15
''Private Const HH_TP_HELP_CONTEXTMENU            As Long = &H16
''Private Const HH_TP_HELP_WM_HELP                As Long = &H17
''Private Const HH_CLOSE_ALL                      As Long = &H18
''Private Const HH_ALINK_LOOKUP                   As Long = &H19
''Private Const HH_GET_LAST_ERROR                 As Long = &H20
''Private Const HH_ENUM_CATEGORY                  As Long = &H21
''Private Const HH_ENUM_CATEGORY_IT               As Long = &H22
''Private Const HH_RESET_IT_FILTER                As Long = &H23
''Private Const HH_SET_INCLUSIVE_FILTER           As Long = &H24
''Private Const HH_SET_EXCLUSIVE_FILTER           As Long = &H25
''Private Const HH_SET_GUID                       As Long = &H26
''Private Const HH_INTERNAL                       As Long = &H255
''Private Const FW_BOLD                           As Integer = 700
Private Const GMEM_MOVEABLE                     As Long = &H2
Private Const GMEM_ZEROINIT                     As Long = &H40
''Private Const GHND                              As Double = (GMEM_MOVEABLE Or GMEM_ZEROINIT)
''Private Const OFN_ALLOWMULTISELECT              As Long = &H200
Private Const OFN_CREATEPROMPT                  As Long = &H2000
''Private Const OFN_ENABLEHOOK                    As Long = &H20
''Private Const OFN_ENABLETEMPLATE                As Long = &H40
''Private Const OFN_ENABLETEMPLATEHANDLE          As Long = &H80
Private Const OFN_EXPLORER                      As Long = &H80000
''Private Const OFN_EXTENSIONDIFFERENT            As Long = &H400
''Private Const OFN_FILEMUSTEXIST                 As Long = &H1000
Private Const OFN_HIDEREADONLY                  As Long = &H4
''Private Const OFN_LONGNAMES                     As Long = &H200000
''Private Const OFN_NOCHANGEDIR                   As Long = &H8
''Private Const OFN_NODEREFERENCELINKS            As Long = &H100000
''Private Const OFN_NOLONGNAMES                   As Long = &H40000
''Private Const OFN_NONETWORKBUTTON               As Long = &H20000
''Private Const OFN_NOREADONLYRETURN              As Long = &H8000
''Private Const OFN_NOTESTFILECREATE              As Long = &H10000
''Private Const OFN_NOVALIDATE                    As Long = &H100
Private Const OFN_OVERWRITEPROMPT               As Long = &H2
Private Const OFN_PATHMUSTEXIST                 As Long = &H800
''Private Const OFN_READONLY                      As Long = &H1
''Private Const OFN_SHAREAWARE                    As Long = &H4000
''Private Const OFN_SHAREFALLTHROUGH              As Integer = 2
''Private Const OFN_SHARENOWARN                   As Integer = 1
''Private Const OFN_SHAREWARN                     As Integer = 0
''Private Const OFN_SHOWHELP                      As Long = &H10
''Private Const PD_ENABLEPRINTHOOK                As Long = &H1000
''Private Const PD_ENABLEPRINTTEMPLATE            As Long = &H4000
''Private Const PD_ENABLEPRINTTEMPLATEHANDLE      As Long = &H10000
''Private Const PD_ENABLESETUPHOOK                As Long = &H2000
''Private Const PD_ENABLESETUPTEMPLATE            As Long = &H8000
''Private Const PD_ENABLESETUPTEMPLATEHANDLE      As Long = &H20000
''Private Const PD_NONETWORKBUTTON                As Long = &H200000
''Private Const PD_PRINTSETUP                     As Long = &H40
''Private Const PD_USEDEVMODECOPIES               As Long = &H40000
''Private Const PD_USEDEVMODECOPIESANDCOLLATE     As Long = &H40000
''Private Const PD_NOWARNING                      As Long = &H80
Private Const CF_ANSIONLY                       As Long = &H400
''Private Const CF_APPLY                          As Long = &H200
''Private Const CF_BITMAP                         As Integer = 2
Private Const CF_PRINTERFONTS                   As Long = &H2
''Private Const CF_PRIVATEFIRST                   As Long = &H200
''Private Const CF_PRIVATELAST                    As Long = &H2FF
''Private Const CF_RIFF                           As Integer = 11
''Private Const CF_SCALABLEONLY                   As Long = &H20000
Private Const CF_SCREENFONTS                    As Long = &H1
''Private Const CF_BOTH                           As Double = (CF_SCREENFONTS Or CF_PRINTERFONTS)
''Private Const CF_DIB                            As Integer = 8
''Private Const CF_DIF                            As Integer = 5
''Private Const CF_DSPBITMAP                      As Long = &H82
''Private Const CF_DSPENHMETAFILE                 As Long = &H8E
''Private Const CF_DSPMETAFILEPICT                As Long = &H83
''Private Const CF_DSPTEXT                        As Long = &H81
''Private Const CF_EFFECTS                        As Long = &H100
''Private Const CF_ENABLEHOOK                     As Long = &H8
''Private Const CF_ENABLETEMPLATE                 As Long = &H10
''Private Const CF_ENABLETEMPLATEHANDLE           As Long = &H20
''Private Const CF_ENHMETAFILE                    As Integer = 14
''Private Const CF_FIXEDPITCHONLY                 As Long = &H4000
''Private Const CF_FORCEFONTEXIST                 As Long = &H10000
''Private Const CF_GDIOBJFIRST                    As Long = &H300
''Private Const CF_GDIOBJLAST                     As Long = &H3FF
''Private Const CF_INITTOLOGFONTSTRUCT            As Long = &H40
''Private Const CF_LIMITSIZE                      As Long = &H2000
''Private Const CF_METAFILEPICT                   As Integer = 3
''Private Const CF_NOFACESEL                      As Long = &H80000
''Private Const CF_NOVERTFONTS                    As Long = &H1000000
Private Const CF_NOVECTORFONTS                  As Long = &H800
''Private Const CF_NOOEMFONTS                     As Long = CF_NOVECTORFONTS
''Private Const CF_NOSCRIPTSEL                    As Long = &H800000
''Private Const CF_NOSIMULATIONS                  As Long = &H1000
''Private Const CF_NOSIZESEL                      As Long = &H200000
''Private Const CF_NOSTYLESEL                     As Long = &H100000
''Private Const CF_OEMTEXT                        As Integer = 7
''Private Const CF_OWNERDISPLAY                   As Long = &H80
''Private Const CF_PALETTE                        As Integer = 9
''Private Const CF_PENDATA                        As Integer = 10
''Private Const CF_SCRIPTSONLY                    As Long = CF_ANSIONLY
''Private Const CF_SELECTSCRIPT                   As Long = &H400000
''Private Const CF_SHOWHELP                       As Long = &H4
''Private Const CF_SYLK                           As Integer = 4
''Private Const CF_TEXT                           As Integer = 1
''Private Const CF_TIFF                           As Integer = 6
''Private Const CF_TTONLY                         As Long = &H40000
''Private Const CF_UNICODETEXT                    As Integer = 13
''Private Const CF_USESTYLE                       As Long = &H80
''Private Const CF_WAVE                           As Integer = 12
''Private Const CF_WYSIWYG                        As Long = &H8000
''Private Const CFERR_CHOOSEFONTCODES             As Long = &H2000
''Private Const CFERR_MAXLESSTHANMIN              As Long = &H2002
''Private Const CFERR_NOFONTS                     As Long = &H2001
''Private Const CC_ANYCOLOR                       As Long = &H100
''Private Const CC_CHORD                          As Integer = 4
''Private Const CC_CIRCLES                        As Integer = 1
''Private Const CC_ELLIPSES                       As Integer = 8
''Private Const CC_ENABLEHOOK                     As Long = &H10
''Private Const CC_ENABLETEMPLATE                 As Long = &H20
''Private Const CC_ENABLETEMPLATEHANDLE           As Long = &H40
''Private Const CC_FULLOPEN                       As Long = &H2
''Private Const CC_INTERIORS                      As Integer = 128
''Private Const CC_NONE                           As Integer = 0
''Private Const CC_PIE                            As Integer = 2
''Private Const CC_PREVENTFULLOPEN                As Long = &H4
''Private Const CC_RGBINIT                        As Long = &H1
''Private Const CC_ROUNDRECT                      As Integer = 256
''Private Const CC_SHOWHELP                       As Long = &H8
''Private Const CC_SOLIDCOLOR                     As Long = &H80
''Private Const CC_STYLED                         As Integer = 32
''Private Const CC_WIDE                           As Integer = 16
''Private Const CC_WIDESTYLED                     As Integer = 64
''Private Const CCERR_CHOOSECOLORCODES            As Long = &H5000
''Private Const LOGPIXELSY                        As Integer = 90
''Private Const CCHDEVICENAME                     As Integer = 32
''Private Const CCHFORMNAME                       As Integer = 32
''Private Const SIMULATED_FONTTYPE                As Long = &H8000
''Private Const PRINTER_FONTTYPE                  As Long = &H4000
''Private Const SCREEN_FONTTYPE                   As Long = &H2000
''Private Const BOLD_FONTTYPE                     As Long = &H100
''Private Const ITALIC_FONTTYPE                   As Long = &H200
''Private Const REGULAR_FONTTYPE                  As Long = &H400
''Private Const WM_CHOOSEFONT_GETLOGFONT          As Long = (&H400 + 1)
''Private Const LBSELCHSTRING                     As String = "commdlg_LBSelChangedNotify"
''Private Const SHAREVISTRING                     As String = "commdlg_ShareViolation"
''Private Const FILEOKSTRING                      As String = "commdlg_FileNameOK"
''Private Const COLOROKSTRING                     As String = "commdlg_ColorOK"
''Private Const SETRGBSTRING                      As String = "commdlg_SetRGBColor"
''Private Const FINDMSGSTRING                     As String = "commdlg_FindReplace"
''Private Const HELPMSGSTRING                     As String = "commdlg_help"
''Private Const CD_LBSELNOITEMS                   As Integer = -1
''Private Const CD_LBSELCHANGE                    As Integer = 0
''Private Const CD_LBSELSUB                       As Integer = 1
''Private Const CD_LBSELADD                       As Integer = 2
''Private Const NOERROR                           As Integer = 0
''Private Const CSIDL_DESKTOP                     As Long = &H0
''Private Const CSIDL_PROGRAMS                    As Long = &H2
''Private Const CSIDL_CONTROLS                    As Long = &H3
''Private Const CSIDL_PRINTERS                    As Long = &H4
''Private Const CSIDL_PERSONAL                    As Long = &H5
''Private Const CSIDL_FAVORITES                   As Long = &H6
''Private Const CSIDL_STARTUP                     As Long = &H7
''Private Const CSIDL_RECENT                      As Long = &H8
''Private Const CSIDL_SENDTO                      As Long = &H9
''Private Const CSIDL_BITBUCKET                   As Long = &HA
''Private Const CSIDL_STARTMENU                   As Long = &HB
''Private Const CSIDL_DESKTOPDIRECTORY            As Long = &H10
''Private Const CSIDL_DRIVES                      As Long = &H11
''Private Const CSIDL_NETWORK                     As Long = &H12
''Private Const CSIDL_NETHOOD                     As Long = &H13
''Private Const CSIDL_FONTS                       As Long = &H14
''Private Const CSIDL_TEMPLATES                   As Long = &H15
Private Const BIF_RETURNONLYFSDIRS              As Long = &H1
Private Const BIF_DONTGOBELOWDOMAIN             As Long = &H2
''Private Const BIF_STATUSTEXT                    As Long = &H4
''Private Const BIF_RETURNFSANCESTORS             As Long = &H8
''Private Const BIF_BROWSEFORCOMPUTER             As Long = &H1000
''Private Const BIF_BROWSEFORPRINTER              As Long = &H2000
''Private Const HWND_BROADCAST                    As Long = &HFFFF
''Private Const WM_WININICHANGE                   As Long = &H1A
Private m_CurrentDirectory                      As String
''Private Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, _
                                                                        ByVal wMsg As Long, _
                                                                        ByVal wParam As Long, _
                                                                        ByVal lParam As String) As Long
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
''Private Declare Function PrintDlg Lib "comdlg32.dll" Alias "PrintDlgA" (pPrintdlg As PRINTDLGSTRUC) As Long
''Private Declare Function ChooseColor Lib "comdlg32.dll" Alias "ChooseColorA" (pChoosecolor As COLORSTRUC) As Long
''Private Declare Function ChooseFont Lib "comdlg32.dll" Alias "ChooseFontA" (pChoosefont As FONTSTRUC) As Long
''Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
''Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
''Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
''Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
''Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, _
                                                                                             ByVal pszPath As String) As Long
''Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Private Declare Function SHBrowseForFolder Lib "shell32.dll" Alias "SHBrowseForFolderA" (lpBrowseInfo As BROWSEINFO) As Long
''Private Declare Function WriteProfileString Lib "kernel32" Alias "WriteProfileStringA" (ByVal lpszSection As String, ByVal lpszKeyName As String, ByVal lpszString As String) As Long
''Private Declare Function GetProfileString Lib "kernel32" Alias "GetProfileStringA" (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long) As Long
''Private Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
''Private Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Any) As Long
''Private Declare Function HTMLHelp Lib "hhctrl.ocx" Alias "HtmlHelpA" (ByVal hwnd As Long, ByVal szFilename As String, ByVal dwCommand As Long, ByVal dwData As Any) As Long


Private Function BrowseCallbackProc(ByVal lngHwnd As Long, _
                                    ByVal uMsg As Long, _
                                    ByVal lp As Long, _
                                    ByVal pData As Long) As Long

'Dim lpIDList As Long

Dim ret     As Long
Dim sBuffer As String

    On Error Resume Next
    Select Case uMsg
    Case BFFM_INITIALIZED
        SendMessage lngHwnd, BFFM_SETSELECTION, 1, m_CurrentDirectory
    Case BFFM_SELCHANGED
        sBuffer = Space$(255)
        ret = SHGetPathFromIDList(lp, sBuffer)
        If ret = 1 Then
            SendMessage lngHwnd, BFFM_SETSTATUSTEXT, 0, sBuffer
        End If
    End Select
    BrowseCallbackProc = 0
    On Error GoTo 0

End Function

Public Function BrowseFolder(ByVal lngHwnd As Long, _
                             ByVal szDialogTitle As String, _
                             Optional ByVal Path As String) As String


Dim X       As Long
Dim BI      As BROWSEINFO
Dim dwIList As Long
Dim szPath  As String
Dim wPos    As Integer

    On Error Resume Next
    m_CurrentDirectory = Path & vbNullChar
    With BI
        .hOwner = lngHwnd
        .lpszTitle = szDialogTitle
        .ulFlags = BIF_RETURNONLYFSDIRS Or BIF_DONTGOBELOWDOMAIN
        .pidlRoot = Path
        .lpfn = GetAddressofFunction(AddressOf BrowseCallbackProc)
    End With 'BI
    dwIList = SHBrowseForFolder(BI)
    szPath = Space$(512)
    X = SHGetPathFromIDList(ByVal dwIList, ByVal szPath)
    If X Then
        wPos = InStr(szPath, vbNullChar)
        BrowseFolder = Left$(szPath, wPos - 1)
    Else 'X = FALSE/0
        BrowseFolder = vbNullString
    End If
    On Error GoTo 0

End Function

Public Function DialogFile(ByVal lngHwnd As Long, _
                           ByVal wMode As Integer, _
                           ByVal szDialogTitle As String, _
                           ByVal szFilename As String, _
                           ByVal szFilter As String, _
                           ByVal szDefDir As String, _
                           ByVal szDefExt As String) As String


Dim X      As Long
Dim OFN    As OPENFILENAME
Dim szFile As String

    'Dim szFileTitle As String
    On Error Resume Next
    With OFN
        .lStructSize = Len(OFN)
        .hwnd = lngHwnd
        .lpstrTitle = szDialogTitle
        .lpstrFile = szFilename & String$(250 - Len(szFilename), 0)
        .nMaxFile = 255
        .lpstrFileTitle = String$(255, 0)
        .nMaxFileTitle = 255
        .lpstrFilter = szFilter
        .nFilterIndex = 1
        .lpstrInitialDir = szDefDir
        .lpstrDefExt = szDefExt
    End With 'OFN
    If wMode = 1 Then
        OFN.Flags = OFN_HIDEREADONLY
        X = GetOpenFileName(OFN)
    Else 'NOT WMODE...
        OFN.Flags = OFN_HIDEREADONLY Or OFN_OVERWRITEPROMPT Or OFN_PATHMUSTEXIST Or OFN_CREATEPROMPT Or OFN_EXPLORER
        X = GetSaveFileName(OFN)
    End If
    If X <> 0 Then
        If InStr(OFN.lpstrFile, vbNullChar) > 0 Then
            szFile = Left$(OFN.lpstrFile, InStr(OFN.lpstrFile, vbNullChar) - 1)
        End If
        DialogFile = szFile
    Else 'NOT X...
        DialogFile = vbNullString
    End If
    On Error GoTo 0

End Function

Private Function GetAddressofFunction(add As Long) As Long

    GetAddressofFunction = add

End Function

''
''Private Function ByteToString(aBytes() As Byte) As String
''
''
''
''Dim dwBytePoint As Long
''Dim dwByteVal   As Long
''Dim szOut       As String
''
''
''On Error Resume Next
''dwBytePoint = LBound(aBytes)
''
''Do While dwBytePoint <= UBound(aBytes)
''dwByteVal = aBytes(dwBytePoint)
''If dwByteVal = 0 Then
''ByteToString = szOut
''Exit Function
''
''
''
''
''
''
''Else
''szOut = szOut & Chr$(dwByteVal)
''End If
''dwBytePoint = dwBytePoint + 1
''Loop
''ByteToString = szOut
''On Error GoTo 0
''
''End Function
''
''
''Public Function DialogPrintSetup(ByVal lngHwnd As Long) As Boolean
''
''
''
''
''
'''Dim X As Long
''
''
''
''Dim PD As PRINTDLGSTRUC
''
''
''On Error Resume Next
''
''With PD
''.lStructSize = Len(PD)
''.hwnd = lngHwnd
''.Flags = PD_PRINTSETUP
''End With 'PD
''PrintDlg PD
''
''On Error GoTo 0
''
''End Function
''
''Public Function SetDefaultPrinter(objPrn As Printer) As Boolean
''
''
''
'''Dim X As Long
''
''
''
''Dim szTmp As String
''
''
''
''On Error Resume Next
''szTmp = objPrn.DeviceName & "," & objPrn.DriverName & "," & objPrn.Port
''WriteProfileString "windows", "device", szTmp
''
''SendMessageByString HWND_BROADCAST, WM_WININICHANGE, 0&, "windows"
''
''On Error GoTo 0
''
''End Function
''
''
''Public Function GetDefaultPrinter() As String
''
''
''
''Dim X     As Long
''Dim szTmp As String
''Dim dwBuf As Long
''
''
''On Error Resume Next
''dwBuf = 1024
''szTmp = Space$(dwBuf + 1)
''
''X = GetProfileString("windows", "device", vbNullString, szTmp, dwBuf)
''
''
''GetDefaultPrinter = Trim$(Left$(szTmp, X))
''
''On Error GoTo 0
''
''End Function
''
''
''Public Function ResetDefaultPrinter(szBuf As String) As Boolean
''
''
''
'''Dim X As Long
''
''
''
''On Error Resume Next
''WriteProfileString "windows", "device", szBuf
''
''SendMessageByString HWND_BROADCAST, WM_WININICHANGE, 0&, "windows"
''
''On Error GoTo 0
''
''End Function
''
''
''Public Function DialogConnectToPrinter() As Boolean
''
''
''
''On Error Resume Next
''Shell "rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter", vbNormalFocus
''On Error GoTo 0
''
''End Function
''
''
''Public Function DialogColor(ByVal lngHwnd As Long) As String
''
''
''
''
''
''
''Dim X  As Long
''Dim CS As COLORSTRUC
'''Dim CustColor(16) As Long
''
''
''
''On Error Resume Next
''
''With CS
''.lStructSize = Len(CS)
''.hwnd = lngHwnd
''.hInstance = App.hInstance
''.Flags = CC_RGBINIT
''.lpCustColors = String$(16 * 4, 0)
''End With 'CS
''X = ChooseColor(CS)
''If X = 0 Then
''DialogColor = vbNullString
''
''
''Else
''DialogColor = CS.rgbResult
''End If
''On Error GoTo 0
''
''End Function
''
''
''Public Function DialogFont(ByVal lngHwnd As Long, c As Control) As Boolean
''
''
''
''
''
''
''Dim LF              As LOGFONT
''Dim FS              As FONTSTRUC
''Dim lLogFontAddress As Long
''Dim lMemHandle      As Long
''
''
''On Error Resume Next
''If c.Font.Bold Then
''LF.lfWeight = FW_BOLD
''End If
''If c.Font.Italic Then
''
''
''LF.lfItalic = 1
''End If
''If c.Font.Underline Then
''
''
''LF.lfUnderline = 1
''End If
''FS.lStructSize = Len(FS)
''lMemHandle = GlobalAlloc(GHND, Len(LF))
''If lMemHandle = 0 Then
''DialogFont = False
''Exit Function
''
''
''
''
''
''
''End If
''lLogFontAddress = GlobalLock(lMemHandle)
''If lLogFontAddress = 0 Then
''DialogFont = False
''Exit Function
''
''
''
''
''
''
''End If
''CopyMemory ByVal lLogFontAddress, LF, Len(LF)
''
''With FS
''.lpLogFont = lLogFontAddress
''.iPointSize = c.Font.size * 10
''.Flags = CF_SCREENFONTS Or CF_EFFECTS
''End With 'FS
''If ChooseFont(FS) = 1 Then
''CopyMemory LF, ByVal lLogFontAddress, Len(LF)
''c.Font.Bold = LF.lfWeight >= FW_BOLD
''
''
''
''
''
''
''c.Font.Italic = LF.lfItalic = 1
''
''
''
''
''
''
''c.Font.Underline = LF.lfUnderline = 1
''
''
''
''
''
''
''c.Font.Name = ByteToString(LF.lfFaceName())
''c.Font.size = CLng(FS.iPointSize / 10)
''DialogFont = True
''Else
''DialogFont = False
''End If
''On Error GoTo 0
''
''End Function
''
''
''Public Function DialogPrint(ByVal lngHwnd As Long, ByVal bPages As Boolean, ByVal Flags As Long) As PRINTPROPS
''
''
''
''
''
''
''
''Dim DM   As DEVMODE
''Dim PD   As PRINTDLGSTRUC
''Dim lpDM As Long
'''Dim wNull As Integer
''
'''Dim szDevName As String
''
''
''
''On Error Resume Next
''
''With PD
''.lStructSize = Len(PD)
''.hwnd = lngHwnd
''.hDevMode = 0
''.hDevNames = 0
''.hdc = 0
''.Flags = Flags
''.nFromPage = 0
''.nToPage = 0
''.nMinPage = 0
''End With 'PD
''If bPages Then
''PD.nMaxPage = bPages - 1
''End If
''PD.nCopies = 0
''DialogPrint.Cancel = True
''If PrintDlg(PD) Then
''lpDM = GlobalLock(PD.hDevMode)
''CopyMemory DM, ByVal lpDM, Len(DM)
''lpDM = GlobalUnlock(PD.hDevMode)
''
''With DialogPrint
''.Cancel = False
''.Device = Left$(DM.dmDeviceName, InStr(DM.dmDeviceName, vbNullChar) - 1)
''
''
''.FromPage = 0
''.ToPage = 0
''.All = True
''End With 'DialogPrint
''DialogPrint.File = PD.Flags And PD_PRINTTOFILE
''
''
''
''
''
''
''
''DialogPrint.Collate = PD.Flags And PD_COLLATE
''
''
''
''
''
''
''
''If PD.Flags And PD_PAGENUMS Then
''
''With DialogPrint
''.Pages = True
''.All = False
''.FromPage = PD.nFromPage
''.ToPage = PD.nToPage
''End With 'DialogPrint
''Else
''DialogPrint.Pages = False
''End If
''If PD.Flags And PD_SELECTION Then
''DialogPrint.selection = True
''DialogPrint.All = False
''Else
''DialogPrint.Pages = False
''End If
''If PD.nCopies = 1 Then
''DialogPrint.Copies = DM.dmCopies
''End If
''DialogPrint.DM = DM
''End If
''On Error GoTo 0
''
''End Function
''
''
':)Code Fixer V3.0.9 (11/10/2010 10:20:50 AM) 1112 + 488 = 1600 Lines Thanks Ulli for inspiration and lots of code.



