#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.0.0
	Author:         Brett Francis
	
	Script Function:
	Example showing usage of StringInStr.
	
#ce ----------------------------------------------------------------------------

MsgBox(0, "Length of string", 'The first occurrence of fox is at' & _
		StringInStr ("The quick brown fox jumps over the lazy dog", "fox") & _
		' characters from the left-hand side of the string')