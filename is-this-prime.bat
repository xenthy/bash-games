@echo off
title Is This Prime?
setLocal enableDelayedExpansion

color 0B

set ans=x
set /a streak=0
set /a iteration=1

:start
cls
set /a iteration=1
echo Your score: %streak%
set ans=x
set /a rand=%random% %% 1000
echo Number - %rand%
if %rand% == 1 (
set cal=1
goto initQn
)
goto primeCheck

:primeCheck
set /a iteration+=1
if %iteration% == %rand% goto initQn
set /a cal=%rand% %% %iteration%
if %cal% == 0 (
goto initQn
) else (
goto primeCheck
)

:initQn
if %cal% == 0 (
set ans=n
) else (
set ans=y
)
set input=chickenBackside
set /p input=Is this a prime number? (y/n)
goto inputCheck

:inputCheck
if %input% == y goto checkCorrect
if %input% == n goto checkCorrect
cls
echo Your score: %streak%
echo Number - %rand%
echo.
echo Invalid input
goto initQn

:checkCorrect 
echo.
if %input% == %ans% (
echo Correct!
set /a streak +=1
) else (
echo Wrong!
if %cal% == 0 (
echo %rand% can be divided by %iteration%
) else (
echo %rand% is a prime number
)
)
pause
goto start
