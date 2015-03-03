#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing use of StringSplit
	
#ce ----------------------------------------------------------------------------
$string = "The quick brown fox jumps over the lazy dog"
$aReturn = StringSplit ($string, " ")
For $i = 1 to $aReturn[0]
	MsgBox (0, $i, $aReturn[$i])
Next