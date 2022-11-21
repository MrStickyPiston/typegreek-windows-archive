@echo off
title TypeGreek installer

if not exist "%UserProfile%\.typegreek" mkdir %UserProfile%\.typegreek

cd %UserProfile%\.typegreek
del -f typegreek_EN.exe
del -f typegreek_NL.exe
del -f create_shortcut.vbs

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGreek_EN.exe?raw=true" -o typegreek_EN.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGrieks_NL.exe?raw=true" -o typegreek_NL.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/experimental/create_shortcut.vbs" -o "create_shortcut.vbs"


cd %AppData%\Microsoft\Windows\Start Menu\Programs
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

start %UserProfile%\.typegreek\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (EN).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"
start %UserProfile%\.typegreek\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (NL).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"

cd %UserProfile%\Desktop
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

start %UserProfile%\.typegreek\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows (EN).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"
start %UserProfile%\.typegreek\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows (NL).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/updater.bat" -o TypeGreek_windows_updater.bat

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows has been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

cd %UserProfile%\downloads
