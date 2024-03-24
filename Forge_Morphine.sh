#!/bin/bash

########################_UNCOMMIT_AND_ADD_TO_'ON_STARTUP'_COMMANDS_####################################################
#echo $PATH
#curl sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/Forge_Morphine.sh sudo | bash
#if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi
#supervisorctrl restart webui
########################_UNCOMMIT_AND_ADD_TO_'ON_STARTUP'_COMMANDS_####################################################

# Go to root
cd /root

-e install_dir="/opt"

-e clone_dir="/opt/stable-diffusion-webui-forge"

-e venv_dir="/opt/micromamba/envs/webui"

# Go to install dir
cd/opt

# Clone the repository into a temporary directory 
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git

# Change to the new forge dir...
cd /opt/stable-diffusion-webui-forge

# now, download the required web-ui script into the current directory...
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# and install requirements...
pip install -r requirements.txt
pip install -r requirements_versions.txt
pip install -r requirements_npu.txt
pip install -r requirements-test.txt

# throw in some shiny new upscalers...
cd /opt/storage/stable_diffusion/models/esrgan
curl -o 4xUltraSharp.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/vRYVhaDA
curl -o 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
curl -o 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
curl -o Bendel_Halftone.pth https://drive.google.com/uc?export=download&confirm=1&id=1vR_tvWNi8jXhXdmgW5xvWsQp0pXN3ge-
curl -o 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
curl -o 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
curl -o 16xPNSR.pth https://openmodeldb.info/models/16x-PSNR#:~:text=Download%20(64.1,by%20Google%20Drive

# get and install Deforum...
cd /opt/stable-diffusion-webui-forge/extensions
git clone https://github.com/deforum-art/sd-forge-deforum.git

cd /opt/stable-diffusion-webui-forge/extensions/sd-forge-deforum
pip install -r requirements.txt

# change back to forge dir...
cd /opt/stable-diffusion-webui-forge

# and cleanup.
echo $PATH
if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# Dry run
python3 webui.py

# Execute launch script
python3 launch.py
