@echo off
title TypeGreek installer

if not exist "%UserProfile%\.typegreek" mkdir %UserProfile%\.typegreek

cd %UserProfile%\.typegreek
del -f typegreek_EN.exe
del -f typegreek_NL.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGreek_EN.exe?raw=true" -o typegreek_EN.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGrieks_NL.exe?raw=true" -o typegreek_NL.exe

cd %AppData%\Microsoft\Windows\Start Menu\Programs\
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (EN).lnk'); $S.TargetPath = '%UserProfile%\.typegreek\typegreek_EN.exe'; $S.Save()"
powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (NL).lnk'); $S.TargetPath = '%UserProfile%\.typegreek\typegreek_NL.exe'; $S.Save()"

cd %UserProfile%\Desktop
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%UserProfile%\Desktop\TypeGreek Windows (EN).lnk'); $S.TargetPath = '%UserProfile%\.typegreek\typegreek_EN.exe'; $S.Save()"
powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%UserProfile%\Desktop\TypeGreek Windows (NL).lnk'); $S.TargetPath = '%UserProfile%\.typegreek\typegreek_NL.exe'; $S.Save()"

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/updater.bat" -o TypeGreek_windows_updater.bat

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows has been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

cd %UserProfile%\downloads
