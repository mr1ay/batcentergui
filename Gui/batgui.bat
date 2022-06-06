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
		set /p version=<.version.mr1ay
		title Batchman Gui v:%version%
		 
		echo.1>.selectpage.mr1ay
	:startup
		call .allcountline.bat
 		set errorlevel=
	:batgui
		cls 
		set /p selectpage=<.selectpage.mr1ay
		set /a selectpage=%selectpage%*1 

		if not exist page%selectpage%.bat   call batcenterupdate.bat
		if     exist page%selectpage%.bat   call page%selectpage% 

			goto :batgui 
 


::<!--- -------------------------Functions--------------------------------- -->

  
	call pagebutton
	goto :eof


:nothing
	for /l %%e in (1,1,%countpage%) do (
		if %selectpage%==%%e     set selectbuttoncolor=0b
		if not %selectpage%==%%e set selectbuttoncolor=0a

		if %%e==1     set p1=2&& set m=batbox /g !p1! 22 /c 0x!selectbuttoncolor! /d "Page1"  
		if not %%e==1 set /a p1=!p1!+8 && set m=batbox /g !p1! 22 /c 0x!selectbuttoncolor! /d "Page%%e"  

		set /a p2=!p1!+7
		set pagebutton=!pagebutton! !p1! 22 !p2! 22 
		set colorpagebutton=!colorpagebutton! 0c   


		if %%e==1 echo !m!>pagebutton.bat
		if not %%e==1 echo !m!>>pagebutton.bat
		)

	echo set pagebutton=%pagebutton%>>pagebutton.bat
	echo set colorpagebutton=%colorpagebutton%>>pagebutton.bat