@echo off
title Invoker Game
setLocal enableDelayedExpansion

color 0B

set "s[1]=Cold Snap"
set "a[1]=qqq"
set "c[1]=9300"

set "s[2]=Ghost Walk"
set "a[2]=qqw"
set "c[2]=9210"

set "s[3]=Tornado"
set "a[3]=qww"
set "c[3]=9120"

set "s[4]=Ice Wall"
set "a[4]=qqe"
set "c[4]=9201"

set "s[5]=Forge Sprit"
set "a[5]=qee"
set "c[5]=9102"

set "s[6]=E.M.P."
set "a[6]=www"
set "c[6]=9030"

set "s[7]=Alacrity"
set "a[7]=wwe"
set "c[7]=9021"

set "s[8]=Chaos Meteor"
set "a[8]=wee"
set "c[8]=9012"

set "s[9]=Sun Strike"
set "a[9]=eee"
set "c[9]=9003"

set "s[10]=Deafening Blast"
set "a[10]=qwe"
set "c[10]=9111"

set /a longStreak=0

:start
set /a num=1
set /a rand=2
set invoke=asd
set /a streak=0
set /a charLoopNum=-1
set /a charLoopCount=0
set /a enteredCharLoop=0
set "x[0]=qwerty"
set /a comboNum=0
set /a oss=1
set /a isValid=0
cls

echo Welcome to the Invoker Game!
echo.
echo Here you can practice your Invoker skills.
echo.
echo Ditch LOL, play DOTA.
echo Are you ready to give Carl a try?
echo.
echo MENU
echo 1. List of skills
echo 2. Endless Game
echo 3. Basic Combos (Coming soon)
echo 4. Advanced Combos (Coming soon)
echo.
echo Enter 'q' to quit
set /p option=Choose an option(1-4): 

:checkOption
cls
if %option% == 1 (goto skillList)

if %option% == 2 (goto endlessGame)

if %option% == 3 (echo 3)

if %option% == 4 (echo 4)

if %option% == q (goto quit)
else (
goto start
)

:skillList
if %num% == 1 (
echo SKILL LIST:
echo.
echo !s[%num%]! - !a[%num%]!
set /a num+=1
goto skillList
) else (
if %num% LEQ 10 (
echo !s[%num%]! - !a[%num%]!
set /a num+=1
goto skillList
)
)
echo.
echo Press any key to go back to the menu
pause
goto start

:endlessGame
echo Here, a random spell will be displayed
echo Type out the combo and INVOKE it.
echo.
echo Combos does not have to be in order anymore.
echo.
echo EXAMPLE: Ghost Walk can be "qqwr" and "qwqr"
echo.
echo Press enter after each entry
echo Enter 'q' at anytime to exit to the main menu
echo Are you ready?
pause
cls
goto randInvoke

:randInvoke
set /a charLoopNum=-1
set /a charLoopCount=0
set /a enteredCharLoop=0
set "x[1]=qwerty"
set "x[2]=qwerty"
set "x[3]=qwerty"
set "x[4]=qwerty"
set /a comboNum=0
set /a oss=1
cls

echo Enter q to exit to the main menu
echo.
echo Streak: %streak%
echo Longest streak: %longStreak%
echo.
set /a rand=%random% %%10 +1
:echo %rand%
set invoke=!c[%rand%]!
echo !s[%rand%]!
set /p ans=Answer: 
goto invokeGame

:wrongClause
set /a charLoopNum=-1
set /a charLoopCount=0
set /a enteredCharLoop=0
set "x[1]=qwerty"
set "x[2]=qwerty"
set "x[3]=qwerty"
set "x[4]=qwerty"
set /a comboNum=0
set /a oss=1
echo.
echo WRONG Try again!
echo.
echo !s[%rand%]!
set /p ans=Answer:
goto invokeGame

:invokeGame
if %ans% == q (
if %longStreak% LSS %streak% (
set /a longStreak=%streak% 
)
goto start
)

if %enteredCharLoop%==0 (goto charLoop)

if %comboNum%==%invoke% (
set /a streak+=1
goto randInvoke
) else (
if %longStreak% LSS %streak% (
set /a longStreak=%streak%
)
set /a streak=0
cls
echo Enter q to exit to the main menu
echo.
echo Streak: %streak%
echo Longest streak: %longStreak%
goto wrongClause
)

:charLoop
set /a charLoopNum+=1
set /a charLoopCount+=1
call set "ans2=%%ans:~%charLoopNum%,1%%"
if defined ans2 (
::echo %ans2% 
set "x[%charLoopCount%]=%ans2%"
::echo array !x[%charLoopCount%]!
goto charLoop
)
if 6 LEQ %charLoopCount% (set /a comboNum+=1000)
goto calculate

:calculate
if %oss% LEQ 3 (
if !x[%oss%]! == q (set /a comboNum+=100)
if !x[%oss%]! == w (set /a comboNum+=10)
if !x[%oss%]! == e (set /a comboNum+=1)
set /a oss+=1
goto calculate
)

if !x[4]! == r (
set /a comboNum+=9000
)
::echo %comboNum%
::echo %invoke%
set /a enteredCharLoop+=1
goto invokeGame


:quit
echo Have a deafening day!
pause
