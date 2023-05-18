@echo off

set /p disk=Which disk do you want to copy/¦s¨ì­þ¤@ºÏºÐ?
for /F "usebackq delims=" %%i in (priority.txt) do md "%disk%:\%%i"
set work=%disk%:\%%i
for /F "usebackq delims=" %%i in (priority.txt) do (
cd  %~dp0
cd %%i
echo Has been change to %%i/¤w¤Á´«¨ì%%i
for /f "usebackq" %%s in (`dir /a:-d /b ^|find /i /c ".mp3" `) do (
        echo [101;44m COPYING %%i [0m
REM     pause
            for /L %%N in (1,1,%%s) do (  
            echo copying%%N/%%s
            if %%N GTR 99  (
            copy %%N*.* "%work%\%%N*.*"
            echo %%N* done 
            ) else if %%N GTR 9 ( 
                copy 0%%N*.* "%work%\0%%N*.*"
                echo %%N* done
            ) else ( 
                copy 00%%N*.* "%work%\00%%N*.*"
                echo %%N* done)
            )
    )
)
Echo/| CHOICE /N 2> nul & rem BEL
powershell -command "[console]::beep(500,300)"
echo [101;93m ALL DONE [0m
pause




