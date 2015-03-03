#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Branching Example using Select...EndSelect Statement
	
#ce ----------------------------------------------------------------------------

$var = 30

Select
	Case $var > 1 And $var <= 10
		MsgBox(0, "Example", "$var was greater than 1")
	Case $var > 10 And $var <= 20
		MsgBox(0, "Example", "$var was greater than 10")
	Case $var > 20 And $var <= 30
		MsgBox(0, "Example", "$var was greater than 20")
	Case $var > 30 And $var <= 40
		MsgBox(0, "Example", "$var was greater than 30")
	Case $var > 40
		MsgBox(0, "Example", "$var was greater than 40")
EndSelect