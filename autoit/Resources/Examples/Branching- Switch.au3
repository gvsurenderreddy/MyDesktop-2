#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Branching Example using Switch...EndSwitch Statement
	
#ce ----------------------------------------------------------------------------

Switch Int($var)
	Case 1 To 10
		MsgBox(0, "Example", "$var was greater than 1")
	Case 11 To 20
		MsgBox(0, "Example", "$var was greater than 10")
	Case 21 To 30
		MsgBox(0, "Example", "$var was greater than 20")
	Case 31 To 40
		MsgBox(0, "Example", "$var was greater than 30")
	Case Else
		MsgBox(0, "Example", "$var was greater than 40 or less or equal to 0")
EndSwitch