#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Branching Example using If...EndIf Statement
	
#ce ----------------------------------------------------------------------------

$var = 20

If $var > 10 Then
	MsgBox(0, "Example", "$var was greater than 10!")
Else
	MsgBox(0, "Example", "$var was less than 10")
EndIf