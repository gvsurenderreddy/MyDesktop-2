;Function for getting the max of 2 numbers.

;Declare the function and its paramaters
Func _MaxOfTwo ($nNumber1, $nNumber2, ByRef $vReturn)
	;Check if the numbers 1 and 2 are numbers.
	;If The number isn't then we will retun an error.
	;Because 1 = True and 0 = False, we will return
	;False and tell the user which number we errored on
	;by setting @Error to 1, and @Extended to the number.
	
	;Test Number 1
	If Not IsNumber ($nNumber1) Then Return SetError (1, 1, 0)
	;Test Number 2
	If Not IsNumber ($nNumber2) Then Return SetError (1, 2, 0)
	;If we've got this far then the numbers were actually numbers.
	;Now we will comapare them.
	If $nNumber1 > $nNumber2 Then ; Number 1 is greater
		$vReturn = $nNumber1
		Return SetError (0, 0, 1); Return True.
	ElseIf $nNumber2 > $nNumber1 Then ; Number 2 is greater
		$vReturn = $nNumber1
		Return SetError (0, 0, 1)
	ElseIf $nNumber1 = $nNumber2 Then ; They are equal
		$vReturn = $nNumber1
		;Return true but tell the user that the number was equal.
		Return SetError (3, 0, 1)
	EndIf
;Close the function
EndFunc

;Tests for the function
;Whats greater 100 or 30?
Dim $return = 0
$1 = 100
$2 = 30
$ret = _MaxOfTwo ($1, $2, $return)
MsgBox (0, "Test 1", 	"Function Returned = " & $ret & @CRLF & _
						"@Error was = " & @error & @CRLF & _
						"@Extended was = " & @extended & @CRLF & _
						"Larger Number was = " & $return)
;Whats greater?  110 or "string".  (Will error out)
Dim $return = 0
$1 = 100
$2 = "String"
$ret = _MaxOfTwo ($1, $2, $return)
MsgBox (0, "Test 2", 	"Function Returned = " & $ret & @CRLF & _
						"@Error was = " & @error & @CRLF & _
						"@Extended was = " & @extended & @CRLF & _
						"Larger Number was = " & $return)

;Whats greater?  110 or 110.  (Will return 110 but tell us that they were equal)
Dim $return = 0
$1 = 110
$2 = 110
$ret = _MaxOfTwo ($1, $2, $return)
MsgBox (0, "Test 3", 	"Function Returned = " & $ret & @CRLF & _
						"@Error was = " & @error & @CRLF & _
						"@Extended was = " & @extended & @CRLF & _
						"Larger Number was = " & $return)
						
