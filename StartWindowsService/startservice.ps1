param (
    [string]$serviceName
)

# Import the Task.Common dll that has all the cmdlets we need for Build
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"


Write-Output "Starting $serviceName..."

$serviceInstance = Get-Service $serviceName
if ($serviceInstance.Status -eq "Running") {
    Write-Output "The $serviceName service is already running."
} else {
    start-service $serviceName
    $serviceInstance.WaitForStatus('Running', '00:01:00')
    Write-Output "Started $serviceName"
}
