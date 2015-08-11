#cs ----------------------------------------------------------------------------

	AutoIt Version:
	3.3.12.0

	Script Function:
	To query IMSI/BAOC/4G of an MSISDN.
	Input file: NUMBER.txt in the same dir;
	Output file: outfile.csv in the same dir;

#ce ----------------------------------------------------------------------------

#include <Array.au3>

Local $file = FileOpen(@ScriptDir & "\NUMBERS.txt", 0)
FileWrite(@ScriptDir & "\outfile.csv", "MSISDN,IMSI,BAOC,4G" & @CRLF)

While True
	$num = FileReadLine($file)
	If @error = -1 Then ExitLoop
	If StringIsDigit($num) Then
		TrayTip("", $num, 20)
		_CheckUser($num)
	EndIf
WEnd
FileClose($file)


Func _CheckUser($num)
	Local $result, $result_2, $result_3, $imsi, $baoc, $fourg, $tmpfile, $outfile
	$result_2 = _GetRes("SXHLR2", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $num, "ZMIO:MSISDN=86")
	$result_3 = _GetRes("SXHLR3", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $num, "ZMIO:MSISDN=86")
	$result = $result_2 & $result_3

	$tmpfile = @ScriptDir & "\tmpfile"
	FileWrite($tmpfile, $result)
	$result = FileRead($tmpfile)
	$imsi = _ArrayToString(StringRegExp($result, "INTERNATIONAL MOBILE SUBSCRIBER IDENTITY \.+\s(\d+)", 3))
	FileDelete($tmpfile)

	$result_2 = _GetRes("SXHLR2", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $imsi, "ZMGO:IMSI=")
	$result_3 = _GetRes("SXHLR3", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $imsi, "ZMGO:IMSI=")
	$result = $result_2 & $result_3

	$tmpfile = @ScriptDir & "\tmpfile"
	FileWrite($tmpfile, $result)
	$result = FileRead($tmpfile)
	$baoc = _ArrayToString(StringRegExp($result, "BARRING OF ALL OUTGOING CALLS \.+\s(\w)", 3))
	FileDelete($tmpfile)

	$result_2 = _GetRes("SXHLR2", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $imsi, "ZMNF:IMSI=")
	$result_3 = _GetRes("SXHLR3", "132.151.136.123", "SXWGZX", "1Q2W3E4R", $imsi, "ZMNF:IMSI=")
	$result = $result_2 & $result_3

	$tmpfile = @ScriptDir & "\tmpfile"
	FileWrite($tmpfile, $result)
	$result = FileRead($tmpfile)
;~ 	$baoc = _ArrayToString(StringRegExp($result, "EPS STATUS \.+\s(\w)", 3))
	If StringInStr($result, "EPS STATUS") == 0 Then
		$fourg = "N"
	Else
		$fourg = "Y"
	EndIf
	FileDelete($tmpfile)

	$outfile = @ScriptDir & "\outfile.csv"
	FileWrite($outfile, $num & ",")
	FileWrite($outfile, $imsi & ",")
	FileWrite($outfile, $baoc & ",")
	FileWrite($outfile, $fourg & @CRLF)

EndFunc   ;==>_CheckUser

Func _GetRes($server, $IP, $user, $pswd, $num, $cmd)

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
	$mml = $cmd & $num & ";"
	TCPSend($socketID, $mml & @CRLF)
	Sleep(1000)

	$ack = TCPRecv($socketID, 9999999)
	TCPCloseSocket($socketID)
	TCPShutdown()

	Return ($ack)

EndFunc   ;==>_GetRes
