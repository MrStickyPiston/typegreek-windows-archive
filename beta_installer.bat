@echo off
title TypeGreek installer

if not exist "%UserProfile%\.typegreek_beta" mkdir %UserProfile%\.typegreek_beta

cd %UserProfile%\.typegreek_beta
del -f typegreek_EN.ahk
del -f typegreek_NL.ahk

del -f AutoHotkeyU32.exe
del -f AutoHotKeyU64.exe

del -f "TypeGreek Windows Beta 32 bit.bat"
del -f "TypeGreek Windows Beta 64 bit.bat"

del -f create_shortcut.vbs

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGreek_EN.ahk" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGrieks_NL.ahk" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_32_bit.bat" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_64_bit.bat" -o "TypeGreek Windows Beta 64 bit.bat"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/create_shortcut.vbs" -o "create_shortcut.vbs"

cd %AppData%\Microsoft\Windows\Start Menu\Programs
del "TypeGreek Windows Beta 32 Bit.lnk"
del "TypeGreek Windows Beta 64 Bit.lnk"

start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows Beta 32 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat"
start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows Beta 64 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat"

cd %UserProfile%\Desktop
del "TypeGreek Windows Beta 32 Bit.lnk"
del "TypeGreek Windows Beta 64 Bit.lnk"

start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows Beta 32 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat"
start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows Beta 64 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat"

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_beta_updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/beta_updater.bat" -o TypeGreek_windows_beta_updater.bat

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows and AutoHotKey have been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

cd %UserProfile%\downloads