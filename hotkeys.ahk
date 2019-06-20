#SingleInstance, force
#Persistent
; #NoTrayIcon
Menu, Tray, Icon, % A_WinDir "\system32\imageres.dll", 69
#WinActivateForce
#Include, C:\Program Files\AutoHotkey\Lib\functions.ahk
SetBatchLines, -1


;******************************     MENU     **************************************
open_menu() {

	Menu, MyMenu, Add, &Platwork, cewepxb
	Menu, MyMenu, Add, &Downloads, DLS
	Menu, MyMenu, Add, Documents, DOCS
	Menu, MyMenu, Add, &Musica, SCRIPTS
	Menu, MyMenu, Add, &Arc Catalog, CATALOG
	Menu, MyMenu, Add, GD3, GD3
	Menu, MyMenu, Add, &Screens, Screens
	Menu, MyMenu, Add, ExitApp, Exit
	Menu, MyMenu, Show
	Return
}
	DLS:
	Run C:\Users\CEWEPXB\Downloads
	Return

	DOCS:
	Run D:\Documents
	Return

	SCRIPTS:
	Run C:\Users\cewepxb\Music
	Return

	GD3:
	Run \\Ceims002\geodart3\GD3.mxd
	Return

	CATALOG:
	Run C:\Program Files (x86)\ArcGIS\Desktop10.3\bin\ArcCatalog.exe
	Return

	cewepxb:
	Run C:\Program Files\AutoHotkey\scripts\For Projects\platwork\platwork.ahk
	Return

	Screens:
	run D:\Images\ScreenCaps
	Return

	Exit:
	ExitApp
	Return

;********************     menu open and options     ********************
!z::open_menu()
Return

;-----------------------------------------------------------------------------------------------
; Hotkeys
;-----------------------------------------------------------------------------------------------

#IfWinActive, 
+^CapsLock::CapsLock
Return
CapsLock::RControl
Return
RCtrl::Ctrl
Return

^!a::
	Run accviewer.ahk
	WinWait, Accessible Info Viewer
	WinMove, 2270, 1
	Return
^!h::
	Run C:\Program Files\AutoHotkey\scripts\Misc\min_to_tray.ahk
	Return
Capslock & w::
	send {U+1F44D}
	Return
^F2::
	Run C:\Program Files\AutoHotkey\scripts\screensWtext.ahk
	Return
^F3::
	Run C:\Program Files\AutoHotkey\Lib\textFind.ahk
	Return


Pause::
	Run, C:\Program Files\AutoHotkey\scripts\Misc\NOSAVER_2.0.ahk
	Return
:*:s.lib::
	SendInput, 05450003117092{Tab}7355608{Enter}
	Return
#n::
	IfWinExist, ahk_exe notepad++.exe
		Winactivate
	IfWinNotExist,  ahk_exe notepad++.exe
		Run notepad++
	Return
^Insert::
	Formattime, TimeString,, M/dd/yyyy
	Send, %TimeString%
	Return

; Open in containing folder
^+e::
    editor_open_folder() 
    {
        WinGetTitle, path, A
        if RegExMatch(path, "\*?\K(.*)\\[^\\]+(?= [-*] )", path)
            if (FileExist(path) && A_ThisHotkey = "^+e")
                Run, % "explorer.exe /select," . path
            else
                Run explorer.exe "%path1%"
    }
Return

; ; opens explorer to .exe of the active window, and selects!
; F11::
; WinGet, path, ProcessPath, A
; Run, % "explorer.exe /select," . path
; return




; ::iwb2:: 
; Run, C:\Program Files\AutoHotkey\scripts\lib\iWB2 Learner UPDATED.ahk
; Return

; ; time to digi lats!
; ^!PgUp::
; Run, H:\projects\WasteWaterServiceLaterals\WasteTestwithGD3.mxd
; Run, H:\projects\WasteWaterServiceLaterals\DOCS\Test PWEIMS.accdb
; Run, C:\Program Files\AutoHotkey\scripts\For Projects\WWL\CreatingWasteLines.ahk
; Return

