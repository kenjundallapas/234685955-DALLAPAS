@echo off
setlocal enabledelayedexpansion

:goBack

echo To start if off, type "C:\Users\PC Name\Desired Folder"

set /p dir="Enter the source directory: "
if not exist "%dir%" (
    echo Folder does not exist. 
    goto :goBack
)

:goBackDest

set /p dest="Enter the destination directory: "
if not exist "%dest%" (
    echo Folder does not exist.
    goto :goBackDest
)


set "archive=%dest%\archive"
if not exist "%archive%" (
    mkdir "%archive%"
)

cd /d "%dir%"

forfiles /m *.txt /d -365 /c "cmd /c move @file \"%archive%\""


echo.
echo =======================================================
echo.

echo Here are the text files sorted by date/time:
for /f "delims=" %%i in ('dir /b /o:d *.txt') do (
    echo %%i
)

echo.
echo =======================================================
echo.

:fileLoop
dir

echo.
echo =======================================================
echo.

echo Enter the file from "%dir%"
echo to move to "%dest%",
set /p file="(or 'done' to finish): "

echo.
echo =======================================================
echo.

if /I "%file%"=="done" (
    echo Finished.
    goto :end
)
if not exist "%file%" (
    cls
    echo File does not exist.
    goto :fileLoop
)

move "%file%" "%dest%/archive"
goto :fileLoop

:end
echo Here are the files in the archive directory sorted by size:
for /f "tokens=*" %%A in ('dir /b /s /o:s "%archive%"') do (
    echo %%~nA %%~pA
)

echo.
echo =======================================================
echo.

:deleteLoop
echo.
echo -----------------------------------------------------------------------------
echo ("finish" if done or "repeat" to go prompt the source destination again.):
echo -----------------------------------------------------------------------------
echo.
set /p delete="Do you want to delete the old large files?  (Y/N): "
if /I "%delete%"=="Y" (
    for /R "%dest%/archive" %%F in (*.txt) do (
        if %%~zF GTR 1000000 (
            del /P "%%F"
        )
    )
    goto :deleteLoop
) else if /I "%delete%"=="N" (
    echo Files will not be deleted.
    goto :deleteLoop
) else if /I "%delete%"=="finish" (
    echo selected "finish"!.
    goto :finally
) 
else if /I "%delete%"=="repeat" (
    echo Going back.
    goto :goBack
)
else (
    echo Invalid input. Please try again.
    goto :deleteLoop
)
:finally
echo Done! 
pause