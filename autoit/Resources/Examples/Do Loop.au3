#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Do loop example.
	
#ce ----------------------------------------------------------------------------

$i = 0
Do
	MsgBox(0, "Value of $i is:", $i)
	$i = $i + 1
Until $i = 10