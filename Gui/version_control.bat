	@echo off
	cls
	if "%1" == "u" goto u
	FOR /f "tokens=3" %%i in ('netsh wlan show interface ^|findstr /i "State"') do set wifi=%%i 
	if not %wifi% == connected echo not found internet && echo please open wifi && goto end 

	if exist   _newversion.mr1ay    del _newversion.mr1ay
	wget  -O   _newversion.mr1ay    https://github.com/mr1ay/batcentergui/blob/main/Gui/_version.mr1ay  
 
	setlocal enabledelayedexpansion
	for /f "tokens=*" %%u in ( 'findstr "LC1" "_newversion.mr1ay"' ) do  set line=%%u  


	:loop
		if not "!line:~0,1!" == "v" set line=!line:~1! 
		if     "!line:~0,1!" == "v"  goto :end_loop 
		goto :loop

	:end_loop  
		set new=!line! 
		set new=!new: =!
  
		set new=!new:^</td^>=!  
		set newversion=!new!
		set newversion=!newversion: =!
 
		set /p oldversion=<_version.mr1ay
		::set oldversion=!oldversion: =!

		echo.		
		echo oldversion==/!oldversion!/
		echo newversion==/!newversion!//

		if not !oldversion! == !newversion! echo please update batcenter gui 
		if     !oldversion! == !newversion! echo batcenter gui is up to date &&goto :end
 
		if exist   _newversion.mr1ay    del _newversion.mr1ay



	wget  -O  batgui.zip https://github.com/mr1ay/batcentergui/archive/refs/heads/main.zip

	7z x batgui.zip >nul
	if exist batgui.zip  del batgui.zip

	ren  batcentergui-main\Gui  new 
cd..
move Gui\batcentergui-main\new %cd%
move Gui\batcentergui_update.bat %cd%
timeout /t 1
start %cd%\batcentergui_update.bat
exit

:end
goto :eof
:u
call batgui.bat
goto :eof
