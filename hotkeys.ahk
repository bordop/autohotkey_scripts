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


; Thumbs up!
!w::
	send {U+1F44D}
	Return


#n::
	IfWinExist, ahk_exe notepad++.exe
		Winactivate, notepad++.exe
	IfWinNotExist,  ahk_exe notepad++.exe
		Run notepad++
	Return

; DateStamp
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



; with path on clipboard, paste a python friendly path - replace slashes from file path to work in python scripts
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
;********** toggle always on top mode************
^F8::
	WinSet, AlwaysOnTop, toggle, A
	Return




#IfWinActive, ahk_exe Sublime_Text.exe
	F5::
	SendInput, ^s
	SendInput, ^b
	Return
#b:: ; toggle file panel
	SendInput, ^k^b
	Return

; Path from selection in WindowsExplorer
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



; get unique values from the clipboard
^+u::
string := Clipboard
Sort, string, U
Clipboard = %newstr%
MsgBox % string
Return
