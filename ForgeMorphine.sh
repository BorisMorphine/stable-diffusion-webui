rt #!/bin/bash

# Check if we are on Debian or Ubuntu
if [[ "$(lsb_release -is)" == "Debian" ]] || [[ "$(lsb_release -is)" == "Ubuntu" ]]; then
    echo "Installing dependencies..."
    sudo apt update && sudo apt install -y git-lfs
else
    echo "This setup script is intended for Debian or Ubuntu systems."
    exit 1  # Exit if not Debian or Ubuntu
fi

# Assuming micromamba is correctly set up and configured on the system
eval "$(micromamba shell hook --shell=bash)"
micromamba activate webui

# Directories setup
data_dir="/workspace"
install_dir="/workspace"
clone_dir="${install_dir}/stable-diffusion-webui"
workspace="${clone_dir}/stable-diffusion-webui-forge"

# Sync directory setup
sync_dir="workspace/home/user/Sync"
rsync -av "${workspace}/" "/${sync_dir}/"
echo "Synced ${workspace} to ${sync_dir}"

# Configuration for environment and operations
export COMMANDLINE_ARGS="--port 3001 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# Configuration for Git and the launch script
export GIT="git"
export LAUNCH_SCRIPT="launch.py"

# Path to the requirements file
export REQS_FILE="${clone_dir}/requirements.txt"

# Command to install PyTorch (adjust as necessary for your setup)
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Navigate to the installation directory and prepare the virtual environment
cd "${clone_dir}"

# Install PyTorch and other dependencies
eval "$TORCH_COMMAND"
pip install -r "$REQS_FILE"

# Git operations for Stable Diffusion WebUI fork
if ! git remote | grep -q forge; then
    sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
fi
sudo git fetch forge
sudo git checkout -b lllyasviel-main forge/main || sudo git checkout lllyasviel-main
sudo git config --global pull.rebase false

fi
# Clone IceClear StableSR if the extension doesn't exist
if [ ! -d "/workspace/stable-diffusion-webui-forge/extensions/StableSR" ]; then
    cd opt/stable-diffusion-webui-forge/extensions/
    sudo git clone https://github.com/IceClear/StableSR.git
fi

# Clone DeOldify if the extension doesn't exist
if [ ! -d "/workspace/stable-diffusion-webui-forge/models/DeOldify" ]; then
    cd opt/stable-diffusion-webui-forge/extensions/
    sudo git clone https://github.com/jantic/DeOldify.git

# Set environment variables for directories
export extensions="${data_dir}/extensions"
export embeddings="${data_dir}/embeddings"
export models="${data_dir}/models"
export ckpt="${models}/Stable-diffusion"
export lora="${models}/Lora"
export vae="${models}/VAE"
export hypernetworks="${models}/hypernetworks"
export ESRGAN="${models}/ESRGAN"

# Set environment variables for model directories
annotators_dir="${models}/annnotators"
codeformers_dir="${models}/Codeformer"
controlnet_dir="${models}/ControlNet"
deepbooru_dir="${models}/deepbooru"
dreambooth_dir="${models}/dreambooth"
gfpgan_dir="${models}/GFPGAN"
insightface_dir="${models}/insightface"
karlo_dir="${models}/models/karlo"
LDSR_dir="${models}/LDSR"
swinIR_dir="${models}/swinIR"
vae_approx_dir="${models}/VAE-approx"

# Setup additional repositories (ensure you're in the correct directory for these operations)
install git lfs
cd ${controlnet_dir}
git lfs
git clone Deliberate_v.5.safetensors https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5.safetensors
git lfs
git clone Deliberate_v.5.safetensors https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5.safetensors
https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5-inpainting.safetensors

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
wget https://huggingface.co/stabilityai/sdxl-turbo/blob/main/sd_xl_turbo_1.0.safetensors

cd ${lora}
wget -O weird_lanscape.safetensors https://civitai.com/api/download/models/309330?type=Model&format=SafeTensor
wget -O sheet_of_acid.sadetensors https://civitai.com/api/download/models/145277?type=Model&format=SafeTensor
wget -O gonzo.safetensors https://civitai.com/api/download/models/127015?type=Model&format=SafeTensor

# Build StableSR
cd ${extensions}
git clone https://github.com/pkuliyi2015/sd-webui-stablesr.git
cd /scripts
wget -O stablesr_turbo.ckpt https://huggingface.co/Iceclear/StableSR/blob/main/stablesr_turbo.ckpt

# Build DeOldify
cd ${extensions}
git clone https://github.com/SpenserCai/modles/sd-webui-deoldify.git
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
