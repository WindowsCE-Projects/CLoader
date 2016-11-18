@echo off
if NOT EXIST y:\wceldr GOTO fail
attrib y:\wceldr -h -s -r
copy %_flatreleasedir%\wceldrC y:\wceldr
attrib y:\wceldr +h +s +r
goto endit
:fail
echo.
echo Can't find wceldr
echo.
:endit