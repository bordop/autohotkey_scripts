; hotkey to parse coordinates (from right-clicking googlemaps and copying coords to clipboard)
; this script allows you to press the NumPad keys 1 or 2 to send the coordinates into a spreadsheet 

#SingleInstance, force
#IfWinExist, Google Maps — Mozilla Firefox

coordinate_array := StrSplit(Clipboard, ",")

short1 := coordinate_array[1]
short2 := coordinate_array[2]

; msgbox indicates that the parsing was successful
Msgbox, 4096, ATTN, clipboard was parsed,1
; Msgbox % short1
; Msgbox % short2


; parse to keys
Numpad1::
{
	Clipboard:=
	Clipboard = %short1%
	SendInput, %Clipboard%
	Return
}

Numpad2::
{
	Clipboard:=
	Clipboard = %short2%
	SendInput, %Clipboard%
	Return
}
