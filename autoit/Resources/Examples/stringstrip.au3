#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing use of StringStripWS and StringStripCR
	
#ce ----------------------------------------------------------------------------
$string = "The" & @CR & "quick" & @CR & "brown" & @CR & "fox" & @CR & "jumps" & @CR & "over" & @CR & "the" & @CR & "lazy" & @CR & "dog"
$string2 = "The       quick       brown       fox       jumps       over       the       lazy       dog            "

MsgBox (0, "", StringStripCR ($string))
MsgBox (0, "", StringStripWS ($string2, 4))

ClipPut(StringStripWS ($string2, 4))