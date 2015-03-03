#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Examples for declaring, assigning and reading values from variables.  Also
	discusses constants
	
#ce ----------------------------------------------------------------------------

;Declaring
Dim $x, $y, $z ; Notice we can declare variables of the same scope on the same line if desired.
Global $RADIUS ; Global Variable
Local $_daysWorking ; Local Variable

;Assigning
$number = 123 ; Some Number
$string = "Some String with ""double"" and 'single' quotes"    ; A string
$Return = MsgBox(0, "", "The return value should be 1"); The return value of a function

$Var1 = 'West Richmond' 
$Var2 = $Var1

;Accessing Variables
$MyFlag = 0
$MyTitle = "This is a Title" 
$MyMsg = "Hello there!" 
MsgBox($MyFlag, $MyTitle, $MyMsg)

;Constants
Dim Const $Debugging = True
Global Const $FLAG1 = 543210
Local Const $PI = 3.14159