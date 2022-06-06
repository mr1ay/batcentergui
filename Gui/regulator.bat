@echo off
cls
echo regulator time

		set a=0
		setlocal enabledelayedexpansion


		for /l %%e in (0,1,10) do   (
			if exist .parse%%e.mr1ay del .parse%%e.mr1ay 
			if exist page%%e.bat     del page%%e.bat

)

 




		for /f "tokens=*" %%u in ( .batcenterpluginlist.mr1ay ) do (
			set /a a=!a!+1
			if !a! leq  21   set saver=.parse1.mr1ay
			if !a! geq  21   if !a! leq 41  set saver=.parse2.mr1ay
			if !a! geq  41   if !a! leq 61  set saver=.parse3.mr1ay
			if !a! geq  61   if !a! leq 81  set saver=.parse4.mr1ay
			if !a! geq  81   if !a! leq 101 set saver=.parse5.mr1ay
			if !a! geq 101   if !a! leq 121 set saver=.parse6.mr1ay
			if !a! geq 121   if !a! leq 141 set saver=.parse7.mr1ay
			if !a! geq 141   if !a! leq 161 set saver=.parse8.mr1ay
			if !a! geq 161   if !a! leq 181 set saver=.parse9.mr1ay
			if !a! geq 181   if !a! leq 201 set saver=.parse10.mr1ay
			echo.%%u >>!saver!
			)	 
		 

		set count=0

		for /l %%e in (0,1,10) do   if exist .parse%%e.mr1ay (
			echo.%%e>.page_count.mr1ay
			for /f "usebackq" %%u in (".parse%%e.mr1ay") do set /a count=count+1 
			echo.set countline%%e= !count! >>.allcountline.bat &&set count=0
			)

		set count=0
 






	





 

 
	set /p countpage=<.page_count.mr1ay
	set /p selectpage=<.selectpage.mr1ay
	call .allcountline

	set countloop=0
	setlocal enabledelayedexpansion 

	:loop

		set /a countloop=!countloop!+1
		set realpage=page%countloop%.bat
		set countline=!countline%countloop%!  
 
		set colorline=
		set colorlinehover=
		echo.        @echo off >%realpage%
		echo.        cls >>%realpage%

		echo.        call  navbar >>%realpage%
		echo.        >>%realpage%
		echo.        type  .parse%countloop%.mr1ay>>%realpage%
		echo.        >>%realpage% 



   
  
 
 
	for /l %%e in (1,1,%countpage%) do (
		if %%e==1     set p1=2 && set m=batbox.exe /g !p1! 22 /c 0x0a /d "Page1"  
		if not %%e==1 set /a p1=!p1!+8 && set m=batbox.exe /g !p1! 22  /c 0x0a /d "Page%%e"  

		set /a p2=!p1!+7
		set pagebutton=!pagebutton! !p1! 22 !p2! 22 
		set colorpagebutton=!colorpagebutton! 0c   


		echo         !m!>>%realpage%

		echo         set pagebutton=!pagebutton!>>%realpage%
		echo         set colorpagebutton=!colorpagebutton!>>%realpage%
		)





		set countloop2=0
		:loop2
			set /a countloop2=!countloop2!+1 
			set colorline=!colorline! 0 %countloop2% 18 %countloop2%
			set colorlinehover=!colorlinehover! 3f 

			if %countloop2%==%countline% goto :break_loop2
			goto :loop2

			:break_loop2


		echo.        set colorline=!colorline!>>%realpage%
		echo.        set colorlinehover=!colorlinehover! >>%realpage%
		echo.        set countline=%countline% >>%realpage%
		echo.        >>%realpage% 
		echo.        >>%realpage%
		echo.        GetInput /M %%navbarloc%%  %%colorline%%  %%pagebutton%%  /H %%navbarhover%%  %%colorlinehover%% %%colorpagebutton%%>>%realpage%
		echo.               title %%errorlevel%%>>%realpage%
		echo.               if %%errorlevel%% gtr 0 if %%errorlevel%% lss 5 call navbarevent %%errorlevel%%>>%realpage%

		set /a limitline=5+%countline%

		echo.               if %%errorlevel%% gtr 4 if %%errorlevel%% lss %limitline%  call downloadd %%errorlevel%%^&^&goto :loop>>%realpage%
 

  
		set countloop3=0
		:loop3
			set /a countloop3=!countloop3!+1 

			echo.               if %%errorlevel%% equ %limitline%  echo.!countloop3!^>.selectpage.mr1ay ^&^& call page!countloop3!.bat>>%realpage%
			set /a limitline=1+%limitline%
			if %countloop3%==%countpage% goto :break_loop3
			goto :loop3

			:break_loop3






		echo.                >>%realpage%
		echo.                goto :loop>>%realpage%


::pause
 
 

			::if %errorlevel% == 25 echo.1>.selectpage.mr1ay  && call batgui :startup
			::if %errorlevel% == 26 echo.2>.selectpage.mr1ay  && call batgui :startup
			::if %errorlevel% geq 27  set errorlevel=0 













::<!---  End  of  Regulator --->

		if %countloop%==%countpage% goto break_loop
		goto :loop
:break_loop
goto :eof