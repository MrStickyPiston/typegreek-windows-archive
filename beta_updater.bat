@echo off
title TypeGreek Beta updater
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

rem Delete and redownload files

cd %UserProfile%\.typegreek_beta
del -f typegreek_EN.ahk
del -f typegreek_NL.ahk

del -f AutoHotkeyU32.exe
del -f AutoHotKeyU64.exe

del -f "TypeGreek Windows Beta 32 bit.bat"
del -f "TypeGreek Windows Beta 64 bit.bat"

del -f icon.ico

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGreek_EN.ahk" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGrieks_NL.ahk" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_32_bit.bat" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_64_bit.bat" -o "TypeGreek Windows Beta 64 bit.bat"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/icon.ico?raw=True" -o "icon.ico"

rem Replenish self

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/beta_updater.bat" > TypeGreek_windows_beta_updater.bat

exit
