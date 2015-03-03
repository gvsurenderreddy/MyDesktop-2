

$result_18 = _GetRes("HZSS18", "132.151.136.123", "SJXSJX", "789632145")
$result_19 = _GetRes("HZSS19", "132.151.136.123", "SJXSJX", "789632145")
$result = $result_18 & $result_19

$str = StringSplit($result, @CRLF, 1)
#include <Array.au3>
_ArrayDisplay($str)

;~ $str = StringRegExp($result, "\d{5}\s+:\s+(\d+)\s+(\n)", 3)
;~ For $i = 0 To UBound($str) - 1
;~ 	FileWrite("c:\y.log", $str[$i])
;~ Next

Func _GetRes($server, $IP, $user, $pswd)
	$cmd = "ZIFO:CHU:GSMCHA:;"
	TCPStartup()
	$socketID = TCPConnect($IP, 23)
	If $socketID = -1 Then
		MsgBox(0, "", "cannot connect")
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
	TCPSend($socketID, $cmd & @CRLF)
	Sleep(2000)
	$ack = TCPRecv($socketID, 5000)
	TCPCloseSocket($socketID)
	TCPShutdown()
	Return ($ack)
EndFunc   ;==>_GetRes


