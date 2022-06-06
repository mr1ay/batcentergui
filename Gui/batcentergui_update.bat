@echo off
 
if exist Gui     rmdir /Q /S Gui
ren new Gui

timeout /t 1
call batgui u
goto :eof
