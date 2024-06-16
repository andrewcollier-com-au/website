#!/bin/bash
echo "Adding non-free and contrib repos to apt source file"


# Define the repository URL (adjust as necessary)
REPO_URL="http://deb.debian.org/debian/"

# Detect distribution codename
DISTRIBUTION=$(lsb_release -cs)

if [ -z "$DISTRIBUTION" ]; then
    echo "Failed to detect distribution codename."
    exit 1
fi

# Backup original sources.list
mv /etc/apt/sources.list /etc/apt/sources.list.backup

# Create the new sources file
touch /etc/apt/sources.list

# Add 'main contrib non-free-firmware non-free' to new repository file
    echo "deb ${REPO_URL} ${DISTRIBUTION} main contrib non-free-firmware non-free" | sudo tee -a /etc/apt/sources.list

# Ensure update and security repositories are also included
if ! grep -q "^deb ${REPO_URL} ${DISTRIBUTION}-updates main" /etc/apt/sources.list; then
    echo "deb ${REPO_URL} ${DISTRIBUTION}-updates main contrib non-free-firmware non-free" | sudo tee -a /etc/apt/sources.list
fi

if ! grep -q "^deb ${REPO_URL} ${DISTRIBUTION}-security main" /etc/apt/sources.list; then
    echo "deb ${REPO_URL} ${DISTRIBUTION}-security main contrib non-free-firmware non-free" | sudo tee -a /etc/apt/sources.list
fi

# Update package lists
apt update
