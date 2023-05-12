# shi: this file is being imported by C:\Users\admin\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#      by adding
#      ``````
#        $scriptPath = 'C:\Users\shi\Repositories\private\gists\powershell\Set-VpnMetricAndRestartLxss.ps1'
#        if (Test-Path $scriptPath)
#        {
#            . $scriptPath
#        }
#        else
#        {
#            Write-Error "Failed to load script from $scriptPath because the file does not exist"
#        }
#       ``````
function Set-VpnMetricAndRestartLxss
{
    $adapter = Get-NetAdapter | Where-Object { $_.InterfaceDescription -match "Cisco AnyConnect" }
    if ($adapter)
    {
        Write-Output "Setting interface metric for adapter $( $adapter.Name )..."
        $adapter | Set-NetIPInterface -InterfaceMetric 6000

        Write-Output "Restarting LxssManager service..."
        Restart-Service LxssManager
    }
    else
    {
        Write-Output "No matching adapter found."
    }
}

Set-Alias -Name VpnQuickSwitch -Value Set-VpnMetricAndRestartLxss
