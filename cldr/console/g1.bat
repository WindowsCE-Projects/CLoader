@echo off
if NOT EXIST e:\wceldr GOTO fail
attrib e:\wceldr -h -s -r
copy %_flatreleasedir%\wceldrC e:\wceldr
attrib e:\wceldr +h +s +r
goto endit
:fail
echo.
echo Can't find wceldr
echo.
:endit