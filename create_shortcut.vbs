Set oWS = WScript.CreateObject("WScript.Shell")
sLinkFile = WScript.Arguments(0)
If WScript.Arguments.Count > 2 Then
    url = WScript.Arguments(2)
Else 
    url = WScript.arguments(1)
End If

Set oLink = oWS.CreateShortcut(sLinkFile)
    oLink.TargetPath = WScript.Arguments(1)
 '  oLink.Arguments = ""
 '  oLink.Description = "MyProgram"   
 '  oLink.HotKey = "ALT+CTRL+F"
    oLink.IconLocation = url
 '  oLink.WindowStyle = "1"   
 '  oLink.WorkingDirectory = "C:\Program Files\MyApp"
oLink.Save