echo off
pushd ..\..\core
build
if EXIST build.err GOTO buildfail
popd


build
if EXIST build.err GOTO buildfail1

set WRKDIR=%SG_OUTPUT_ROOT%\platform\%_TGTPLAT%\target\%_TGTCPU%\%WINCEDEBUG%


if exist %WRKDIR%\xldrS.nb0 goto cont1
echo.
echo. Can't find %WRKDIR%\xldrS.nb0
echo.
GOTO ENDIT

:cont1


romimage $(ROMIMAGE_FLAGS) bldr.bib



if exist %WRKDIR%\bldrS.bin goto cont2
echo.
echo. Can't find %WRKDIR%\bldrS.bin
echo.
GOTO ENDIT

:cont2


copy /b %WRKDIR%\xldrS.nb0 + ..\..\xldr\bldrCfg.nb0 + %WRKDIR%\bldrS.bin %WRKDIR%\wceldrS

del %_FLATRELEASEDIR%\wceldrS

if exist %WRKDIR%\wceldrS xcopy /Q /I %WRKDIR%\wceldrS %_FLATRELEASEDIR%

GOTO ENDIT
:BUILDFAIL
popd
:BUILDFAIL1
echo.
echo. Errors in build.
echo.

:ENDIT