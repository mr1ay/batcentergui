        @echo off 
        cls 
        call  navbar 
        
        type  .parse2.mr1ay
         
        batbox.exe /g 2  22 /c 0x0a /d "Page1"  
        set pagebutton= 2  22 9 22  10 22 17 22  2  22 9 22  10 22 17 22  2  22 9 22 
        set colorpagebutton= 0c    0c    0c    0c    0c   
        batbox.exe /g 10 22  /c 0x0a /d "Page2"  
        set pagebutton= 2  22 9 22  10 22 17 22  2  22 9 22  10 22 17 22  2  22 9 22  10 22 17 22 
        set colorpagebutton= 0c    0c    0c    0c    0c    0c   
        set colorline= 0 1 18 1 0 2 18 2 0 3 18 3 0 4 18 4
        set colorlinehover= 3f  3f  3f  3f  
        set countline= 4     
         
        
        GetInput /M %navbarloc%  %colorline%  %pagebutton%  /H %navbarhover%  %colorlinehover% %colorpagebutton%
               title %errorlevel%
               if %errorlevel% gtr 0 if %errorlevel% lss 5 call navbarevent %errorlevel%
               if %errorlevel% gtr 4 if %errorlevel% lss 9  call downloadd %errorlevel%&&goto :loop
               if %errorlevel% equ 9  echo.1>.selectpage.mr1ay && call page1.bat
               if %errorlevel% equ 10  echo.2>.selectpage.mr1ay && call page2.bat
                
                goto :loop
