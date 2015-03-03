
;;18
Run("C:\Program Files\VanDyke Software\CRT\CRT.exe")
WinWaitActive("Connect")
Send("HZSS18{ENTER}")
Sleep(1000)
Send("SJXSJX{ENTER}")
Sleep(1000)
Send("789632145{ENTER}")
Sleep(1000)
Send("!FL")
Sleep(1000)
Send("ZMVF::LAC=ALL;{ENTER}")
Sleep(3000)
WinClose("HZSS18 - CRT")
WinWaitActive("CRT")
Send("!Y")

;;19
Run("C:\Program Files\VanDyke Software\CRT\CRT.exe")
WinWaitActive("Connect")
Send("HZSS19{ENTER}")
Sleep(1000)
Send("SJXSJX{ENTER}")
Sleep(1000)
Send("789632145{ENTER}")
Sleep(1000)
Send("!FL")
Sleep(1000)
Send("ZMVF::LAC=ALL;{ENTER}")
Sleep(3000)
WinClose("HZSS19 - CRT")
WinWaitActive("CRT")
Send("!Y")

;;cmd
RunWait(@ComSpec & " /c copy hzss18*.log + hzss19*.log tmp.txt", @DesktopDir)
RunWait(@ComSpec & " /c findstr /C:"" : "" tmp.txt > user.txt", @DesktopDir)

;;excel
#include<Excel.au3>

$fname = @DesktopDir & "\user.txt"
$fexcel = @DesktopDir & "\user1.xls"
$file = FileOpen($fname)
$oexcel = _ExcelBookOpen($fexcel)
$sht = @MON + 35
_ExcelSheetActivate($oexcel, $sht)
$icol = 1 + 2
If @HOUR > 18 Then
	$irow = @MDAY * 2 + 3
Else
	$irow = @MDAY * 2 - 1 + 3
EndIf

While 1
	$line0 = FileReadLine($file)
	If @error = -1 Then ExitLoop
	$line = StringMid($line0, 10)
	_ExcelWriteCell($oexcel, $line, $irow, $icol)
	$icol += 1
WEnd

_ExcelBookClose($oexcel, 1, 0)
FileClose($file)

;;clean
RunWait(@ComSpec & " /c del hzss1*.log tmp.txt user.txt", @DesktopDir)


