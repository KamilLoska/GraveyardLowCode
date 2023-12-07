@color 0A
@cd /D %~dp0
@set "projectdir=%~dp0..\.."
@For %%A in ("%projectdir%") do @(
    @set projectname=%%~nxA)
@title %projectname% - Workflow.Host console. *** DO NOT CLOSE THIS WINDOW unless you want to kill the service process ***

@IF EXIST "%~dp0..\RUNTIME\snapshot_WFL.txt" (
   @echo Deleting last snapshot file
   del "%~dp0..\RUNTIME\snapshot_WFL.txt"
)


@echo.
@echo Preparing PID file and killing previous instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/prepare-pid" "%~dp0..\RUNTIME\pid_WFL.txt"

@echo.
@echo Killing any remaining (zombie) instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/kill" "%~dp0..\APP\Workflow.Host"

@echo.
@echo Starting process '"%~dp0..\APP\Workflow.Host\VSoft.BusinessPlatform.Workflow.Host.exe"'
"%~dp0..\APP\Workflow.Host\VSoft.BusinessPlatform.Workflow.Host.exe"

@echo.
@echo Generate snapshot from console output (last 10 000 lines)
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "%~dp0..\RUNTIME\snapshot_WFL.txt" 10000
