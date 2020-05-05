param (
	[string]$serviceName,
	[int]$secondsToWait
)

$existingService = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"

if ($existingService) 
{
	$existingService.Delete()
	Write-Host "Waiting $secondsToWait seconds to allow service to be uninstalled."
	Start-Sleep -s $secondsToWait  
}

Write-Host "Removed the service."
