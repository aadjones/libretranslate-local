Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

strDir    = fso.GetParentFolderName(WScript.ScriptFullName)
strTarget = strDir & "\run.bat"

strDesktop = WshShell.SpecialFolders("Desktop")
Set oShortcut = WshShell.CreateShortcut(strDesktop & "\LibreTranslate.lnk")
oShortcut.TargetPath      = strTarget
oShortcut.WorkingDirectory = strDir
oShortcut.Description      = "Start LibreTranslate local server"
oShortcut.WindowStyle      = 1
oShortcut.Save

MsgBox "Shortcut created on your Desktop!" & Chr(13) & "Double-click it to start LibreTranslate.", 64, "LibreTranslate"
