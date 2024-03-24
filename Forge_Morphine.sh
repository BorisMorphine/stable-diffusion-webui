#!/bin/bash

########################_UNCOMMIT_AND_ADD_TO_'ON_STARTUP'_COMMANDS_####################################################
#echo $PATH; if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi
#python3 /opt/stable-diffusion-webui-forge/launch.py
########################_UNCOMMIT_AND_ADD_TO_'ON_STARTUP'_COMMANDS_####################################################

# Go to root
cd /root

# Clone the repository into a temporary directory 
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git 

# cd into the new repo...
cd /root/stable-diffusion-webui-forge

# now, download the required web-ui script into the current directory...
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# and install requirements.
pip install -r requirements.txt
pip install -r requirements_versions.txt
pip install -r requirements_npu.txt
pip install -r requirements-test.txt

# Most important guy in the room.
-e webui_dir=/root/stable-diffusion-webui-forge
-e models_dir=${webui_dir}/models
-e sd_models_dir=${models_dir}/Stable-diffusion
-e extensions_dir=${webui_dir}/extensions
-e cn_models_dir=${extensions_dir}/sd-webui-controlnet/models
-e vae_models_dir=${models_dir}/VAE
-e upscale_models_dir=${models_dir}/ESRGAN

# throw in some shiny new upscalers...
cd ${ESRGAN}
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
cd ${extensions_dir}
git clone https://github.com/deforum-art/sd-forge-deforum.git

cd ${extensions_dir}/sd-forge-deforum
pip install -r requirements.txt

# change back to forge dir and cleanup...
cd ${webui_dir}
echo $PATH
if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# export all
mkdir /opt/stable-diffusion-webui-forge
cp /root/stable-diffusion-webui-forge /opt/stable-diffusion-webui-forge
cd ${webui_dir}

# dry-run
python3 webui.py

# Execute launch script
python3 launch.py
