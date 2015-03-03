#include <Array.au3>
#include <Excel.au3>
#include <File.au3>
#include <Date.au3>

Local $path = @ScriptDir & "\"

;Get yesterday
Func yesterday($idate)
	Local $day, $ystd, $y, $m, $d
	Local $yyyy = StringLeft($idate, 4)
	Local $mm = StringMid($idate, 5, 2)
	Local $dd = StringRight($idate, 2)
	Local $day = _DateToDayValue($yyyy, $mm, $dd)
	Local $tmp = _DayValueToDate($day - 1, $y, $m, $d)
	$ystd = $y & $m & $d
	Return $ystd
EndFunc   ;==>yesterday


;Get filelist
Local $FileList = _FileListToArray($path)
If @error = 1 Then
	MsgBox(0, "", "没有找到文件夹.")
	Exit
EndIf
If @error = 4 Then
	MsgBox(0, "", "没有找到文件.")
	Exit
EndIf
;~ _ArrayDisplay($FileList, "文件清单")

;Get filetype
For $i = 1 To $FileList[0]
	Local $file, $lines, $str, $obj, $csv, $xls_td, $xls_ystd, $date_td, $date_ystd, $obj_ystd
	If StringRight($FileList[$i], 3) = "csv" Then

		;find today file
		$file = $path & $FileList[$i]
		$str = $path & StringLeft($FileList[$i], 6)

		;get today & yesterday
		$date_td = StringMid($FileList[$i], 7, 8)
		$date_ystd = yesterday($date_td)

		;open csv and save it as xlsx
		$obj = _Excel_Open()
		$csv = _Excel_BookOpen($obj, $file)
		_Excel_BookSaveAs($csv, $str & $date_td & ".xlsx", Default, True)
		_Excel_Close($obj)
		FileDelete($file)

		;open today xlsx
		$obj = _Excel_Open()
		$xls_td = _Excel_BookOpen($obj, $str & $date_td & ".xlsx")

		;delete unused columns
		_Excel_RangeDelete($xls_td.ActiveSheet, "B:B")
		_Excel_RangeDelete($xls_td.ActiveSheet, "C:C")
;~ 		_Excel_BookSave($xls_td)

		;delete unused lines
		Local $t, $m, $n
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江绍兴")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江杭州")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江嘉兴")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江湖州")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江宁波")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江舟山")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江金华")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江温州")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江台州")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江丽水")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
		$t = _ArrayFindAll((_Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("A:A"))), "浙江衢州")
		$m = _ArrayMax($t) + 1
		$n = _ArrayMin($t) + 1
		_Excel_RangeDelete($xls_td.ActiveSheet, "A" & $n & ":A" & $m, $xlShiftUp, 1)
;~ 		_Excel_BookSave($xls_td)

		;remove prefix-number 86
		$t = _Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("B:B"))
		$m = UBound($t)
		$n = Floor($m / 2)
		$t = _Excel_RangeRead($xls_td, Default, "B2:B" & $n)
		_ArrayTrim($t, 2)
		_Excel_RangeWrite($xls_td, Default, $t, "B2")
		$t = _Excel_RangeRead($xls_td, Default, "B" & $n + 1 & ":B" & $m)
		_ArrayTrim($t, 2)
		_Excel_RangeWrite($xls_td, Default, $t, "B" & $n + 1)

		;open yesterday xlsx
		$xls_ystd = _Excel_BookOpen($obj, $str & $date_ystd & ".xlsx", True, False)

		;paste yesterday/today numbers into 2 arrays
		Local $a_ystd
		$a_ystd = _ArrayUnique(_Excel_RangeRead($xls_ystd, Default, $xls_ystd.ActiveSheet.Usedrange.Columns("C:C")))
		Local $a_td
		$a_td = _Excel_RangeRead($xls_td, Default, $xls_td.ActiveSheet.Usedrange.Columns("B:B"))
		_Excel_RangeWrite($xls_td, Default, "是否新增", "C1")

		;find today number in the yesterday array
		$m = UBound($a_td)
		$n = Floor($m / 2)
		$t = _Excel_RangeRead($xls_td, Default, "B2:B" & $n)
		Local $begin = TimerInit()
		Local $count = 0
		For $k = 0 To UBound($t) - 1
			_ArraySearch($a_ystd, $t[$k])
			If @error = 6 Then
				_Excel_RangeWrite($xls_td, Default, "Y", "C" & $k + 2)
				Local $dif_time = Int(TimerDiff($begin) / 1000)
				Local $dif_progress = Round((100 * ($k + 2) / $m), 1)
				If (Mod($dif_time, 10) = 0) Then
					If ($count = 0) Then
						$count = 20
						TrayTip("", "耗时: " & $dif_time & " 秒, 进度: " & $dif_progress & "%", 10)
					Else
						$count = $count - 1
					EndIf
				EndIf
			EndIf
		Next
		$t = _Excel_RangeRead($xls_td, Default, "B" & $n + 2 & ":B" & $m)
		For $k = 0 To UBound($t) - 1
			_ArraySearch($a_ystd, $t[$k])
			If @error = 6 Then
				_Excel_RangeWrite($xls_td, Default, "Y", "C" & $n + $k + 2)
				Local $dif_time = Int(TimerDiff($begin) / 1000)
				Local $dif_progress = Round((100 * ($n + $k + 2) / $m), 1)
				If (Mod($dif_time, 10) = 0) Then
					If ($count = 0) Then
						$count = 20
						TrayTip("", "耗时: " & $dif_time & " 秒, 进度: " & $dif_progress & "%", 10)
					Else
						$count = $count - 1
					EndIf
				EndIf
			EndIf
		Next
		Local $dif = TimerDiff($begin)
		TrayTip("", "全部耗时: " & Int($dif / 1000) & " 秒", 10)

		;run excel macro
		With $xls_td.ActiveSheet
			Dim $arr[] = [1]
			.Columns("A:C").Select
			.Columns("A:C").Subtotal(1, -4112, $arr, 0, 0, 0)
			.Columns("A:C").EntireColumn.AutoFit
			.Range("A1").Select
		EndWith

		;close xlsx
		_Excel_BookSave($xls_td)
		_Excel_BookClose($xls_td)
		_Excel_BookClose($xls_ystd)
		_Excel_Close($obj)

		;cleanup
		$tmp = FileDelete(@MyDocumentsDir & "\国内漫游号码" & $date_ystd & ".xlsx")

	EndIf
Next
