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



!w::
	send {U+1F44D}
	Return
^F2::
	Run C:\Program Files\AutoHotkey\scripts\screensWtext.ahk
	Return
^F3::
	Run C:\Program Files\AutoHotkey\Lib\textFind.ahk
	Return

#n::
	IfWinExist, ahk_exe notepad++.exe
		Winactivate, notepad++.exe
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



 ; Swap two letters when cursor is between them
 $!s::
   OldClipboard := ClipboardAll
   Clipboard :=
   SendInput, {Left}+{Right 2}
   SendInput, ^c
   ClipWait, 1
   If ErrorLevel
       MsgBox "No text selected"
   switch := SubStr(Clipboard, 2) . SubStr(Clipboard, 1, 1)
   SendInput, %switch%
   Send, {Left}
   Clipboard := OldClipboard
 Return

; Swap two WORDS with cursor between them
 ^!s::
   OldClipboard := ClipboardAll
   Clipboard :=
   SendInput, ^{left}
   SendInput, ^+{Right 2}
   SendInput, ^c
   ClipWait, 1
   words := StrSplit(Clipboard, A_Space)
   swapped := words[2] A_Space words[1]
   SendInput, {BackSpace}
   SendInput, %swapped%
   Clipboard := OldClipboard
 Return




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

#IfWinActive, ahk_exe Explorer.EXE
F1::
	Clipboard := ""
	Send, ^c
	ClipWait, 1
	if (!ErrorLevel)
	Clipboard := Clipboard
	Sleep, 100
	MsgBox,,, %Clipboard%,1
	Return




; ::py.dict::
; SendInput {raw} dictionary = {'key': 'value', }
; Return


:*:.try::
SendInput, try:`nexcept Exception as e:`nprint(e.message){Up 2}{Enter}
Return

;; get unique values from the clipboard
; ^g::
; string := Clipboard
; Sort, string, U
; Clipboard = %newstr%
; MsgBox % string
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
