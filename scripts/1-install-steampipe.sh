#!/bin/bash

# Step 1: Create a new user with a password prompt
read -p "Enter the username for the new user: " username
if sudo adduser $username; then
    echo "User $username has been created."
else
    echo "Failed to create user $username."
    exit 1
fi

# Step 2: Add the user to the sudo/suduers group
if sudo usermod -aG sudo $username; then
    echo "User $username has been added to the sudo group."
else
    echo "Failed to add $username to the sudo group."
    exit 1
fi

# Step 3: Install Steampipe for the new user
if sudo -u $username bash -c 'curl -fsSL https://raw.githubusercontent.com/turbot/steampipe/main/install.sh | sudo sh'; then
    echo "Steampipe has been installed for user $username."
else
    echo "Failed to install Steampipe for user $username."
    exit 1
fi

# Step 4: Switch to the Steampipe user
echo "Enter password for $username"
if su - $username; then
    echo "Switched to user $username."
else
    echo "Failed to switch to user $username."
    exit 1
fi