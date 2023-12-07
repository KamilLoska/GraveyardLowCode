param(
  [Parameter(Mandatory = $false)] [string] $pathProjectFolder,
  [Parameter(Mandatory = $false)] [string] $pathProjectAdminFolder = "",
	[Parameter(Mandatory = $false)] [string] $dbUser,
	[Parameter(Mandatory = $false)] [string] $dbPassword,
  [Parameter(Mandatory = $false)] [pscredential]$clusterServerCredential = [System.Management.Automation.PSCredential]::Empty,
  [Parameter(Mandatory = $false)] [string] $paramTicketName = "",
  [Parameter(Mandatory = $false)] [string] $expPostgreSQLUser,
	[Parameter(Mandatory = $false)] [string] $expPostgreSQLPassword
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Remove-ARCHItem(
  [Parameter(Mandatory = $true, ValueFromPipeline = $true)][string[]] $Path,
  [Parameter(Mandatory = $false)][switch] $Recurse,
  [Parameter(Mandatory = $false)][switch] $Force) {
  process {
    Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force -ErrorVariable tmpErr1 -ErrorAction SilentlyContinue;
    if ($tmpErr1.Count -ne 0) {
      Start-Sleep -Seconds 1;
      Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force -ErrorVariable tmpErr2 -ErrorAction SilentlyContinue;
      if ($tmpErr2.Count -ne 0) {
        Start-Sleep -Seconds 2;
        Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force;
      }
    }
  }
}
$Script_RemoveVSOFTItem = @'
function Remove-ARCHItem(
  [Parameter(Mandatory = $true, ValueFromPipeline = $true)][string[]] $Path,
  [Parameter(Mandatory = $false)][switch] $Recurse,
  [Parameter(Mandatory = $false)][switch] $Force) {
  process {
    Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force -ErrorVariable tmpErr1 -ErrorAction SilentlyContinue;
    if ($tmpErr1.Count -ne 0) {
      Start-Sleep -Seconds 1;
      Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force -ErrorVariable tmpErr2 -ErrorAction SilentlyContinue;
      if ($tmpErr2.Count -ne 0) {
        Start-Sleep -Seconds 2;
        Remove-Item -Path $Path -Recurse:$Recurse -Force:$Force;
      }
    }
  }
}
'@

function Open-ARCHPSSession(
  [Parameter(Mandatory = $true)][string[]] $ComputerName,
  [Parameter(Mandatory = $false)][PSCredential] $Credential = [System.Management.Automation.PSCredential]::Empty) {

  $tempPSSession = $null 
  try
  {
    $tempPSSession = New-PSSession -ComputerName $ComputerName -Credential $Credential
  }
  catch
  {
    Start-Sleep -Seconds 1
    try
    {
      $tempPSSession = New-PSSession -ComputerName $ComputerName -Credential $Credential
    }
    catch
    {
      Start-Sleep -Seconds 2
      $tempPSSession = New-PSSession -ComputerName $ComputerName -Credential $Credential
    }
  }
  $tempPSSession
}

function Close-ARCHPSSession([Parameter(Mandatory = $true)][System.Management.Automation.Runspaces.PSSession] $Session) {
  if ($Session -ne $null) {
    if ($Session.State -eq "Closed") {
      Remove-PSSession $Session;
      $false;
    } else {
      Remove-PSSession $Session;
      $true;
    }
  } else {
    $false;
  }
}

if ($pathProjectFolder -eq "") {
  
  Write-Host "@@ SELF-DESTROYING PROJECT" -ForegroundColor Yellow

  $pathProjectFolder = $PSScriptRoot
  $projectFilePath = Join-Path -Path $pathProjectFolder -ChildPath "project.json"
  $runtimeFilePath = Join-Path -Path $pathProjectFolder -ChildPath "default.runtime.json"

  if ( -not ( (Test-Path $runtimeFilePath) -and (Test-Path $projectFilePath) ) ){ 
    Write-Host "@@ ERROR: Project files (project.json; default.runtime.json) not found in current folder ($pathProjectFolder)" -ForegroundColor Red
    Write-Host "@@ ERROR: This is not project folder." -ForegroundColor Red
    exit 9001
  }

  $tmpFolder = [System.IO.Path]::GetTempFileName() | %{ rm $_; mkdir $_ }

  Add-Type -AssemblyName System.IO.Compression.FileSystem; 
  [System.IO.Compression.ZipFile]::ExtractToDirectory($(Join-Path -Path $PSScriptRoot -ChildPath "DestroyProject.zip"), $tmpFolder);
  Copy-Item $(Join-Path -Path $PSScriptRoot -ChildPath "DestroyProject.ps1") -Destination $tmpFolder
  
  Set-Location $(Join-Path -Path $tmpFolder -ChildPath "..") 

  $cmd = "& `"$tmpFolder\DestroyProject.ps1`" -pathProjectFolder `"$pathProjectFolder`" -pathProjectAdminFolder `"$pathProjectAdminFolder`" -dbUser `"$dbuser`" -dbPassword `"$dbPassword`" -clusterServerCredential $clusterServerCredential -paramTicketName `"$paramTicketName`" -expPostgreSQLUser `"$expPostgreSQLUser`" -expPostgreSQLPassword `"$expPostgreSQLPassword`" "

  Write-Host "@@ RUNNING COMMAND: $cmd" -ForegroundColor Yellow

  #using Invoke-Command instead Invoke-Expression to pass credentials as parameter
  Invoke-Command -ScriptBlock  { & $args[0] -pathProjectFolder $args[1] -pathProjectAdminFolder $args[2] -dbUser $args[3] -dbPassword $args[4] -clusterServerCredential $args[5] -paramTicketName $args[6] -expPostgreSQLUser $args[7] -expPostgreSQLPassword $args[8] } -ArgumentList "$tmpFolder\DestroyProject.ps1", $pathProjectFolder, $pathProjectAdminFolder, $dbuser, $dbPassword, $clusterServerCredential, $paramTicketName, $expPostgreSQLUser, $expPostgreSQLPassword
  $localLastExitCode = $LastExitCode
  Write-Host "@@ PROCEDURE COMPLETED WITH CODE $localLastExitCode" -ForegroundColor Yellow

  Write-Host "@@ CLEARING TEMP FOLDER" -ForegroundColor Yellow
  Remove-ARCHItem -Path $tmpFolder -Recurse -Force
  Write-Host "@@ EXITING WITH CODE $localLastExitCode" -ForegroundColor Yellow

  Exit $localLastExitCode;
}

if ($paramTicketName -ne "") {
  $paramTicketName = ".$paramTicketName"
}
$logFilePath = Join-Path -Path $pathProjectFolder -ChildPath "_JOURNAL\deployment.$(Get-Date -Format "yyyyMMdd.HHmmss")$paramTicketName.DestroyProject.log"
if ($pathProjectAdminFolder -ne "") {
  #for containers store logs in administrative folder
  $logFilePath = Join-Path -Path $pathProjectAdminFolder -ChildPath "_JOURNAL\deployment.$(Get-Date -Format "yyyyMMdd.HHmmss")$paramTicketName.DestroyProject.log"
}

Import-Module $PSScriptRoot\InstallTools\DeploymentTools.psm1 -Force -Global -ArgumentList @($logFilePath)

$projectFilePath = Join-Path -Path $pathProjectFolder -ChildPath "project.json"
$runtimeFilePath = Join-Path -Path $pathProjectFolder -ChildPath "default.runtime.json"

if ( (Test-Path $runtimeFilePath) -and (Test-Path $projectFilePath) ){ 
  Write-VSOFTLog "Project files (project.json; default.runtime.json) found"
} else {
  Write-VSOFTLog "Project files (project.json; default.runtime.json) not exists." Warning
  Write-VSOFTLog "You have to manually:" Warning
  Write-VSOFTLog "* Uninstall remaining services and application pools from IIS (run UninstallOnPremisesComponents.ps1 in runtime folders)" Warning
  Write-VSOFTLog "* Remove projest's databases and users" Warning
  Write-VSOFTLog "* Delete projest's folders" Warning
  Write-VSOFTLog "Can not destroy project automatically." Error
}

$htRuntime = Import-ARCHRuntimeFile -path $runtimeFilePath

$gitFolderExist = $false
if ( Test-Path (Join-Path -Path $pathProjectFolder -ChildPath ".git") ) {
	$gitFolderExist = $true
	Write-VSOFTLog "WARNING: Found .git subfolder in project folder. You have to destroy project folder by yourself (scripts will only destroy automatically created subfolders)" Warning
}

function KillProcesses($folderPath) {

	if (Test-Path $folderPath) {
		#kill studio processes from path
		$studioProcesses = Get-WmiObject -Query "Select * From Win32_Process where (Name='archITekt.exe')" | where {($_.Path) -and ($_.Path.StartsWith($folderPath, [System.StringComparison]::OrdinalIgnoreCase))}
		foreach ($studioProces in $studioProcesses) {
			$studioProcesID = $studioProces.ProcessId
			Write-Output "Kill archItekt.exe; PID = $studioProcesID"

			Write-Output "taskkill.exe /f /PID $studioProcesID /T"
			taskkill.exe /f /PID $studioProcesID /T
		}

		$runtimeFolderPath = Join-Path -Path $folderPath -ChildPath "RUNTIME"
		if (Test-Path $runtimeFolderPath) {
			#kill runtime processes from path
			$pidFiles = Get-ChildItem -Path $runtimeFolderPath -File -Filter "pid_*.txt"
			foreach ($pidFile in $pidFiles) {
				$content = Get-Content $pidFile.FullName
				$processId = $content
				$processStartTime = "(unknown)"
				$processName = "(unknown)"
				if ($content -is [array]) {
					$processId = $content[0]
					if ( ($content.Count -ge 2) -and ($content[1] -ne "")) {
						$processName = $content[1]
					}
					if (($content.Count -ge 3)-and ($content[2] -ne "")) {
						$processStartTime = $content[2]
					}
				}
				if ( ($processId -ne "") -and ($processId -ne $null) )
				{
					$process = Get-Process -Id $processId -ErrorAction SilentlyContinue
				
					if ($process) {
						if ( (($process.Name -eq $processName) -or $processName -eq "(unknown)") -and ( (($process.StartTime) -and ($process.StartTime).ToString('yyyyMMdd_HHmmss') -eq $processStartTime) -or $processStartTime -eq "(unknown)") ) {
    						Write-VSOFTLog "Kill runtime ($pidFile); PID = $processId; name = $processName; StartTime = $processStartTime"
							Write-VSOFTLog "taskkill.exe /f /PID $processId /T /FI 'STATUS eq RUNNING'"
							taskkill.exe /f /PID $processId /T /FI "STATUS eq RUNNING"
						}
					}
				}
			}		
		}
	}
}


function Invoke-ARCHRemotePSScript (
	[Parameter(Mandatory = $true)] [string[]]$ServerNames,
  [Parameter(Mandatory = $true)] [string]$ScriptToExecute,
	[Parameter(Mandatory = $false)] [pscredential]$Credential) {
	try 
	{
		foreach ($server in $ServerNames) 
		{
			if ( Get-ARCHIsLocalServer -ComputerName $server ) 
			{
				Write-VSOFTLog "Executing locally on $server command $ScriptToExecute  ===>"
				
        Invoke-Expression "$scriptToExecute"
				
				Write-VSOFTLog " <=== End of local (on $server) execution"
			}
			else
			{
				#$tmpScript = ".\InstallOnPremises.ps1 -PathProjectFolder ""$Cluster_TempSetupLocationLocal\_PROJECT"" -SetupCommand ""$SetupCommand"" -SecurityPassword ""$SecurityPassword"""

        $remoteSession = Open-ARCHPSSession -ComputerName $server -Credential $Credential

				Write-VSOFTLog "Executing remotely on machine $server, command $ScriptToExecute  ===>"

				try 
				{
					Invoke-ARCHCommandSmart -Session $remoteSession -ArgumentList @( "$scriptToExecute" ) -ScriptBlock {
						$localScript = $args[0]
						Write-Verbose "Remote execution of command" -verbose 4>&1
						Invoke-Expression $localScript 4>&1
						$localExitCode = $LASTEXITCODE
						Write-Verbose "Remote execution of command returned $localExitCode" -verbose 4>&1
						if (($localExitCode -ne $null) -and ($localExitCode -ne 0)) {
							#throwing exception is the only way to pass informaton about error
							throw "Remote execution of command returned $localExitCode"
							exit $localExitCode
						}
					} | Write-VSOFTLog
				}
				catch 
				{
					Write-VSOFTLog "<===  Remote script (on $server) errored out: $($_ | Out-String)" Error
				}
        if (-not (Close-ARCHPSSession -Session $remoteSession)) {
          Write-VSOFTLog " <===  Remote script (on $server) errored out" Error
        }
				Write-VSOFTLog " <=== End of remote (on $server) script execution"
			}
		}
	}
	catch
	{
		Write-VSOFTLog ($_.Exception.Message) Error
	}
}


Write-VSOFTLogHeader "Removing runtime components" 2 

#ToDo: try to uninstall components on all servers
if ($htRuntime["RuntimeType"] -eq "Developer") {
  Write-VSOFTLog "Runtime type: Developer, stopping local runtime processes and removing runtime folder"

  $localRuntimeFolder = $htRuntime["RuntimeFolder"]
  if (Test-Path $localRuntimeFolder) {
	  Write-VSOFTLog "Stopping local runtime processes"
	  KillProcesses -folderPath $localRuntimeFolder

	  if ( $GitFolderExist ) {
		  Write-VSOFTLog "Removing local runtime folder ($localRuntimeFolder) except VersionServer folder"
		  if (Test-Path $localRuntimeFolder) {
			  Get-ChildItem $localRuntimeFolder -Exclude "VersionServer" | Remove-ARCHItem -Recurse -Force
		  }
	  } else {
		  Write-VSOFTLog "Removing local runtime folder ($localRuntimeFolder)"
		  if (Test-Path $localRuntimeFolder) {
			  Remove-ARCHItem -Path $localRuntimeFolder -Recurse -Force
		  }
	  }
  }
  Write-VSOFTLog "Runtime type: Developer, local runtime processes stopped and runtime folder cleared succesfully"
}
    
if ($htRuntime["RuntimeType"] -eq "OnPremises") {
  Write-VSOFTLog "Runtime type: OnPremises, uninstalling runtime components and removing runtime folders"

  $Server_TargetFolder = $htRuntime["RuntimeFolder"]
  $Server_UninstallFilePathScript = "$Server_TargetFolder\UninstallOnPremisesComponents.ps1"

  [string[]]$TargetAppServers =  @()           # lista nazw maszyn hostujących usługi (oddzielona przecinkami)
  [string[]]$TargetAppServersConnections = @() # lista adresów do maszyn hostujących usługi (oddzielona przecinkami)
  foreach ($tmpServer in $htRuntime["TargetAppServers"]) {
	  if ($tmpServer -like "*:*") {
		  $tmpArray =  $tmpServer.Split(":")
		  $TargetAppServers += $tmpArray[0]
		  $TargetAppServersConnections += $tmpArray[1]
	  } else {
		  $TargetAppServers += $tmpServer
		  $TargetAppServersConnections += $tmpServer
	  }
  }
  [string[]]$TargetWebServers =  @()           # lista nazw maszyn hostujących aplikację WWW (oddzielona przecinkami) 
  [string[]]$TargetWebServersConnections = @() # lista adresów do maszyn hostujących aplikację WWW (oddzielona przecinkami)
  foreach ($tmpServer in $htRuntime["TargetWebServers"]) {
	  if ($tmpServer -like "*:*") {
		  $tmpArray =  $tmpServer.Split(":")
		  $TargetWebServers += $tmpArray[0]
		  $TargetWebServersConnections += $tmpArray[1]
	  } else {
		  $TargetWebServers += $tmpServer
		  $TargetWebServersConnections += $tmpServer
	  }
  }

	$procesingServers = $TargetAppServersConnections + $TargetWebServersConnections | Select -uniq

	Write-VSOFTLog "Executing 'UninstallOnPremisesComponents.ps1' on target machines"
  #sleep for 3 seconds to bypass time when files could be locked by operating system
  $scriptToExecute = @"
$Script_RemoveVSOFTItem
if (Test-Path(`"$Server_UninstallFilePathScript`")) { 
  & `"$Server_UninstallFilePathScript`"; 
  Start-Sleep -Seconds 3;
  Remove-ARCHItem -Path `"$Server_TargetFolder`" -Recurse -Force; 
}
"@

  Invoke-ARCHRemotePSScript -ServerNames $procesingServers -ScriptToExecute $scriptToExecute -Credential $clusterServerCredential

  Write-VSOFTLog "Runtime type: OnPremises, runtime components uninstalled and runtime folders removed succesfully"
}

if ($htRuntime["RuntimeType"] -eq "Container") {
  Write-VSOFTLog "Runtime type: Container, stoping applications on containers"

  $stateFilePath = Join-Path -Path $pathProjectFolder -ChildPath "state.json"
  if (Test-Path $stateFilePath) {
    $htState = Import-ARCHStateFile -path $stateFilePath 
    $htState["ApplicationShouldRun"] = $false
    Export-ARCHStateFile -path $stateFilePath -state $htState
  }

  Write-VSOFTLog "Runtime type: Container, applications on containers stopped succesfully"
}

#ToDo: destroy project databases - for all type of projects

Write-VSOFTLogHeader "Destroying project databases" 2 
  
Write-VSOFTLog "Destroying runtime databases"
Remove-ARCHRuntimeOnPremises -pathProjectFolder $pathProjectFolder -databaseServerAdminLogin $dbUser -databaseServerAdminPassword $dbPassword -expPostgreSQLUser $expPostgreSQLUser -expPostgreSQLPassword $expPostgreSQLPassword

Write-VSOFTLog "Destroying Version server database"
Remove-ARCHProject -pathProjectFolder $pathProjectFolder -versionServerServerAdminLogin $dbUser -versionServerServerAdminPassword $dbPassword -leaveProjectFolder -expPostgreSQLUser $expPostgreSQLUser -expPostgreSQLPassword $expPostgreSQLPassword

Write-VSOFTLog "Project databases destroyed succesfully"

#Todo: Delete folders
Write-VSOFTLogHeader "Clearing project folder" 2 



if ($htRuntime["RuntimeType"] -eq "Developer") {
  # if developer
    if ($GitFolderExist) {
	    Write-VSOFTLog "Destroying project's automatically created items"

	    if (Test-Path "$pathProjectFolder\VS") {
		    Write-VSOFTLog "Found project's VS subfolder - removing"
		    Remove-ARCHItem "$pathProjectFolder\VS" -Recurse -Force
	    } else {
		    Write-VSOFTLog "Not found project's VS subfolder - omitting"
	    }

	    if (Test-Path "$pathProjectFolder\Licenses") {
		    Write-VSOFTLog "Found project's Licenses subfolder - removing"
		    Remove-ARCHItem "$pathProjectFolder\Licenses" -Recurse -Force
	    } else {
		    Write-VSOFTLog "Not found project's Licenses subfolder - omitting"
	    }

	    if (Test-Path "$pathProjectFolder\_JOURNAL") {
		    Write-VSOFTLog "Found project's _JOURNAL subfolder - removing"
		    Remove-ARCHItem "$pathProjectFolder\_JOURNAL" -Recurse -Force
	    } else {
		    Write-VSOFTLog "Not found project's _JOURNAL subfolder - omitting"
	    }

	    if (Test-Path "$pathProjectFolder\project.json") {
		    Write-VSOFTLog "Found project's project.json file - removing"
		    Remove-ARCHItem "$pathProjectFolder\project.json" -Force
	    } else {
		    Write-VSOFTLog "Not found project's project.json file - omitting"
	    }
	
	    if (Test-Path "$pathProjectFolder\*.runtime.json") {
		    Write-VSOFTLog "Found project's *.runtime.json file(s) - removing"
		    Remove-ARCHItem "$pathProjectFolder\*.runtime.json" -Force
	    } else {
		    Write-VSOFTLog "Not found project's *.runtime.json file(s) - omitting"
	    }

	    if (Test-Path "$pathProjectFolder\vsoft.cloud.*.json") {
		    Write-VSOFTLog "Found project's vsoft.cloud.*.json file(s) - removing"
		    Remove-ARCHItem "$pathProjectFolder\vsoft.cloud.*.json" -Force
	    } else {
		    Write-VSOFTLog "Not found project's vsoft.cloud.*.json file(s) - omitting"
	    }

	    if (Test-Path "$pathProjectFolder\vsoft.onpremises.*.json") {
		    Write-VSOFTLog "Found project's vsoft.onpremises.*.json file(s) - removing"
		    Remove-ARCHItem "$pathProjectFolder\vsoft.onpremises.*.json" -Force
	    } else {
		    Write-VSOFTLog "Not found project's vsoft.onpremises.*.json file(s) - omitting"
	    }
	    if (Test-Path "$pathProjectFolder\DestroyProject.ps1") {
		    Write-VSOFTLog "Found project's DestroyProject.ps1 file - removing"
		    Remove-ARCHItem "$pathProjectFolder\DestroyProject.ps1" -Force
	    } else {
		    Write-VSOFTLog "Not found project's DestroyProject.ps1 file - omitting"
	    }
	    if (Test-Path "$pathProjectFolder\DestroyProject.zip") {
		    Write-VSOFTLog "Found project's DestroyProject.zip file - removing"
		    Remove-ARCHItem "$pathProjectFolder\DestroyProject.zip" -Force
	    } else {
		    Write-VSOFTLog "Not found project's DestroyProject.zip file - omitting"
	    }
    }
    else {
      Write-VSOFTLog "Clearing project folder ($pathProjectFolder)"
			Remove-ARCHItem -Path $pathProjectFolder -Recurse -Force
		}
  }
    
if ($htRuntime["RuntimeType"] -eq "OnPremises") {
  Write-VSOFTLog "Clearing project folder ($pathProjectFolder)"
  Remove-ARCHItem -Path $pathProjectFolder -Recurse -Force
}

if ($htRuntime["RuntimeType"] -eq "Container") {
  Write-VSOFTLog "Clearing project folder ($pathProjectFolder)"
  Remove-ARCHItem -Path $pathProjectFolder -Recurse -Force

  #clear administrative folder too
  if (($pathProjectAdminFolder -ne "") -and (Test-Path $pathProjectAdminFolder)) {
    Write-VSOFTLog "Clearing project administrative folder ($pathProjectAdminFolder)"
    Remove-ARCHItem -Path $pathProjectAdminFolder -Recurse -Force
  }
}

Write-Output "Project destroyed"


Exit 0

trap 
{
	$tmpError = "A script execution error has occurred: `r`n" + ($_ | Out-String)
	if ((Get-Member -InputObject $_ -Name ScriptStackTrace) -ne $null) {
		$tmpError = $tmpError + $_.ScriptStackTrace
   }

	try
	{
		Write-VSOFTLog ($tmpError) Error
	}
	catch
	{
		Write-Verbose $tmpError -Verbose
	}
	Exit 9001
}
