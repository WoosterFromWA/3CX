^!\:: 											; ctrl+alt+\ switches to 3CX and readies it for number entry (if on number page)
#SingleInstance, force

if WinExist("ahk_exe 3CXWin8Phone.exe")
{
	winid := WinExist("ahk_exe 3CXWin8Phone.exe")
}

if winid
{
	WinActivate
	WinActivate
	WinWaitActive, , , 1
	If ErrorLevel
	{
		MsgBox, 8208, Error, WinWaitActive Timed Out, cancelling
		return
	}
} else {
	MsgBox, 8208, Not Running, 3CX is not running, cancelling
	return
}

Click, 225, 95									; clicks in textbox
SendInput, ^a{Delete}							; selects all and clears text

return