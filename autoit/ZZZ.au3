#include <Excel.au3>
#include <Array.au3>
;~ #include <File.au3>

$oe = _ExcelBookOpen(@ScriptDir & "\q.xls")

$ar = _ExcelReadSheetToArray($oe)
_ArrayDisplay($ar)
_ExcelBookClose($oe)
;~ Dim $new_a[UBound($ar)]

;~ For $i = 1 To UBound($ar) - 1
;~ 	For $j = 1 To UBound($ar, 2) - 1
;~ 		$new_a[$i] = $new_a[$i] & " " & $ar[$i][$j]
;~ 	Next
;~ Next

;~ _ArrayDisplay($new_a)


$sFile = FileOpen(@ScriptDir & "\Test.txt", 1)
;~ $hf = FileOpen($sFile)
;~ _FileWriteFromArray($sFile, $new_a, 1, 0, " ")
;~ FileWrite($sFile,$ar)
;~ FileClose($hf)

For $i = 1 To UBound($ar) - 1
	$line = ""
	For $j = 1To UBound($ar, 2) - 1
		$line = $line & " " & $ar[$i][$j]
	Next
;~ 	MsgBox(0, "", $line)
	FileWriteLine($sFile, $line)
Next

FileClose($sFile)

