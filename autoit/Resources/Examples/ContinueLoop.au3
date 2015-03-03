#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	ContinueLoop example.
	
#ce ----------------------------------------------------------------------------

;Print all numbers from 1 to 10 except number 7
For $i = 1 To 10
	If $i = 7 Then ContinueLoop
	MsgBox(0, "The value of $i is:", $i)
Next