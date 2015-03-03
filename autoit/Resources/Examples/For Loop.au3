#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	For loop example.
	
#ce ----------------------------------------------------------------------------

; Example 1
For $i = 5 To 1 Step - 1
	MsgBox(0, "Count down!", $i)
Next
MsgBox(0, "", "Blast Off!")

; Example 2
; Using an Array
Dim $aArray[4]

$aArray[0] = "a" 
$aArray[1] = 0
$aArray[2] = 1.3434
$aArray[3] = "test" 

$string = ""
For $element In $aArray
	$string = $string & $element & @CRLF
Next

MsgBox(0, "For..IN Arraytest", "Result is: " & @CRLF & $string)