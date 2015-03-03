#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         None
	
	Script Function:
	Simple notepad example with example to send multiple lines.
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Run("notepad.exe")
WinWaitActive("Untitled - Notepad")
Send("This is some text.")
WinClose("Untitled - Notepad")
WinWaitActive("Notepad", "Do you want to save")
Send("!n")
#cs ----------------------------------------------------------------------------
	Extended Example
#ce ----------------------------------------------------------------------------
Run("notepad.exe")
WinWaitActive("Untitled - Notepad")
Send("This is some text." & @CRLF & "This is on a new line!")
WinClose("Untitled - Notepad")
WinWaitActive("Notepad", "Do you want to save")
Send("!n")