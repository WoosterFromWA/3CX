3CXFocus(paste:=0)
{
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

	Click, 280, 120									; clicks in textbox
	SendInput, ^a{Delete}							; selects all and clears text

	if paste
	{
		SendInput, ^v
	}

return
}

#SingleInstance, force

F12:: 												; F12 switches to 3CX and readies it for number entry (if on number page)

	3CXFocus()

return

F11::												; copy text in active window and paste into 3CX

	SendInput, {End}+{Home}^c

	Sleep, 500

	3CXFocus(1)

return