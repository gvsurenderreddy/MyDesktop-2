;BEGIN SCRIPT----------------------------------------------
 ;simulates a TELNET connection

 Global $host, $port, $delay, $user, $pass, $sk, $ack

 $host = "132.151.136.123"
 $port = 23
 ; miliseconds to wait before sending/receiving something
 $delay = 300 ; compensates network/internet delays
 $user = ""
 $pass = ""

 TCPStartup()
 $sk = TCPConnect($host, $port)

 ;if invalid socket
 If $sk = -1 Then
 MsgBox(0, "", "Cannot connect")
 Exit
 EndIf

 ; message from device
 Sleep($delay)
 $ack = TCPRecv($sk, 150)
 TrayTip("", $ack, 10)

 ; verifying the correct answer
 If StringInStr($ack, "wl500gp login") >= 1 Then
 ; if the string is correct then we send user
 Sleep($delay)
 TCPSend($sk, $user & @CRLF)
 Sleep($delay)
 $ack = TCPRecv($sk, 80)
 TrayTip("", $ack, 10)
 ; and password
 Sleep($delay)
 TCPSend($sk, $pass & @CRLF)
 Sleep($delay)
 $ack = TCPRecv($sk, 80)
 TrayTip("", $ack, 10)
 Else
 MsgBox(0, "", "Cannot connect")
 Exit
 EndIf

 ; verifying the answer of the device (the prompt that it returns after receiving user and password)
 If StringInStr($ack, "root]$") = 0 Then ; attention, this string is specific
 MsgBox(0, "Error", "Access denied")
 Exit
 EndIf

 ; now you can send some commands
 Sleep($delay)
 TCPSend($sk, "ps" & @CRLF)
 Sleep($delay)
 $ack = TCPRecv($sk, 2000)
 MsgBox(0,"Running processes", $ack)

 TCPCloseSocket($sk)
 TCPShutdown()
 Exit
 ;END SCRIPT----------------------------------------------