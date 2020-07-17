Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run """" & WScript.Arguments(0) & """" & sargs, 0, False