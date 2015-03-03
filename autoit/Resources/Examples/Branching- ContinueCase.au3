#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Branching using continue case.
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

$msg = ""
$szName = InputBox(Default, "Please enter a word.", "", " M", Default, Default, Default, Default, 10)
Switch @error
	Case 2
		$msg = "Timeout " 
		ContinueCase
	Case 1; Continuing previous case
		$msg &= "Cancellation" 
	Case 0
		Switch $szName
			Case "a", "e", "i", "o", "u" 
				$msg = "Vowel" 
			Case "QP" 
				$msg = "Mathematics" 
			Case "Q"  To "QZ" 
				$msg = "Science" 
			Case Else
				$msg = "Others" 
		EndSwitch
	Case Else
		$msg = "Something went horribly wrong." 
EndSwitch

MsgBox(0, Default, $msg)