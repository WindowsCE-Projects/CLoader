@echo off
set drv=f:
if NOT EXIST %drv%\wceldr GOTO fail
attrib %drv%\wceldr -h -s -r
copy %_flatreleasedir%\wceldrS %drv%\wceldr
attrib %drv%\wceldr +h +s +r
goto endit
:fail
echo.
echo Can't find wceldr
echo.
:endit