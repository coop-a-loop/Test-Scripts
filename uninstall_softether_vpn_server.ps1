# Define the name of the software to uninstall
$softwareName = "SoftEther VPN Server"

# Check if the software is installed
if (Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $softwareName }) {
    # Uninstall the software
    $uninstallResult = (Start-Process -FilePath "msiexec.exe" -ArgumentList "/x $($softwareName) /quiet /norestart" -Wait -Passthru)
    
    if ($uninstallResult.ExitCode -eq 0) {
        Write-Output "SoftEther VPN Server has been successfully uninstalled."
    } else {
        Write-Output "Failed to uninstall SoftEther VPN Server. Exit code: $($uninstallResult.ExitCode)"
    }
} else {
    Write-Output "SoftEther VPN Server is not installed on this system."
}
