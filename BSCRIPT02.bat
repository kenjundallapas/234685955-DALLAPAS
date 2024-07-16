@echo off

:menu
cls
echo.
echo Welcome to the Shape Calculator!
echo Choose a Shape!
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
set /p shape="(1, 2, 3, 4): "

if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral
if "%shape%"=="4" goto exit

echo Please choose a number from 1-4.

goto menu


:circle
set /p radius="input the Circle's radius: "
set /a area=314 * %radius% * %radius% / 100
echo The area of the circle is %area%
pause
goto menu


:triangle
set /p a="length of side a: "
set /p b="length of side b: "
set /p c="length of side c: "

set /a s=(%a% + %b% + %c%) / 2
set /a area=s*(s-%a%)*(s-%b%)*(s-%c%)
set /a area=%area% ** 0.5

if %a%==%b% if %b%==%c% (
    echo This is an equilateral triangle!.
    goto triangle_end
)

if %a%==%b% (
    echo This an isosceles triangle!.
    goto triangle_end
)
if %a%==%c% (
    echo This is an isosceles triangle!.
    goto triangle_end
)
if %b%==%c% (
    echo This is an isosceles triangle!.
    goto triangle_end
)

echo This is a scalene triangle!.

:triangle_end
echo The area of the triangle is %area%
pause
goto menu


:quadrilateral
set /p length="Input the length of the Quadrilateral: "
set /p width="Input the width of the Quadrilateral: "
set /a area=%length% * %width%
echo The area of the quadrilateral is %area%

if %length%==%width% (
    echo This quadrilateral is a square.
) else (
    echo This quadrilateral is a rectangle.
)
pause
goto menu

:exit
pause
exit
