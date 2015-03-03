#include <ie.au3>

Local $oIE = _IECreate("http://192.111.101.64/login.html")
Local $oName = _IEGetObjById($oIE, "UserName")
_IEAction($oName, "focus")
Send("sx")
Local $oPswd = _IEGetObjById($oIE, "pwd")
_IEAction($oPswd, "focus")
Send("Sx123#*", 1)

Send("{ENTER}")

;~ Sleep(2000)
;~ Local $t = _IELinkClickByText($oIE, "日历")

;~ If $t = 0 Then
;~ 	MsgBox(0, "", @error)
;~ EndIf


WinWaitActive("核心网网络优化系统")
MouseClick("left", 80, 40)
MouseClick("left", 835, 85)




