@echo off
::div_navbar

	batbox /g 0 0  /c 0xf0 /d "| BatCenter |"      
		batbox /c 0xf0 /d "  Gui |"     
		batbox /c 0xf0 /d "  Tools |"     
		batbox /c 0xf0 /d " About |"  
		batbox /c 0x07
		echo. 
	
	set navbarloc=  0 0 11 0   13 0 18 0   20 0 27 0   29 0 36 0 
	set navbarhover= 70 70 70 70


goto :eof