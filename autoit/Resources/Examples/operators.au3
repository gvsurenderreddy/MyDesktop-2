#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Examples for declaring, assigning and reading values from variables.  Also
	discusses constants
	
#ce ----------------------------------------------------------------------------

;Assigning
$number_one = 20
$number_two = 10
$number_three = 5
$string1 = "String" 
$string2 = "String Two" 
$number_three += $number_one
MsgBox(0, "Assignment", $number_three)
$number_three -= $number_one
MsgBox(0, "Assignment", $number_three)
$number_three *= $number_one
MsgBox(0, "Assignment", $number_three)
$number_three /= $number_one
MsgBox(0, "Assignment", $number_three)
$number_three &= $number_one
MsgBox(0, "Assignment", $number_three)

;Maths
$number_three = $number_one + $number_two
MsgBox(0, "Maths", $number_three)
$number_three = $number_one - $number_two
MsgBox(0, "Maths", $number_three)
$number_three = $number_one * $number_two
MsgBox(0, "Maths", $number_three)
$number_three = $number_one / $number_two
MsgBox(0, "Maths", $number_three)
$number_three = $number_one & $number_two
MsgBox(0, "Maths", $number_three)
$number_three = $number_one ^ 2
MsgBox(0, "Maths", $number_three)

;Comparision
If $number_one = 20 Then MsgBox(0, "Comparison", "Number 1 is 20!")
If $string1 == $string2 Then MsgBox(0, "Comparison", "Both strings are the same!")
If $number_two <> 20 Then MsgBox(0, "Comparison", "Number 2 is not 20!")
If $number_two > 5 Then MsgBox(0, "Comparison", "Number 2 is greater than 5!")
If $number_two >= 10 Then MsgBox(0, "Comparison", "Number 2 is greater or equal to 10!")
If $number_one < 25 Then MsgBox(0, "Comparison", "Number 1 is less than 25!")
If $number_one <= 20 Then MsgBox(0, "Comparison", "Number 1 is less or equal to 20!")