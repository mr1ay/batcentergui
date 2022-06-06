	@echo off
	title %errorlevel%

	if %1==1 goto div1
	if %1==2 goto div2
	if %1==3 goto div3
	if %1==4 goto div4

	goto :end

:div1
	cls
	call navbar
	batbox /g 1 1 /c 0xf6 /d "|-Update---|"
	batbox /g 1 2 /c 0xf3 /d "|-List-----|"
	batbox /g 1 3 /c 0xf0 /d "|-iList----|"
	batbox /g 1 4 /c 0xf4 /d "|-Reset----|"
	batbox /g 1 5 /c 0xfc /d "|-Resetall-|"
	batbox /g 1 6 /c 0xf0 /d "|----------|"
	batbox /c 0x0f 
	echo(



	set div1_loc= 1 1 12 1   1 2 12 2    1  3 12 3   1 4 12 4   1 5 12 5   1 6 12 6 
	set   black1= 0 7 50 27  13 1 50 6    

	getinput /m %navbarloc% %div1_loc% %black1%  /h  %navbarhover%    3f 3f 3f 3f 3f     f0 00 00  

		if %errorlevel% leq 4   goto div%errorlevel% 

		if %errorlevel% == 5   call batcenterupdate  && goto end
		if %errorlevel% == 6   cls && cd.. && call bat list      && timeout /t 5&& cd gui&& call batgui :startup
		if %errorlevel% == 7   cls && cd.. && call bat ilist     && timeout /t 5&& cd gui&& call batgui :startup
		if %errorlevel% == 8   cls && cd.. && call bat reset     && cd gui&& call batgui :startup
		if %errorlevel% == 9   cls && cd.. && call bat Reset all && cd gui&& call batgui :startup
		if %errorlevel% == 10  rem nothing -_-

		if %errorlevel% == 11  goto :end
		if %errorlevel% == 12  goto :end
 
		goto :div1



 :div2
	cls
	call navbar
	batbox /g 12 1 /c 0xf6 /d "|-Update---|"
	batbox /g 12 2 /c 0xf3 /d "|-Edit-----|"
	batbox /g 12 3 /c 0xf0 /d "|-Version--|"
	batbox /g 12 4 /c 0xf0 /d "|----------|"
	batbox /c 0x0f 
	echo(


	set div2_loc= 12 1 23 1   12 2 23 2   12 3 23 3   12 4 23 4   
	set   black2= 0 1 11 4    24 1 50 4    0 5 50 27   
	getinput /m %navbarloc%    %div2_loc% %black2%    /h %navbarhover%    3f 3f 3f      f0 00 00 00
 
		if %errorlevel% leq 4   goto div%errorlevel% 

		if %errorlevel% == 5 echo not added           && goto end
		if %errorlevel% == 6 start notepad.exe batgui.bat && goto end
		if %errorlevel% == 7 call :version            && goto end
		if %errorlevel% == 8 rem nothing -_-

		if %errorlevel% geq 9   goto :end 
 		title %errorlevel%
		goto :div2

 
:div3
	cls
	call navbar
	batbox /g 19 1 /c 0xf6 /d "|-Cmd in---|"
	batbox /g 19 2 /c 0xf3 /d "|-Cmd out--|" 
	batbox /g 19 3 /c 0xf3 /d "|-Taskmgr--|" 
	batbox /g 19 4 /c 0xf3 /d "|-Envroment|" 
	batbox /g 19 5 /c 0xf3 /d "|----------|" 
	batbox /c 0x0f 
	echo(


	set div3_loc= 19 1 30 1   19 2 30 2    19 3 30 3    19 4 30 4   19 5 30 5 
	set   black3=  0 1 18 5   31 1 50 5    0 6 50 27  
	getinput /m  %navbarloc%  %div3_loc%  %black3%   /h %navbarhover%    3f 3f 3f 3f     f0 00 00 00
 
		if %errorlevel% leq 4   goto div%errorlevel% 

		if %errorlevel% == 5  cls  && cmd.exe    
		if %errorlevel% == 6  start cmd.exe && goto :end
		if %errorlevel% == 7  start taskmgr.exe && goto :end
		if %errorlevel% == 8  start rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,3 && goto :end 
		if %errorlevel% == 9  rem nothing -_- 

		if %errorlevel% geq 10 goto :end 
 
		goto :div3
 
:div4
:version
	cls
	set /p version=<.version.mr1ay
	echo. version:%version%
	echo. writed by mr1ay	
	echo. writed for bat developers	

	timeout /t 5
	goto :eof


:end
set errorlevel=
call batgui :startup

	goto :eof