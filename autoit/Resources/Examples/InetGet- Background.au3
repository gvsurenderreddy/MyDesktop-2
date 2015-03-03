#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.4.0
	Author:         Brett Francis

	Script Function:
	Sample of downloading a file and making the script download it in the background.

#ce ----------------------------------------------------------------------------

$file = "http://www.signa5.com/LTSWA3/large.txt"
$save = @ScriptDir & "\Downloads\largefile.txt"

$iSize = InetGetSize ($file, 1)
;Download $file, save it to $save.  Force a reload (1) and make it download in the background (1).
$iHandle = InetGet ($file, $save, 1, 1)

Do
	ToolTip ("Downloaded " & InetGetInfo ($iHandle, 0) & "/" & $iSize & " bytes", 0, 0, "Download Status")
	Sleep (100)
Until InetGetInfo ($iHandle, 2)

InetClose ($iHandle)