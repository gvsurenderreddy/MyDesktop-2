;Question 2
For $i = 1 To 5
	MsgBox (0, "", $i)
Next

;Question 3
$i = 0
While 1
	$i += 1
	If $i = 6 Then ExitLoop
	MsgBox (0, "", $i)
WEnd

;Question 6

;You loop can be for, while or do.  It is up to you.  
;This example shows usage with a While loop.

$i = 0
While 1
	$i += 1
	If $i = 4 Then ContinueLoop; 1 Mark
	If $i = 9 Then ContinueLoop; 1 Mark
	If $i = 11 Then ExitLoop; 1 Mark
	MsgBox (0, "", $i)
WEnd