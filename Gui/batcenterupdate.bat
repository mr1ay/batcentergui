@echo off
	cls
	Batbox /c 0x0e /d "---------------------------"
	echo(
	Batbox /c 0x0e /d "update controlling for batcenter"
	echo(
	Batbox /c 0x0e /d "---------------------------"  
	Batbox /c 0x0b
	echo(
	echo.
 
	for /l %%e in (0,1,10) do   if exist _parse%%e.mr1ay     del  _parse%%e.mr1ay



	if exist _batcenterpluginlist.mr1ay   del _batcenterpluginlist.mr1ay
	if exist _page_count.mr1ay   del _page_count.mr1ay
	if exist _allcountline.bat   del _allcountline.bat 


	cd..
	call bat.bat Update

	cd gui 
	echo. 
	Batbox /c 0x0a /d "---------------------------"
	echo(
	Batbox /c 0x0a /d "update controlled"
	echo(
	Batbox /c 0x0a /d "---------------------------" 
	Batbox /c 0x0b
	echo(
	echo.
 
	timeout /t 5  

	cd..
	call bat.bat List > Gui\_batcenterpluginlist.mr1ay

	cd gui 
	call regulator


		goto :eof
