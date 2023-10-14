# Check if the WSL feature is enabled
$wslEnabled = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq "Microsoft-Windows-Subsystem-Linux" }

if ($wslEnabled -eq $null) {
    Write-Host "Enabling WSL feature..."
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    # You may need to restart your computer after enabling the feature
    Write-Host "Please restart your computer to continue."
}
else {
    Write-Host "WSL feature is already enabled."
}

# Install the Ubuntu 20.04 distribution
wsl --install -d Ubuntu-20.04

# Launch Ubuntu
wsl