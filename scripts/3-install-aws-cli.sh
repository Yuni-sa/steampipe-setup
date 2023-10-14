#!/bin/bash

# Check if 'unzip' is installed, and if not, install it
if ! command -v unzip &>/dev/null; then
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update
        sudo apt-get install -y unzip
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y unzip
    else
        echo "Error: 'unzip' is not installed, and package manager not found." >&2
        exit 1
    fi
fi

# Step 1: Download the AWS CLI package
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Step 2: Unzip the package
sudo unzip awscliv2.zip

# Step 3: Install the AWS CLI
if sudo ./aws/install; then
    echo "AWS CLI has been successfully installed."
else
    echo "Failed to install AWS CLI."
    exit 1
fi

# Step 4: Clean up the downloaded files
rm -f awscliv2.zip
rm -rf aws

# Step 5: Install the AWS plugin
steampipe plugin install aws