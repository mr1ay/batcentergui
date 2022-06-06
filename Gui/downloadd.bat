	@echo off
	set loc=%1
 
	setlocal enabledelayedexpansion

	set /a loc=!loc!-4
	set /p sp=<.selectpage.mr1ay
	set /a sp=%sp%*1 
	call .allcountline.bat
 	set countline=!countline%sp%! 

	::if "%loc%"== "%countline%" goto :eof
 	cls

	set aa=0  
	for /f "tokens=*" %%u in ('readline  ".parse!sp!.mr1ay" %loc%') do set line=%%u

		set line=%line:~0,5%
		set line=%line:[= %
		set line=%line:]= %
		set line=%line:-= % 

		echo  %line%

	cd..
	call bat install %line%
	start explorer.exe  %localappdata%\BatCenter\plugins
	cd gui 

goto :eof

 