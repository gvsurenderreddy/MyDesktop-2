#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing use of StringTrimLeft and StringTrimRight.
	
#ce ----------------------------------------------------------------------------
$string = "The quick brown fox jumps over the lazy dog"

MsgBox (0, "20 characters starting from character 10", StringMid ($string, 10, 20))

$brownpos = StringInStr ($string, "brown")
$overpos = StringLen ($string) - StringInStr ($string, "over")

MsgBox (0, "String between brown and over", StringMid	 ($string, $brownpos, $overpos))