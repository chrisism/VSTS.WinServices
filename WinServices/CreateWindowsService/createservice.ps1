param (
	[string]$serviceName,
	[string]$displayName,
	[string]$description,
	[string]$exePath,
	[string]$startupType,
	[string]$userType,
	[string]$username,
	[string]$password
)

if ($displayName -eq "")
{
	$displayName = $serviceName
}

if ($description -eq "")
{
	$description = $serviceName
}

$existingService = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"

if ($existingService) 
{
	$existingService.Delete()
	Write-Host "Waiting 5 seconds to allow service to be uninstalled."
	Start-Sleep -s 5  
}

$startupTypeIsAutomaticDelayedStart = $startupType -eq "AutomaticDelayedStart"

if ($startupTypeIsAutomaticDelayedStart) {

	$startupType = "Automatic"	
}

if ($userType -eq "Custom") {
	
	$servicePassword = convertto-securestring -String $password -AsPlainText -Force  
	$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $servicePassword

	Write-Host "Installing the service with custom account."
	New-Service -BinaryPathName "$exePath" -Name "$serviceName" -Credential $cred -DisplayName "$displayName" -Description "$description" -StartupType $startupType 

} else {
	
	Write-Host "Installing the service with local system account."
	New-Service -BinaryPathName "$exePath" -Name "$serviceName" -DisplayName "$displayName" -Description "$description" -StartupType $startupType 

}

if ($startupTypeIsAutomaticDelayedStart) {	

	$Output = Invoke-Expression -Command "sc.exe config $serviceName start= delayed-auto" -ErrorAction Stop
	
	if($LASTEXITCODE -ne 0) {

		Write-Error "Failed to set $serviceName to automatic delayed start.`r`n`t$Output"				
		Exit $LASTEXITCODE
	}
}

Write-Host "Installed the service."
