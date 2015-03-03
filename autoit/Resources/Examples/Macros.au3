#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.2.12.1
	Author:         Brett Francis
	
	Script Function:
	Example program using Macros.
	
#ce ----------------------------------------------------------------------------
Dim $version = @AutoItVersion ; AutoIt Version
Dim $computername = @ComputerName ; Computer Name
Dim $OS = @OSVersion ; OS Version
Dim $text = ""; Output text for message box.

Switch $OS ; A Switch statement.  We are going to make the value returned by @OSVERSION more readable.
	Case "WIN_2008" 
		$OS = "Windows Server 2008" 
	Case "WIN_VISTA" 
		$OS = "Windows Vista" 
	Case "WIN_2003" 
		$OS = "Windows Server 2003" 
	Case "WIN_XP" 
		$OS = "Windows XP" 
	Case "WIN_2000" 
		$OS = "Windows 2000" 
	Case "WIN_NT4" 
		$OS = "Windows NT 4.0" 
	Case "WIN_ME" 
		$OS = "Windows ME" 
	Case "WIN_98" 
		$OS = "Windows 98" 
	Case "WIN_95" 
		$OS = "Windows 95" 
	Case Else
		$OS = "Unknown!" 
EndSwitch

$text = "AutoIt Version = " & $version & @CRLF ; The & character concentrates (joins) two values together.
$text &= "Computer Name = " & $computername & @CRLF ; The &= adds to the variable.  The same as doing $var = $var & "extra stuff"
$text &= "Operating System = " & $OS

MsgBox(0, "Computer Infomation", $text)