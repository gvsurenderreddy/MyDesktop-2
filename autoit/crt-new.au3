#include <Excel.au3>

;close all xls
Do
   Local $PID2 = ProcessExists("excel.exe")
   ProcessClose($PID2)
Until $PID2 == 0

;get result by Func()
$result_18 = _GetRes("HZSS18", "132.151.136.123", "SXWGZB", "!q@w3E4R")
$result_19 = _GetRes("HZSS19", "132.151.136.123", "SXWGZB", "!q@w3E4R")
$result = $result_18 & $result_19

;ready for xls
$fexcel = @DesktopDir & "\忙时3G用户数情况11.xls"
$oexcel = _ExcelBookOpen($fexcel)
$sht = @MON + 35
_ExcelSheetActivate($oexcel, $sht)
$icol = 1 + 2
If @HOUR > 15 Then
	$irow = @MDAY * 2 + 3
Else
	$irow = @MDAY * 2 - 1 + 3
EndIf

;fill xls
$str = StringRegExp($result, "\d{5}\s+:\s+(\d+)\s+\n", 3)
For $i = 0 To UBound($str) - 1
   _ExcelWriteCell($oexcel, $str[$i], $irow, $icol)
   $icol += 1
Next

;close xls
_ExcelBookClose($oexcel, 1, 0)

;Func 
Func _GetRes($server, $IP, $user, $pswd)
	$CMD = "ZMVF::LAC=ALL;"
	TCPStartup()
	$socketID = TCPConnect($IP, 23)
	If $socketID = -1 Then
	  MsgBox(0, "", "无法连接")
	  Exit
	EndIf
	TCPSend($socketID, "OMC" & @CRLF)
	Sleep(2000)
	TCPSend($socketID, $server & @CRLF)
	Sleep(2000)
	TCPSend($socketID, $user & @CRLF)
	Sleep(2000)
	TCPSend($socketID, $pswd & @CRLF)
	Sleep(2000)
	TCPSend($socketID, $CMD & @CRLF)
	Sleep(2000)
	$ack = TCPRecv($socketID, 5000)
	TCPCloseSocket($socketID)
	TCPShutdown()
	Return ($ack)
EndFunc   ;==>_GetRes


