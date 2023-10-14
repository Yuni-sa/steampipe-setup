# Manual WSL (Windows Subsystem for Linux) Installation

# Enable the WSL feature
# If the feature is already enabled, you can skip this step.
# Open PowerShell as an administrator and run the following command:
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# You may need to restart your computer after enabling the feature

# Install the Ubuntu 20.04 distribution
wsl --install -d Ubuntu-20.04

# Launch Ubuntu
wsl