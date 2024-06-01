#!/bin/bash

curl -sS https://webi.sh/gh | sh

set opt="/opt"
set rq1="{$opt_dir}/stable-stable-diffusion-webui/requirements.txt" 
set rq3="{$opt_dir}/stable-stable-diffusion-webui/requirements_versions.txt" 
set rq5="{$opt_dir}/stable-stable-diffusion-webui/requirements_npu.txt" 
set rq7="{$opt_dir}/stable-stable-diffusion-webui/requirements-test.tx"

set workspace="/workspace"
set rq2="{$workspace_dir}/stable-diffusion-webui/requirements.txt" 
set rq4="{$workspace_dir}/stable-diffusion-webui/requirements_versions.txt"
set rq6="{$workspace_dir}/stable-diffusion-webui/requirements_npu.txt" 
set rq8="{$workspace_dir}/stable-stable-diffusion-webui/requirements-test.txt"

set base="/stable-diffusion-webui"
set data_1="[${opt}/${base}]"
set data_2="[${workspace}/${base}]"
set data_dir="[${data_1}+${data_2}]"

set clone_dir="/stable-diffusion-webui-forge"
set install_dir="[${data_dir}/${clone_dir}]/extensions"
set A1111_home="${install_dir}/stable-diffusion-webui-forge"
set webui_dir="${A1111_home}"

cd ${webui_dir}
set models_dir="${storage_dir}/models"
set sd_models_dir="${models_dir}/Stable-diffusion"
set extensions_dir="${webui_dir}/extensions"
set vae_models_dir="${models_dir}/VAE"
set upscale_models_dir="${models_dir}/ESRGAN"

cd ${extensions_dir}
git clone https://github.com/deforum-art/sd-forge-deforum.git

# change back to main dir and cleanup...
cd ${webui_dir}
echo $PATH
if [ -z ${PATH-} ]; then export PATH=/workspace/home/user/.local/bin; fi

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

# get and install Deforum...
cd ${extensions_dir}
git clone https://github.com/deforum-art/sd-forge-deforum.git
cd /sd-forge-deforum
set r9="requirements.txt"

set requirements=[${r9},${r9},${r7},${r6},${r5},${r5},${r3},${r2},${r1}]
python3 pip install ${requirements}

# change back to forge dir and cleanup...
cd ${webui_dir}
echo $PATH
if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# dry-run
python3 webui.py 

# Execute Python script
python3 launch.py
