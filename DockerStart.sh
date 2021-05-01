#!/bin/bash
echo "Running DockerStart.sh"

# Create config if it doesnt exist
echo "Create /config (if required)"
mkdir -p /config

# Copy files that are not already there
echo "Copy files from /app to /config (newer files only)"
yes | cp -raf /app/. /config/

# Set Permissions
chmod +x /config/ms_rewards_farmer.py

echo "Start Python Script"
python3 -u /config/ms_rewards_farmer.py