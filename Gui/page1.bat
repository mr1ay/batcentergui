        @echo off 
        cls 
        call  navbar 
        
        type  .parse1.mr1ay
         
        batbox.exe /g 2  22 /c 0x0a /d "Page1"  
        set pagebutton= 2  22 9 22  10 22 17 22  2  22 9 22 
        set colorpagebutton= 0c    0c    0c   
        batbox.exe /g 10 22  /c 0x0a /d "Page2"  
        set pagebutton= 2  22 9 22  10 22 17 22  2  22 9 22  10 22 17 22 
        set colorpagebutton= 0c    0c    0c    0c   
        set colorline= 0 1 18 1 0 2 18 2 0 3 18 3 0 4 18 4 0 5 18 5 0 6 18 6 0 7 18 7 0 8 18 8 0 9 18 9 0 10 18 10 0 11 18 11 0 12 18 12 0 13 18 13 0 14 18 14 0 15 18 15 0 16 18 16 0 17 18 17 0 18 18 18 0 19 18 19 0 20 18 20
        set colorlinehover= 3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  3f  
        set countline= 20     
         
        
        GetInput /M %navbarloc%  %colorline%  %pagebutton%  /H %navbarhover%  %colorlinehover% %colorpagebutton%
               title %errorlevel%
               if %errorlevel% gtr 0 if %errorlevel% lss 5 call navbarevent %errorlevel%
               if %errorlevel% gtr 4 if %errorlevel% lss 25  call downloadd %errorlevel%&&goto :loop
               if %errorlevel% equ 25  echo.1>.selectpage.mr1ay && call page1.bat
               if %errorlevel% equ 26  echo.2>.selectpage.mr1ay && call page2.bat
                
                goto :loop
