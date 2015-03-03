#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	WinWait example.
	
#ce ----------------------------------------------------------------------------

Run('Calc')
WinWait('Calculator')
MsgBox(64, 'Functions', 'Your Calculator is showing.')