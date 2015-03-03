#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing alternative usage of StringLeft and StringRight
	
#ce ----------------------------------------------------------------------------
$string = "The quick brown fox jumps over the lazy dog"

;Returns the first 12 characters from the left-hand side of the string
MsgBox (0, "First 12 characters", StringLeft ($string, 12))

;Returns the first word
$location = StringInStr ($string, " ")
MsgBox (0, "First word", StringLeft ($string, $location))

;Returns the last 2 words
$location =  StringLen ($string) - StringInStr ($string, " ", 0, -2)
MsgBox (0, "Last word", StringRight ($string, $location))