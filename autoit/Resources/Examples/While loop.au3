#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	While Loop example
	
#ce ----------------------------------------------------------------------------

$i = 0
While $i <= 10
	MsgBox(0, "Value of $i is:", $i)
	$i = $i + 1
WEnd
;An infinite loop
While 1
	ToolTip("Looping Still!")
WEnd