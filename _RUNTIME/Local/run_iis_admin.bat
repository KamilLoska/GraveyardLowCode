@color 0A
@cd /D %~dp0
@set "projectdir=%~dp0..\.."
@For %%A in ("%projectdir%") do @(
    @set projectname=%%~nxA)
@title %projectname% - IIS Express console. *** DO NOT CLOSE THIS WINDOW unless you want to kill the service process ***

@IF EXIST "%~dp0..\RUNTIME\snapshot_IIS.txt" (
@echo Deleting last snapshot file
del "%~dp0..\RUNTIME\snapshot_IIS.txt"
)

@echo.
@echo Preparing PID file and killing previous instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/prepare-pid" "%~dp0..\RUNTIME\pid_IIS.txt"

@echo.
@echo Killing any remaining (zombie) instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/kill" "C:\Program Files\IIS Express\iisexpress.exe" "%%/site:%projectname% /systray:false%%"

@echo.
@echo Starting process '"C:\Program Files\IIS Express\iisexpress.exe" /config:"%~dp0localhost_admin.config" /site:%projectname% /systray:false'
"C:\Program Files\IIS Express\iisexpress.exe" /config:"%~dp0localhost_admin.config" /site:%projectname% /systray:false

@echo.
@echo Generate snapshot from console output (last 10 000 lines)
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "%~dp0..\RUNTIME\snapshot_IIS.txt" 10000
