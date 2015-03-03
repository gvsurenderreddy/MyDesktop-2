#include <Array.au3>

; While True
_CheckUser()
; Sleep(1800000) ;in ms (micro-second)
; WEnd

Func _CheckUser()
	Local $result_19 = _GetRes("HZSS19", "132.151.136.123", "SXWGZB", "1Q2W3E4R")
	Local $result_18 = _GetRes("HZSS18", "132.151.136.123", "SXWGZB", "1Q2W3E4R")
	Local $result = $result_19 & $result_18

	FileWrite("tmpfile", $result)
	$result = FileRead("tmpfile")
	FileDelete("tmpfile")
	Local $array1 = StringRegExp($result, "MOBILE SUBSCRIBER INTERNATIONAL ISDN NUMBER \.+\s(\d+)", 3)
	Local $array2 = StringRegExp($result, "LAST USED CELL ID \.+\s\w+/(\d+)D", 3)

	; If $array = 1 Then
	; MsgBox(0, "", "NotFound!", 30)
	; Else
	_ArrayDisplay($array1)
	_ArrayDisplay($array2)
	; EndIf

EndFunc   ;==>_CheckUser

Func _GetRes($server, $IP, $user, $pswd)
	Local $file = FileOpen(@ScriptDir & "\num.txt", 0)

	TCPStartup()
	$socketID = TCPConnect($IP, 23)

	If $socketID = -1 Then
		MsgBox(0, "", "Cannot connect!")
		Exit
	EndIf

	TCPSend($socketID, "OMC" & @CRLF)
	Sleep(1000)
	TCPSend($socketID, $server & @CRLF)
	Sleep(1000)
	TCPSend($socketID, $user & @CRLF)
	Sleep(1000)
	TCPSend($socketID, $pswd & @CRLF)
	Sleep(1000)
	While True
		$cmd = FileReadLine($file)
		If @error = -1 Then ExitLoop
		; TrayTip("", StringMid($cmd, 15, 11), 1)
		TCPSend($socketID, $cmd & @CRLF)
		Sleep(1000)
	WEnd
	; $cmd = FileRead($file)
	; ClipPut($cmd)
	; TCPSend($socketID, $cmd)
	$ack = TCPRecv($socketID, 9999999)
	TCPCloseSocket($socketID)
	TCPShutdown()
	FileClose($file)

	Return ($ack)

EndFunc   ;==>_GetRes
