#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Opt("GUIOnEventMode", 1)

If FileExists(@ScriptDir & "\ftp.ini") Then
	MsgBox(0, "y", "you")
Else
	MsgBox(0, "n", "meiyou,no exist creat it")
	GUICreate("ADD", 280, 320)
	GUICtrlCreateLabel("Server Name", 10, 20)
	GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
	$inputgui_1 = GUICtrlCreateInput("", 10, 40, 250, 20, 0x0008)
	GUICtrlCreateLabel("Server IP", 10, 80)
	$inputgui_2 = GUICtrlCreateInput("", 10, 100, 250, 20)
	GUICtrlCreateLabel("Username", 10, 140)
	$inputgui_3 = GUICtrlCreateInput("", 10, 160, 250, 20, 0x0008)
	GUICtrlCreateLabel("Password", 10, 200)
	$inputgui_4 = GUICtrlCreateInput("", 10, 220, 250, 20, 0x0020)
	$add_btn = GUICtrlCreateButton("ADD", 230, 270)
	GUICtrlSetOnEvent($add_btn, "_Add_Data")
	GUISetState(@SW_SHOW)

	While True
		Sleep(1000)
	WEnd

EndIf

Func CLOSEClicked()
	Exit
EndFunc   ;==>CLOSEClicked

Func _Add_Data()
	$_name = GUICtrlRead($inputgui_1)
	$_addr = GUICtrlRead($inputgui_2)
	$_user = GUICtrlRead($inputgui_3)
	$_pswd = GUICtrlRead($inputgui_4)

	IniWrite(@ScriptDir & "\ftp.ini", $_name, "IP", $_addr)
	IniWrite(@ScriptDir & "\ftp.ini", $_name, "USER", $_user)
	IniWrite(@ScriptDir & "\ftp.ini", $_name, "PAWS", StringToBinary($_pswd))

EndFunc   ;==>_Add_Data