; ; Swap two letters when cursor is between them
; $!s::
;   OldClipboard := ClipboardAll
;   Clipboard :=
;   SendInput, {Left}+{Right 2}
;   SendInput, ^c
;   ClipWait, 1
;   If ErrorLevel
;       MsgBox "No text selected"
;   switch := SubStr(Clipboard, 2) . SubStr(Clipboard, 1, 1)
;   SendInput, %switch%
;   Send, {Left}
;   Clipboard := OldClipboard
; Return

;; Swap two WORDS with cursor between them
; ^!s::
;   OldClipboard := ClipboardAll
;   Clipboard :=
;   SendInput, ^{left}
;   SendInput, ^+{Right 2}
;   SendInput, ^c
;   ClipWait, 1
;   words := StrSplit(Clipboard, A_Space)
;   swapped := words[2] A_Space words[1]
;   SendInput, {BackSpace}
;   SendInput, %swapped%
;   Clipboard := OldClipboard
; Return




^+w::
	run C:\Program Files\AutoHotkey\scripts\Misc\ActiveWindowInfo.ahk
    Return

;replace slashes from file path to work in python scripts

; with path on clipboard, fire this off to paste a python friendly path
#v::
	newstr := StrReplace(Clipboard, "\" ,  "/")
	SendInput, %newstr%
	Return


#IfWinActive
;************    Add "quotation" marks, percent signs
^q::
	Clipboard:=
	Send, ^c
	ClipWait,  1
	Clipboard = "%Clipboard%"
	SendInput %Clipboard%
	Return
^+q::
	Clipboard:=
	Send, ^c
	ClipWait,  1
	Clipboard = '%Clipboard%'
	SendInput %Clipboard%
	Return
!q::
	Clipboard:=
	Send, ^c
	ClipWait,  1
	Clipboard = `%%Clipboard%`%
	SendInput %Clipboard%
	Return
#q::
	Clipboard:=
	Send, ^c
	ClipWait,  1
	Clipboard = (%Clipboard%)
	SendInput %Clipboard%
	Return


#IfWinActive, 
;**********     Task List hotkeys     **********
^Numpad1::
	SendInput, (complete)
	SendInput, ^+{Left 3}
	Return
^Numpad2::
	SendInput, (on-going)
	SendInput, ^+{Left 3}
	Return



#IfWinActive, ahk_exe OUTLOOK.EXE
F1::  ;send message to MVM
	SendInput, ^+m
	SendInput, MMiller@eugene-or.gov{Tab 4}Mike,{Down 3}
	Return




#IfWinActive,
;********** toggle always on top mode************
^F8::
	WinSet, AlwaysOnTop, toggle, A
	Return






;********************HotStrings********************
:*:bo@::bordop@gmail.com
:*:pb@::PBordokoff@eugene-or.gov
:*:pxb@::peter.x.bordokoff@ci.eugene.or.us
:*:ppp::Peter Bordokoff
:*:peter.x::Peter.X.Bordokoff_PWE
:*:cew::cewepxb
:*:.stack::& vbCrLf&  ; stacked label expression in VBA
:*:.customicon::Menu, Tray, Icon, C:\Program Files\AutoHotkey\ahkicon.bmp
:*:l.sm::
	Run C:\Program Files\AutoHotkey\Lib\Scripts Manager.ahk
	Return
:*:.pro::ArcGIS Pro
:*:.sdk::ArcGIS Pro SDK
:*:mvm@::MMiller@eugene-or.gov





;**********     code delimiting Snippets     **********

#;::
	SendInput, ================================================================================^/
	SendInput, {left 40}{Space 2}{Left}
Return
#'::
	SendInput, --------------------------------------------------------------------------------------^/{Enter};{Enter}
	SendInput, --------------------------------------------------------------------------------------^/{Up}^/
	Return




; run/activate st3
#IfWinExist, ahk_exe Sublime_Text.exe
^F12::
	WinActivate, ahk_exe Sublime_Text.exe
	Return
#IfWinNotExist, ahk_exe Sublime_Text.exe
^F12::
	run C:\Program Files\Sublime Text 3\sublime_text.exe
	Return



#IfWinActive, ahk_exe Sublime_Text.exe
	F5::
	SendInput, ^s
	SendInput, ^b
	Return
#b:: ; toggle file panel
	SendInput, ^k^b
	Return
::msg::
	SendInput, MsgBox `%%A_space%
	Return
F1::
	Send, !fr
	return

#IfWinActive, ahk_exe Explorer.EXE
F1::
	Clipboard := ""                ; Empty, Clipboard
	Send, ^c
	ClipWait, 1
	if (!ErrorLevel)
	Clipboard := Clipboard
	Sleep, 100
	MsgBox,,, %Clipboard%,1
	Return



; code helping hotstrings:
; FYI: hotstring does not work in cmd... send to Clipboard
#IfWinActive,
:o*:.owrite::arcpy.env.overwriteOutput = True
:*:mxd =::mxd = arcpy.mapping.MapDocument()
:*:.df::df = arcpy.mapping.ListDataFrames(mxd)[0]
:*:.env::arcpy.env.workspace = 'D:/GIS/Workspace/DEFAULT.gdb'
::imp::import
:*:arcp::arcpy
::pub::public
::pri::private
:*:.getcount::arcpy.GetCount_management
::lb::ListBox
::lbi::ListBoxItem
::cb::ComboBox
::cbi::ComboBoxItem
:*:gd3::GeoDART3

; ; jupyter notebook hotstings:
; :*:.inline::import matplotlib.pyplot as plt{Enter}%matplotlib inline{Enter}
; :*:.gis::from arcgis.gis import *{Enter}from getpass import getpass{Enter}
; :*:.gpass::from getpass import getpass{Enter}
; :*:.np::import numpy as np{Enter}
; :*:.pd::import pandas as pd
; :*:.disp::from IPython.display import display
; :*:.geo:: from arcgis.geocoding import geocode
; :*:.content::items = gis.content.search(query="", max_items=10){enter}for item in items:{Enter}display(item)
; :*:.connect::pw = getpass.getpass(prompt="password"){enter}gis = GIS("https://eugene-pwe.maps.arcgis.com/home/index.html", "Peter.X.Bordokoff_PWE", pw)

:*:.cmd::
Send, {LWin}
SendInput, cmd
SendInput, {Ctrl}{Shift}{Enter}
Return

#IfWinActive,
:*:.mp3::
InputBox, URL, Enter:, Link:
Clipboard = youtube-dl -x -o "C:\Users\cewepxb\Music\`%(title)s.mp3" https://www.youtube.com/watch?v=%URL%
Send, {LWin}
SendInput, cmd
SendInput, {Ctrl}{Shift}{Enter}
WinWaitActive, ahk_class ConsoleWindowClass
CoordMode, mouse, Relative
Click, Right, 200, 200
Send, {enter}
Run, C:\Users\cewepxb\Music
Return

#IfWinActive,
:*:.vid::
InputBox, URL, Enter:, Link:
Clipboard = youtube-dl -o "C:\Users\cewepxb\Videos\`%(title)s.`%(ext)s" https://www.youtube.com/watch?v=%URL%
Send, {LWin}
SendInput, cmd
SendInput, {Ctrl}{Shift}{Enter}
Return

; ::py.dict::
; SendInput {raw} dictionary = {'key': 'value', }
; Return


:*:.try::
SendInput, try:`nexcept Exception as e:`nprint(e.message){Up 2}{Enter}
Return


; :*:BAH::
; InputBox, query, Query:, your search?
; Run, https://duckduckgo.com/?q=site:https://community.esri.com/groups/arcgis-pro-sdk + %query%
; Return


;; get unique values from the clipboard
; ^g::
; string := Clipboard
; Sort, string, U
; Clipboard = %newstr%
; MsgBox % string
; Return



; ; look up GIS content on Geonet/stackexchange/general search
; Esc & F1::
; InputBox, query, Attention, Your GIS Query:
; querya := StrReplace(query, " ", "+")
; ; MsgBox % querya
; url = https://gis.stackexchange.com/search?q=%querya%
; Run, C:\Program Files\Mozilla Firefox\firefox.exe %url%
; _url = https://community.esri.com/groups/arcgis-pro-sdk/content?query="%querya%
; Run, C:\Program Files\Mozilla Firefox\firefox.exe %_url%
; Return






#IfWinActive, Timesheet
 
:*:-::`:00:00
:*:=::`:00:01
:*:\::`:30:00
:*o:me::MEETING
:*o:dd::DATADEVELOPMENT
:*o:dm::ROUTINE_DATA_MAINT
:*o:tf::TRAINING_FORMAL
:*o:ts::TRAINING_SELF
:*o:da::DESKTOPAPPLICATION
:*o:pr::PROGRAMMING






#IfWinActive, 
F10::
win_resize()
return

NumpadEnter & Numpad1::
win_pos()
Return

NumpadEnter & Numpad2::
win_pos2()
Return

NumpadEnter & Numpad3::
win_pos3()
Return








; Arcmap 10.3 helpers
#IfWinActive, ahk_exe ArcMap.exe
; set snapping tolerances
#s::
	Text:="|<>*143$42.0000000D0Y000080UU00080UU00087ZtllwD9YW9Us88YW90E88YW90089YW900DbYtl000000000U"

	MouseGetPos, xpos, ypos
	if (ok:=FindText(35, 86, 1500, 1500, 0, 0, Text))
	{
	  X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
	  Click, %X%, %Y%
	  SendInput, {up 4}{Right}{Down}{Enter}
	}

F9::   ; Edit Selectable Layers
    MouseGetPos, xpos, ypos
    Text:="|<>*136$69.000000000003U01k200010UU0UE0E0208440420200E10UkRsMCFlrj/YP4I1W+FME9YY4yU2THu278YsI40+2EEF94Y6kU3MH329AYrXr3luDCRtsX000000000004"
    if (ok:=FindText(1960, 64, 1500, 1500, 0, 0, Text))
    {
      X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
      Click, %X%, %Y%
    }
    MouseMove, %xpos%, %ypos%, 0
    WinWait, Set Selectable Layers
    WinMove, Set Selectable Layers, , 1, 350, 347, 400
    Return



;**********     Snapping Window     **********
F10::
    MouseGetPos, xpos, ypos

	Text:="|<>*142$69.000000000001k0000E008EcE00000000XA2000000004t0MTD/ZmT7UZ99X89YmH9A4d92F78YGF8UJt8O994WG943693F9AaGF9UMl/m9tswG8w36900084000U0000010U00A0000008400D000000000000000U"

	if (ok:=FindText(1682, 62, 15000, 15000, 0, 0, Text))
    {
      X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
      Click, %X%, %Y%
    }
    MouseMove, %xpos%, %ypos%, 0
    Return



;           Clear selected features
XButton2::
    MouseGetPos, xpos, ypos
    Text:="|<>*153$33.000000000000000000000007zk000Y20004UE000WO0004IE000V200044E000UW00040E000UG0007zk00000000000000000000000000000000004"
    if (ok:=FindText(348, 88, 15000, 15000, 0, 0, Text))
    {
     X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
     Click, %X%, %Y%
     MouseMove, %xpos%, %ypos%, 0
    }
    Return

XButton1:: ; last extent
    MouseGetPos, xpos, ypos
    Text:="|<lastExtent>*166$16.0000U0C01s0DzVzyDzsTzUzy1s03U060000008"
    if (ok:=FindText(465, 81, 1500, 1500, 0, 0, Text))
    {
    X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
    Click, %X%, %Y%
    MouseMove, %xpos%, %ypos%, 0
    }
    Return



F4::  ; Wide view Bookmark Hotkey
	WinActivate, Arcmap.exe
	Send {Esc}!bw
	return



