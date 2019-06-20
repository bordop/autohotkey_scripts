; Title: Platwork GUI
; Author: Peter Bordokoff
; Purpose: Aid data entry for plats. Type values once, send them easily to arcmap instead of retyping

;          ================================================================================
#SingleInstance, force
global CSO, DocNo, PlatName, DateRecd, OldLot, ADN, CSO_, DocNo_, PlatName_, DateRecd_, OldLot_, ADN_ 





; ; ======================================== init ========================================
; ; Timestamp - to check for last time run
Formattime, ts,, yyyyMMddHHm

; ; Formatted Timestamp for GUI'
Formattime, tsf,, M/dd/yyyy


; ; read in contents of last save:
IniRead, _ts, platwork.ini, TimeStamp_, Last
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _CSO, platwork.ini, Current, CSO
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _DocNo, platwork.ini, Current, DocNo
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _PlatName, platwork.ini, Current, PlatName
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _DateRecd, platwork.ini, Current, DateRecd
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _OldLot, platwork.ini, Current, OldLot
if ErrorLevel
  MsgBox, 4096, Error, error reading ini file!, 3
IniRead, _ADN, platwork.ini, Current, ADN


; conditional: if timestamp is not equal to last entry => new entry => display gui
;              if timestamp IS equal to last entry => ask if new entry
If % (_ts == ts)
{
    MsgBox % "test"
    Gosub, LoadGUI
}
else
  {
    Gosub, GO
  }
Return










; ; ======================================== new entry GUI ========================================
GO:
global CSO, DocNo, PlatName, DateRecd, OldLot, ADN 
InputBox, CSO, SearchBox, Enter CSO Number ,  , , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.

InputBox, DocNo, SearchBox, Enter Document Barcode , 2018-, , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.

InputBox, PlatName, SearchBox, Enter Full Plat Name, 2018-P, , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.

InputBox, DateRecd, SearchBox, Enter Date Plat was Recorded,  , , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.

InputBox, OldLot, SearchBox, Enter Old Taxlot Number ,  , , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.

InputBox, ADN, SearchBox, Enter Agency Doc Number ,  , , , 200, 200
  if ErrorLevel
      MsgBox, CANCEL was pressed.
gosub, writetofile
Return






; ; ======================================== write ========================================
writetofile:
;write the values to file
IniWrite, %ts%, platwork.ini, TimeStamp, Current
IniWrite, %CSO%, platwork.ini, Current, CSO
IniWrite, %DocNo%, platwork.ini, Current, DocNo
IniWrite, %PlatName%, platwork.ini, Current, PlatName
IniWrite, %DateRecd%, platwork.ini, Current, DateRecd
IniWrite, %OldLot%, platwork.ini, Current, OldLot
IniWrite, %ADN%, platwork.ini, Current, ADN

IniWrite, %ts%, platwork.ini, TimeStamp_, Last
IniWrite, %CSO%, platwork.ini, LastEntry, CSO_
IniWrite, %DocNo%, platwork.ini, LastEntry, DocNo_
IniWrite, %PlatName%, platwork.ini, LastEntry, PlatName_
IniWrite, %DateRecd%, platwork.ini, LastEntry, DateRecd_
IniWrite, %OldLot%, platwork.ini, LastEntry, OldLot_
IniWrite, %ADN%, platwork.ini, LastEntry, ADN_
Gosub, LoadGUI
Return

; ======================================== Display GUI ========================================

LoadGUI:
Gui, New, +AlwaysOnTop
Gui, Add, Text, w250, Today's Date %tsf%

Gui, Add, Text, wp, Lane County Surveyor's Number:
Gui, Add, Button, wp-150 x+0 ggCSO, %_CSO%
Gui, Add, Text, wp+150 x10, Plat Name: 
Gui, Add, Button, wp-150 x+0 ggPlatName, %_PlatName%
Gui, Add, Text, wp+150 x10, Document Number: 
Gui, Add, Button, wp-150 x+0 ggDocNo, %_DocNo%
Gui, Add, Text, wp+150 x10, Date Recorded: 
Gui, Add, Button, wp-150 x+0 ggDateRecd, %_DateRecd%
Gui, Add, Text, wp+150 x10, Old Lot Number: 
Gui, Add, Button, wp-150 x+0 ggOldLot, %_OldLot%
Gui, Add, Text, wp+150 x10, Agency Document Number (5-digits): 
Gui, Add, Button, wp-150 x+0 ggADN, %_ADN%
; Gui, Add, Button, w90 gonclick, SUBMIT
Gui, Show
Return

GuiClose:
ExitApp

onclick:
Gui, Submit, NoHide
Gosub, writetofile
Return



gCSO:
Clipboard:=_CSO
Gosub, tooltipper
Return
gPlatName:
Clipboard:=_PlatName
Gosub, tooltipper
Return
gDocNo:
Clipboard:=_DocNo
Gosub, tooltipper
Return
gDateRecd:
Clipboard:=_DateRecd
Gosub, tooltipper
Return
gOldLot:
Clipboard:=_OldLot
Gosub, tooltipper
Return
gADN:
Clipboard:=_ADN
Gosub, tooltipper
Return

tooltipper:
ToolTip, clipboard updated
SetTimer, RemoveToolTip, -1000
RButton::
Send, {LButton}
SendInput, %Clipboard%
return

RemoveToolTip:
ToolTip
return

