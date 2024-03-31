#!/bin/bash

# Check if we are on Debian or Ubuntu for dependency installation
if command -v lsb_release &> /dev/null; then
    if [[ "$(lsb_release -is)" == "Debian" ]] || [[ "$(lsb_release -is)" == "Ubuntu" ]]; then
        echo "Installing dependencies..."
        sudo apt update && sudo apt install -y git-lfs
    else
        echo "This setup script is intended for Debian or Ubuntu systems."
        exit 1  # Exit if not Debian or Ubuntu
    fi
else
    echo "lsb_release command not found. Skipping system-specific dependency checks."
fi

# Assuming micromamba is correctly set up and configured on the system
# Note: This part is specific to Linux and might not work on Git Bash without WSL
if command -v micromamba &> /dev/null; then
    eval "$(micromamba shell hook --shell=bash)"
    micromamba activate webui
else
    echo "Micromamba is not installed or not found in the PATH."
    exit 1
fi

# Directories setup
data_dir="/workspace"
install_dir="/workspace"
clone_dir="${install_dir}/stable-diffusion-webui"
forge_dir="${clone_dir}/stable-diffusion-webui-forge"
sync_dir="${data_dir}/Home/sync"  # Adjusted for consistency

# Sync directory setup - Example using rsync, available in Git Bash
rsync -av "${forge_dir}/" "${sync_dir}/"
echo "Synced ${forge_dir} to ${sync_dir}"

# Configuration for environment and operations
export COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# Configuration for Git and the launch script
export GIT="git"
export LAUNCH_SCRIPT="launch.py"

# Path to the requirements file
export REQS_FILE="${clone_dir}/requirements.txt"

# Command to install PyTorch (adjust as necessary for your setup)
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Navigate to the installation directory and prepare for operations
cd "${clone_dir}" || exit

# Install PyTorch and other dependencies
eval "$TORCH_COMMAND"
pip install -r "$REQS_FILE"

# Ensure the git directory is correctly set before executing git operations
cd "/workspace" || exit
if ! git remote | grep -q stable-diffusion-webui-forge; then
    sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
fi
sudo git fetch forge
sudo git checkout -b lllyasviel-main forge/main || sudo git checkout lllyasviel-main
sudo git config --global pull.rebase false

# Clone IceClear StableSR if the extension doesn't exist
if [ ! -d "${forge_dir}/extensions/StableSR" ]; then
    mkdir -p "${forge_dir}/extensions"
    cd "${forge_dir}/extensions" || exit
    sudo git clone https://github.com/IceClear/StableSR.git
fi

# Clone DeOldify if the extension doesn't exist
if [ ! -d "${forge_dir}/models/DeOldify" ]; then
    mkdir -p "${forge_dir}/models"
    cd "${forge_dir}/models" || exit
    sudo git clone https://github.com/jantic/DeOldify.git
fi

cd ${ESRGAN}
wget -O 4xUltraSharp.pth https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth
wget -O 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
wget -O 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
wget -O 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
wget -O 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
wget -O 1x_GainRESV3_Aggro.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/TlkHjITR
wget -O 1x_GainRESV3_Nautral.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/KxkVEaAQ
wget -O 1x_GainRESV3_Passive.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/H49nEAzI
wget -O 4xNomos8kDAT.pth https://drive.usercontent.google.com/download?id=1JRwXYeuMBIsyeNfsTfeSs7gsHqCZD7x
wget -O 4xLSDIRplus.pth https://github.com/Phhofm/models/blob/main/4xLSDIRplus/4xLSDIRplus.pth
wget -0 BSRGAN https://github.com/cszn/KAIR/releases/download/v1.0/BSRGAN.pth

cd ${ckpt}
wget DreamShaper_v2.1_TURBO_DPM++_SDE https://civitai.com/api/download/models/351306?type=Model&format=SafeTensor&size=full&fp=fp16

cd ${lora}
wget -O weird_lanscape.safetensors https://civitai.com/api/download/models/309330?type=Model&format=SafeTensor
wget -O sheet_of_acid.sadetensors https://civitai.com/api/download/models/145277?type=Model&format=SafeTensor
wget -O gonzo.safetensors https://civitai.com/api/download/models/127015?type=Model&format=SafeTensor

cd ${extensions}/DeOldify/models/Deoldify
wget -O ColorizeArtistic_gen.pth https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth
wget -O ColorizeArtistic_crit https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeArtistic_crit.pth
wget -O ColorizeArtisitic_PretrainOnly.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeArtistic_PretrainOnly_gen.pth
wget -O ColorizeArtistic_PretrainOnly.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeArtistic_PretrainOnly_crit.pth
wget -O ColorizeStable_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeStable_gen.pth
wget -O ColorizeStable_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeStable_crit.pth
wget -O ColorizeStable_PretrainOnly_gen.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeStable_PretrainOnly_gen.pth
wget -O ColorizeStable_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeStable_PretrainOnly_crit.pth
wget -O ColorizeVideo_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeVideo_gen.pth
wget -O ColorizeVideo_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeVideo_crit.pth
wget -O ColorizeVideo_PretrainOnly_gen.pth  https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeVideo_PretrainOnly_gen.pth
wget -O ColorizeVideo_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeVidoe_PretrainOnly_crit.pth
wget -O Deoldify790000.pth https://drive.google.com/uc?export=download&confirm=1&id=1-mxmDF1Dh-PnQqRz_PeCrvsTkHjYCbi3

# Add any additional model download or setup commands here
# Remember to adjust commands for services like Google Drive or Mega as needed

# Final steps or cleanup, if necessary
