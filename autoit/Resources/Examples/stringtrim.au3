#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing use of StringTrimLeft and StringTrimRight.
	
#ce ----------------------------------------------------------------------------
$string = "The quick brown fox jumps over the lazy dog"

;Trims the first 12 characters from the left-hand side of the string
MsgBox (0, "First 12 characters", StringTrimLeft ($string, 12))

;Trims the first word
$location = StringInStr ($string, " ")
MsgBox (0, "First word", StringTrimLeft ($string, $location))

;Trims the last 2 words
$location =  StringLen ($string) - StringInStr ($string, " ", 0, -2)
MsgBox (0, "Last word", StringTrimRight ($string, $location))