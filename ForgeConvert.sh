#!/bin/bash

echo $PATH

# Go to data dir
cd workspace

# Clone the repository into a temporary directory 
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git

# Change to forge dir
cd /workspace/stable-diffusion-webui-forge/

# Install requirement
pip install -r requirements.txt
pip install -r requirements_versions.txt
pip install -r requirements_npu.txt
pip install -r requirements-test.txt

# Download the required script into the current directory
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# Get and install Deforum
cd workspace/stable-diffusion-webui-forge/exensions
git clone https://github.com/deforum-art/sd-forge-deforum

cd sd-forge-deforum
pip install -r requirements.txt

# Divert Traffic
cd /workspace/stable-diffusion-webui/
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# Change back to forge dir
cd /workspace/stable-diffusion-webui-forge/

# Dry run
python3 webui.py

# Cleanup
if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# Execute launch script
python3 launch.py
