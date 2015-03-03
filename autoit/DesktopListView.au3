#include <GUIListView.au3>
$h = WinGetHandle("[CLASS:Progman]")
$hwnd = ControlGetHandle($h, "", "SysListView321")
_GUICtrlListView_SetView($hwnd, 2)

;~ #include <Constants.au3>

;~ _GUICtrlListView_SetBkColor($hwnd, $CLR_MONEYGREEN)
;~ _GUICtrlListView_SetTextColor($hwnd, $CLR_BLACK)
;~ _GUICtrlListView_SetTextBkColor($hwnd, $CLR_MONEYGREEN)
