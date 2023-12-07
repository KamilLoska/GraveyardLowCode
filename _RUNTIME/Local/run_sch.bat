@color 0A
@cd /D %~dp0
@set "projectdir=%~dp0..\.."
@For %%A in ("%projectdir%") do @(
    @set projectname=%%~nxA)
@title %projectname% - Scheduler.Host console. *** DO NOT CLOSE THIS WINDOW unless you want to kill the service process ***

@IF EXIST "%~dp0..\RUNTIME\snapshot_SCH.txt" (
   @echo Deleting last snapshot file
   del "%~dp0..\RUNTIME\snapshot_SCH.txt"
)

@echo.
@echo Preparing PID file and killing previous instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/prepare-pid" "%~dp0..\RUNTIME\pid_SCH.txt"

@echo.
@echo Killing any remaining (zombie) instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/kill" "%~dp0..\APP\Scheduler.Host"

@echo.
@echo Starting process '"%~dp0..\APP\Scheduler.Host\VServiceHost.exe"'
"%~dp0..\APP\Scheduler.Host\VServiceHost.exe"

@echo.
@echo Generate snapshot from console output (last 10 000 lines)
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "%~dp0..\RUNTIME\snapshot_SCH.txt" 10000
