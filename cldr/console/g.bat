echo off
pushd ..\..\core
build
if EXIST build.err GOTO buildfail
popd


build
if EXIST build.err GOTO buildfail1

set WRKDIR=%SG_OUTPUT_ROOT%\platform\%_TGTPLAT%\target\%_TGTCPU%\%WINCEDEBUG%

if exist %WRKDIR%\xldrC.nb0 goto cont1
echo.
echo. Can't find %WRKDIR%\xldrC.nb0
echo.
GOTO ENDIT

:cont1


romimage $(ROMIMAGE_FLAGS) bldr.bib


if exist %WRKDIR%\bldrC.bin goto cont2
echo.
echo. Can't find %WRKDIR%\bldrc.bin
echo.
GOTO ENDIT

:cont2


copy /b %WRKDIR%\xldrC.nb0 + ..\..\xldr\bldrCfg.nb0 + %WRKDIR%\bldrC.bin %WRKDIR%\wceldrC

del %_FLATRELEASEDIR%\wceldrC

if exist %WRKDIR%\wceldrC xcopy /Q /I %WRKDIR%\wceldrC %_FLATRELEASEDIR%

GOTO ENDIT
:BUILDFAIL
popd
:BUILDFAIL1
echo.
echo. Errors in build.
echo.

:ENDIT