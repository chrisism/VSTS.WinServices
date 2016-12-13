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

if ($userType -eq "Custom") {
	
	$servicePassword = convertto-securestring -String $password -AsPlainText -Force  
	$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $servicePassword

	Write-Host "Installing the service with custom account."
	New-Service -BinaryPathName "$exePath" -Name "$serviceName" -Credential $cred -DisplayName "$displayName" -Description "$description" -StartupType $startupType 

} else {
	
	Write-Host "Installing the service with local system account."
	New-Service -BinaryPathName "$exePath" -Name "$serviceName" -DisplayName "$displayName" -Description "$description" -StartupType $startupType 

}

Write-Host "Installed the service."
