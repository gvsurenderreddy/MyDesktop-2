#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.4.0
	Author:         Brett Francis

	Script Function:
	Sample of downloading a file and making the script download it in the background.

#ce ----------------------------------------------------------------------------

$file = "http://www.signa5.com/LTSWA3/PASSWORD/file.txt"
$save = @ScriptDir & "\Downloads\password.txt"

;Download $file, save it to $save.  Force a reload (1) and make sure it waits until it is completed (0).
InetGet ($file, $save, 1, 0)
MsgBox (0, "", @error)

$file = "http://user:pass@www.signa5.com/LTSWA3/PASSWORD/file.txt"
$save = @ScriptDir & "\Downloads\password.txt"

;Download $file, save it to $save.  Force a reload (1) and make sure it waits until it is completed (0).
InetGet ($file, $save, 1, 0)
MsgBox (0, "", @error)

