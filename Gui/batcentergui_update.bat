@echo off
 
if exist Gui     rmdir /Q /S Gui
ren new Gui

timeout /t 1
cd Gui
start version_control.bat u
exit