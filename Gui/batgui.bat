	@echo off
		Setlocal enabledelayedexpansion
		if "%1"==":startup"   goto :startup 

		mode 50,27
		color f

		Set "path=%path%;%cd%;%cd%\Gui" 
		set file=%0 

		set colorline=
		set colorlinehover=
		set pagebutton=
		set w=8
		set /p version=<_version.mr1ay
		title Batchman Gui v:%version%
		 
		echo.1>_selectpage.mr1ay
	:startup
		call _allcountline.bat
 		set errorlevel=
	:batgui
		cls 
		set /p selectpage=<_selectpage.mr1ay
		set /a selectpage=%selectpage%*1 

		if not exist page%selectpage%.bat   call batcenterupdate.bat
		if     exist page%selectpage%.bat   call page%selectpage% 

			goto :batgui 
  
::<!--- -------------------------End--------------------------------- -->  