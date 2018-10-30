#SingleInstance, force
#Persistent
#NoTrayIcon
#WinActivateForce
#include functions.ahk
#include mainmenu.ahk
CoordMode, Screen
SetKeyDelay, 50

;-----------------------------------------------------------------------------------------------
; Hotkeys
;-----------------------------------------------------------------------------------------------

^+6:: ; thumbs up
	send {U+1F44D}
	Return


!+w::
	IfWinExist, ahk_exe WINWORD.EXE
		WinActivate
	IfWinNotExist, ahk_exe WINWORD.EXE
		Run WINWORD.EXE
		Return
#n::
	IfWinExist, ahk_exe notepad++.exe
		Winactivate
	IfWinNotExist,  ahk_exe notepad++.exe
		Run notepad++
	Return
^;::
	Formattime, TimeString,, M/dd/yyyy
	Send, %TimeString%
	return

^+x::
	IfWinExist, ahk_exe sublime_text.exe
		Winactivate
	IfWinNotExist,  ahk_exe sublime_text.exe
		Run "C:\Program Files\Sublime Text 3\sublime_text.exe"
	Return
#w:: run "B:\scripts\ActiveWindowInfo.ahk"
Return
^F4::
	Run B:\scripts\lib\Vis2-master\OCR.ahk
	Return

;************    Add "quotation" marks, percent signs
^q::
	Clipboard:=
	Send, ^c
	ClipWait,  1
	Clipboard = "%Clipboard%"
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




#IfWinActive
;********** toggle always on top mode************
^F8::
	WinSet, AlwaysOnTop, toggle, A
	Return
;********************HotStrings********************
:*:bo@::bordop@gmail.com
:*:pb@::PBordokoff@eugene-or.gov
:*:ppp::Peter Bordokoff
:*:pxb@::peter.x.bordokoff@ci.eugene.or.us
:*:peter.x::Peter.X.Bordokoff_PWE
:*:l.stack::& vbCrLf&  ; stacked label expression in VBA
:*:l.sm::
	Run C:\Program Files\AutoHotkey\AutoGUI\Tools\Scripts Manager.ahk
	Return

;**********     code delimiting Snippets     **********
#;::
	SendInput, `;**************            **************
	SendInput, {left 20}
Return
#'::
	SendInput, `;-----------------------------------------------------------------------------------------------{Enter};{Enter}
	SendInput, `;-----------------------------------------------------------------------------------------------{Up}{Space 2}
	Return

#IfWinActive, ahk_exe Sublime_Text.exe
	F5::
	SendInput, ^s
	SendInput, ^b
	Return
#b:: ; toggle file panel
	SendInput, ^k^b
	Return
#c:: ; collapse
	SendInput, ^k
	SendInput, ^1
	Return

:*:xl::XL
::msg::msgbox %

$*r:: ;hold r to put Return
	Send {Blind}{r}
	KeyWait, r, T0.5
	If ErrorLevel {
		Send {BackSpace}Return
		KeyWait, r
	}
	Sleep 300
	Return

#IfWinActive, ahk_exe Explorer.EXE
F1::
	Clipboard := ""                ; empty Clipboard
	Send, ^c                       ; copy the selected file
	ClipWait, 1                    ; wait for the Clipboard to contain data
	if (!ErrorLevel)               ; If NOT ErrorLevel clipwait found data on the Clipboard
	Clipboard := Clipboard         ; convert to text (= copy the path)
	Sleep, 100
	MsgBox,,, %Clipboard%,2
	Return ; Send the file path to the Clipboard while in explorer
