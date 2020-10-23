@echo off
REM change the extension
for /R "C:\path\name\" %%A in (*.properties) do (

REM call top to add at the top of the file
  call :top
REM call bottom to add at the end of the file
  call :bottom
)

:data1
echo:   
echo # Max count of logfiles to keep inside a docker container
echo sp.docker.container.logfile.count=4
echo # max size of a logfile inside a docker container
echo sp.docker.container.logfile.size=50m
exit /b

:bottom
call :data1 >> "%%A"

:top
> "%%~dpANew_%%~nxA" call :data1
type "%%A" >> "%%~dpANew_%%~nxA"
del "%%A" 2>nul
ren "%%~dpANew_%%~nxA" "%%~nxA"