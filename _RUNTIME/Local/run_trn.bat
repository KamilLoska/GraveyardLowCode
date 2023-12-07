@color 0A
@cd /D %~dp0
@set "projectdir=%~dp0..\.."
@For %%A in ("%projectdir%") do @(
    @set projectname=%%~nxA)
@title %projectname% - TransformationServices.Host console. *** DO NOT CLOSE THIS WINDOW unless you want to kill the service process ***

@IF EXIST "%~dp0..\RUNTIME\snapshot_TRN.txt" (
   @echo Deleting last snapshot file
   del "%~dp0..\RUNTIME\snapshot_TRN.txt"
)


@echo.
@echo Preparing PID file and killing previous instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/prepare-pid" "%~dp0..\RUNTIME\pid_TRN.txt"

@echo.
@echo Killing any remaining (zombie) instance of service
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "/kill" "%~dp0..\APP\TransformationServices.Host"

@echo.
@echo Starting process '"%~dp0..\APP\TransformationServices.Host\TransformationService.exe" -d'
"%~dp0..\APP\TransformationServices.Host\TransformationService.exe" -d

@echo.
@echo Generate snapshot from console output (last 10 000 lines)
@"%~dp0ConsoleSnapshot\ConsoleSnapshot.exe" "%~dp0..\RUNTIME\snapshot_TRN.txt" 10000
