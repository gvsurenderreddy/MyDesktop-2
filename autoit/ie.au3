;打开IE并排列窗口

Opt("WinTitleMatchMode", 2)

;close all IE
While WinExists("[CLASS:IEFrame]")
	WinKill("[CLASS:IEFrame]")
WEnd

;CMD window
Run(@ComSpec & " /k ipconfig")
WinWait("C:\Windows\system32\cmd.exe")
WinMove("[ACTIVE]", "", 0, 0)

;IE-1
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe http://www.baidu.com")
WinWait("百度一下")
WinMove("[ACTIVE]", "", 440, 0, 400, 400)
Sleep(3000)
Send("北京时间{ENTER}")
Sleep(3000)

;IE-2
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe http://www.loopback.cn")
WinWait("oopback.cn")
WinMove("[ACTIVE]", "", 0, 450, 400, 400)
Sleep(3000)

;IE-3
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe http://tool.114la.com/live/myip")
WinWait("tool.114la.com")
WinMove("[ACTIVE]", "", 400, 440, 400, 400)
Sleep(3000)

;IE-4
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe https://www.apnic.net/apnic-info/whois_search/your-ip")
WinWait("APNIC")
WinMove("[ACTIVE]", "", 700, 0, 600, 780)
Send("{TAB 5}")
Send("{RIGHT 3}")
Sleep(5000)

;ptrsc
Sleep(5000)
Send("{PRINTSCREEN}")

;save pic
Run("mspaint")
WinWait("[CLASS:MSPaintApp]")
Send("^v")
;~ Send("{f12}")
;~ Send("!n")
;~ Send("pic")
;~ Send("!s")
;~ WinClose("[CLASS:MSPaintApp]")

