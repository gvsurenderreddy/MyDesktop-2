#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Array Examples
	
#ce ----------------------------------------------------------------------------
;Method 1
Dim $names[6]
$names[0] = "Alex" 
$names[1] = "Brett" 
$names[2] = "Nicholas" 
$names[3] = "Jos" 
$names[4] = "Michael" 
$names[5] = "George" 

;Method 2
Dim $names[6] = ["Alex", "Brett", "Nicholas", "Jos", "Michael", "George"  ]
MsgBox(0, "Name", $names[2])