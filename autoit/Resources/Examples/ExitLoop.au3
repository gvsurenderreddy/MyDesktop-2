#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	ExitLoop example.
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

$sum = 0
While 1 ;use infinite loop since ExitLoop will get called
	$ans = InputBox("Running total=" & $sum, _
			"   Enter a positive number.  (A negative number exits)")
	If $ans < 0 Then ExitLoop
	$sum = $sum + $ans
WEnd
MsgBox(0, "The sum was", $sum)