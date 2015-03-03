#include <FTPEx.au3>
#include <File.au3>
#include <Date.au3>
#include <Array.au3>
#include <Excel.au3>


Local $sNewDate = _DateAdd('D', -1, _NowCalcDate())
Local $new_year = StringMid($sNewDate, 1, 4)
Local $new_mon = StringMid($sNewDate, 6, 2)
Local $new_day = StringMid($sNewDate, 9, 2)

Local $sPath = "d:\原始话务\" & $new_year & $new_mon & $new_day
Local $s2g = "d:\原始话务\2g.txt"
Local $s3g = "d:\原始话务\3g.txt"

;clean old files
If FileExists($s2g) Then
	FileDelete($s2g)
EndIf

If FileExists($s3g) Then
	FileDelete($s3g)
EndIf

;Get filelist
Local $FileList = _FileListToArray($sPath)
If @error = 1 Then
	MsgBox(0, "", "Path Not Found!")
	Exit
EndIf
If @error = 4 Then
	MsgBox(0, "", "Files Not Found!")
	Exit
EndIf

;~ For $i = 1 To $FileList[0]
;~ 	Local $checkdata = StringInStr($FileList[$i], @MON & @MDAY)
;~ 	If $checkdata = 0 Then
;~ 		MsgBox(0, "", "Date Error")
;~ 		Exit
;~ 	EndIf
;~ Next

For $i = 1 To $FileList[0]
	Local $nettype = StringLeft($FileList[$i], 2)
	Local $file2g = FileOpen($s2g, 9)
	Local $file3g = FileOpen($s3g, 9)

	If $nettype = "2G" Then
		Local $oExcel = _ExcelBookOpen($sPath & "\" & $FileList[$i])
		Local $cellx = _ExcelReadCell($oExcel, 1)
		If StringInStr($cellx, "结果") Then
			$x = 8
		Else
			$x = 1
		EndIf
		_ExcelColumnDelete($oExcel, 5, 4)
		_ExcelRowDelete($oExcel, 1, $x)
		Sleep(1000)
		Send("^a")
		Sleep(1000)
		Send("^c")
		Sleep(1000)
		FileWrite($file2g, ClipGet())
		Send("{DEL}")
		Sleep(1000)
		_ExcelBookClose($oExcel, 0, 0)
		ClipPut("")
	EndIf
	If $nettype = "3G" Then
		Local $oExcel = _ExcelBookOpen($sPath & "\" & $FileList[$i])
		Local $cellx = _ExcelReadCell($oExcel, 1)
		If StringInStr($cellx, "结果") Then
			$x = 8
		Else
			$x = 1
		EndIf
		_ExcelRowDelete($oExcel, 1, $x)
		Sleep(1000)
		Send("^a")
		Sleep(1000)
		Send("^c")
		Sleep(1000)
		FileWrite($file3g, ClipGet())
		Send("{DEL}")
		Sleep(1000)
		_ExcelBookClose($oExcel, 0, 0)
		ClipPut("")
	EndIf
Next

FileClose($file2g)
FileClose($file3g)

;;upload file
Local $server = '130.36.246.21'
Local $username = 'sxyunwei'
Local $pass = 'sxyunwei2012'

Local $Open = _FTP_Open('MyFTP')
Local $Conn = _FTP_Connect($Open, $server, $username, $pass)

_FTP_ProgressUpload($Conn, $s2g, "2G.TXT")
_FTP_ProgressUpload($Conn, $s3g, "3G.TXT")

_FTP_Close($Open)

