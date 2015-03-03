#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	GUI OnEvent example.
	
#ce ----------------------------------------------------------------------------

;Required Includes.
#include <GUIConstantsEx.au3> ;Constants for GUI Events
#include <EditConstants.au3> ;Edit constants.  Required for the styles we used.
;Declare any variables/opts.
Opt("GUIOnEventMode", 1);We need this otherwise our GUI will not be OnEvent Mode.

;Create the GUI
$hGUI = GUICreate("Learning to script with AutoIt V3- Example GUI", 400, 300)
;Create a lable
;Below you can see & _.  It allows us to split up lines, making it easier to read.
$hLabel = GUICtrlCreateLabel("This is a label control.  Type text into the Input control" & _
		"and press the button to set the text of the edit control.  " & _
		"Type /SPECIAL in the edit for a special message!", 10, 10, 380, 40)
;Create an input control
$hInput = GUICtrlCreateInput("This is an Input Control.  Type stuff here!", 10, 50, 380, 20)
;Create an edit control
$hEdit = GUICtrlCreateEdit("This is the edit control.  We used a style to make it multiline and read-only!!", 10, 80, 380, 170, BitOR($ES_MULTILINE, $ES_READONLY))
;Create the button
$hButton = GUICtrlCreateButton("Press me!", 320, 260, 70, 25)
GUICtrlSetOnEvent($hLabel, "LabelFunction") ; Set the label control's function
GUICtrlSetOnEvent($hButton, "ButtonFunction") ; The button's function
GUISetOnEvent($GUI_EVENT_CLOSE, "ExitGUI") ; What function to call when we try close the GUI
;Show the GUI.  We need this line, or our GUI will NOT be displayed!
GUISetState(@SW_SHOW)

;Endless While loop to keep the GUI Open
While 1
	Sleep(10); So we don't use heaps of CPU
WEnd

Func LabelFunction()
	MsgBox(0, "Hello!", "We have clicked on the label!"); Say Hello
EndFunc   ;==>LabelFunction

Func ButtonFunction()
	$read = GUICtrlRead($hInput)
	;Check to see if we have /SPECIAL using StringInStr.
	If StringInStr($read, "/SPECIAL") Then
		;We have it, display the message.
		MsgBox(0, "WOW!", "This is a special message!")
	Else
		;Get Existing Data of edit
		$read2 = GUICtrlRead($hEdit)
		$text = $read2 & @CRLF & $read ; Join the existing and the new text seperated by a line.
		GUICtrlSetData($hEdit, $text) ; Set the edit control to have our new data!
		GUICtrlSetData($hInput, "");Reset the data of the input.
	EndIf
EndFunc   ;==>ButtonFunction

Func ExitGui ()
	Exit ; Exit the program
EndFunc