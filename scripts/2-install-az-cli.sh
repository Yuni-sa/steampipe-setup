#!/bin/bash

# Check if the Azure CLI is already installed
if az --version &>/dev/null; then
    echo "Azure CLI is already installed."
    exit 0
fi

# Step 1: Install Azure CLI using curl
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Verify the installation
if az --version &>/dev/null; then
    echo "Azure CLI has been successfully installed."
else
    echo "Azure CLI installation failed."
fi

# Step 2: Install Azure plugins
steampipe plugin install azure
steampipe plugin install azuread