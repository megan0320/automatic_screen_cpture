set count=1

:Again

timeout /t 2 /nobreak

adb shell input keyevent KEYCODE_MENU
 :: Menu


timeout /t 2 /nobreak
adb shell input keyevent KEYCODE_ENTER
 :: Enter

timeout /t 3 /nobreak
 :: wait

timeout /t 2 /nobreak
adb shell input keyevent KEYCODE_ENTER
 :: Enter

timeout /t 3 /nobreak
 :: wait

timeout /t 2 /nobreak
adb shell input keyevent KEYCODE_ENTER
 :: Enter


timeout /t 10 /nobreak
 :: Scaning

adb shell input keyevent KEYCODE_ENTER
 :: Enter
 
 timeout /t 15 /nobreak
 :: Scaning
 
echo %date%
set d=%date:~0,4%%date:~5,2%%date:~8,2%
echo %time%
set t=%time:~0,2%%time:~3,2%%time:~6,2%


adb shell screencap -p /storage/self/primary/DCIM/%d%-%t%_count%count%.png

timeout /t 2 /nobreak

adb pull /storage/self/primary/DCIM/%d%-%t%_count%count%.png

adb shell rm /storage/self/primary/DCIM/%d%-%t%_count%count%.png


set /a count=count+1
if not %count%== 0 goto Again
pause
