#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         None
	
	Script Function:
	Hello World Example with some extended examples
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;Basic Example
MsgBox(0, "Tutorial", "Hello World!")

;Extended Work
MsgBox(18, "Tutorial", "Hello World!"); Abort, Retry, Ignore with Stop Icon
MsgBox(32, "Tutorial", "Hello World!"); Normal message box with exclamation icon.
MsgBox(12345, "Tutorial", "Hello World!") ; A message box with and invalid flag.  This will NOT display.