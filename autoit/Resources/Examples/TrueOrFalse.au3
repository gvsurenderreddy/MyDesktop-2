#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	WinWait example.
	
#ce ----------------------------------------------------------------------------

;Declaring a range of different values in different formats
$i_Value1 = 0
$i_Value2 = 0.0
$i_Value3 = 0.001
$i_Value4 = 1000
$i_Value5 = 20 - 25
$s_Value1 = ""
$s_Value2 = "0"
$s_Value3 = "0.00"
$s_Value4 = "toast"

;Show how AutoIt interprets the true and false.

If $i_Value1 Then
	MsgBox (0, "$i_Value1", $i_Value1 & "=TRUE" & @CRLF)
Else
	MsgBox (0, "$i_Value1", $i_Value1 & "=FALSE" & @CRLF)
EndIf
If $i_Value2 Then
	MsgBox (0, "$i_Value2", $i_Value2 & "=TRUE" & @CRLF)
Else
	MsgBox (0, "$i_Value2", $i_Value2 & "=FALSE" & @CRLF)
EndIf
If $i_Value3 Then MsgBox (0, "$i_Value3", $i_Value3 & "=TRUE" & @CRLF)
If $i_Value4 Then MsgBox (0, "$i_Value4", $i_Value4 & "=TRUE" & @CRLF)
If $i_Value5 Then MsgBox (0, "$i_Value5", $i_Value5 & "=TRUE" & @CRLF)
If $s_Value1 Then
	MsgBox (0, "$s_Value1", $s_Value1 & "=TRUE" & @CRLF)
Else
	MsgBox (0, "$s_Value1", $s_Value1 & "=FALSE" & @CRLF)
EndIf
If $s_Value2 Then MsgBox (0, "$s_Value2", $s_Value2 & "=TRUE" & @CRLF)
If $s_Value3 Then MsgBox (0, "$s_Value3", $s_Value3 & "=TRUE" & @CRLF)
If $s_Value4 Then MsgBox (0, "$s_Value4", $s_Value4 & "=TRUE" & @CRLF)
