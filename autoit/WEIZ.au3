
Local $number = InputBox("Number", "Input Number", "", "", -1, 140)
Local $flag = 0

$result_18 = _GetRes("HZSS18", "132.151.136.123", "SJXSJX", "789632145", $number)
$result_19 = _GetRes("HZSS19", "132.151.136.123", "SJXSJX", "789632145", $number)
$result = $result_18 & $result_19
$str = StringSplit($result, @CRLF, 1)

For $i = 0 To UBound($str) - 1
	Local $r = StringInStr($str[$i], "LAST USED CELL ID", 1)
	If $r <> 0 Then
		MsgBox(0, "", $str[$i - 1] & @CRLF & $str[$i])
		$flag = 1
		Exit
	EndIf
Next

If $flag = 0 Then
	MsgBox(0, "", "Not Found")
EndIf

Func _GetRes($server, $IP, $user, $pswd, $num)
	$cmd = "ZMVO:MSISDN=86" & $num & ";"
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
	TCPSend($socketID, $cmd & @CRLF)
	Sleep(2000)
	$ack = TCPRecv($socketID, 9999)
	TCPCloseSocket($socketID)
	TCPShutdown()
	Return ($ack)
EndFunc   ;==>_GetRes
