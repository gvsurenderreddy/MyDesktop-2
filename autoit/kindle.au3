
#include <File.au3>
#include <Array.au3>

Local $Driver = IniRead(@ScriptDir & "\kindle.ini", "Settings", "Driver", "H:")
Local $Path = $Driver & "\documents\"
Local $Mode = StringUpper(IniRead(@ScriptDir & "\kindle.ini", "Settings", "VerboseMode", "False"))

Local $DirList = _FileListToArray($Path, "*", 2)
If @error = 1 Then
	MsgBox(0, "", "No dir!")
	Exit
EndIf
If $Mode == "TRUE" Then
	_ArrayDisplay($DirList, "Dir List:")
EndIf

Local $FileList = _FileListToArray($Path, "*", 1)
If @error = 4 Then
	MsgBox(0, "", "No file!")
	Exit
EndIf
If $Mode == "TRUE" Then
	_ArrayDisplay($FileList, "File List:")
EndIf

For $i = 1 To $FileList[0]
	Local $szDrive, $szDir, $szFName, $szExt
	Local $FileName = _PathSplit($FileList[$i], $szDrive, $szDir, $szFName, $szExt)
	$FileList[$i] = $FileName[3] & ".sdr"
Next

For $j = 1 To $DirList[0]
	_ArraySearch($FileList, $DirList[$j])
	If @error And $DirList[$j] <> "Dictionaries" Then
		DirRemove($Path & "\" & $DirList[$j], 1)
	EndIf
Next

|
If $Mode == "TRUE" Then
	Local $newDirList = _FileListToArray($Path, "*", 2)
	If @error = 1 And $newDirList <> "dictionaries" Then
		MsgBox(0, "", "All dir deleted!")
		Exit
	EndIf
	MsgBox(0, "Result", "Deleted " & $DirList[0] - $newDirList[0] & " Dirs!")
EndIf
