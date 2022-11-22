Set oWS = WScript.CreateObject("WScript.Shell")
sLinkFile = WScript.Arguments(0)
Set oLink = oWS.CreateShortcut(sLinkFile)
    oLink.TargetPath = WScript.Arguments(1)
 '  oLink.Arguments = ""
 '  oLink.Description = "MyProgram"   
 '  oLink.HotKey = "ALT+CTRL+F"
    oLink.IconLocation = "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/icon.ico"
 '  oLink.WindowStyle = "1"   
 '  oLink.WorkingDirectory = "C:\Program Files\MyApp"
oLink.Save