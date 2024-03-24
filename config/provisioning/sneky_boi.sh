#!/bin/bash

# Change to the desired directory, assuming /opt/
cd /opt/

# Check if a directory named stable-diffusion-webui exists and rename it to A1111
if [ -d "stable-diffusion-webui" ]; then
    mv --no-clobber stable-diffusion-webui A1111
fi

# Download and execute a script - ensure it's safe before running
curl -sS https://webi.sh/gh | sh

# Clone the repository into a temporary directory name, since stable-diffusion-webui is now A1111
git clone git@github.com:lllyasviel/stable-diffusion-webui-forge.git stable-diffusion-webui-temp

# Rename the cloned directory to stable-diffusion-webui
mv --force stable-diffusion-webui-temp stable-diffusion-webui

# Change to the cloned (and renamed) directory
cd stable-diffusion-webui

# Download the required script into the current directory
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# Execute Python script
python3 launch.py