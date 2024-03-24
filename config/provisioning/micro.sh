#!/bin/bash

cd /opt/

if [ -d "stable-diffusion-webui" ]; then
    mv /opt/stable-diffusion-webui /opt/stable-diffusion-webi-forge
    cp -f /opt/stable-diffusion-webui/extensions/stable-diffusion-webui-forge /opt
fi

# Download the required script into the current directory
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# Execute Python script
python3 launch.py
