#!/bin/bash

#!/bin/bash

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

# Path to the requirements file
REQS_FILE="${clone_dir}/requirements.txt"

# Sync directory setup
sync_dir="/home/user/Sync"
rsync -av "${workspace}/" "${sync_dir}/"
echo "Synced ${workspace} to ${sync_dir}"

# Configuration for environment and operations
export COMMANDLINE_ARGS="--port 3001 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# Configuration for Git and the launch script
export GIT="git"
export LAUNCH_SCRIPT="launch.py"

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

# Clone Annotators if the directory doesn't exist
if [ ! -d "/opt/stable-diffusion-webui-forge/models/annotators" ]; then
    sudo mkdir -p /opt/stable-diffusion-webui-forge/models/annotators
    cd /opt/stable-diffusion-webui-forge/models/annotators
    sudo git clone https://huggingface.co/lllyasviel/Annotators
fi

# Set environment variables for model directories
export annotators_models_dir="/opt/stable-diffusion-webui/models/annotators"
export annotators_models_dir="/opt/stable-diffusion-webui/models/annotators"
export safetensors_models_dir="/opt/stable-diffusion-webui/models/Stable-diffusion"
export codeformer_models_dir="/opt/stable-diffusion-webui/models/Codeformer"
export controlnet_models_dir="/opt/stable-diffusion-webui/models/ControlNet"
export deepbooru_models_dir="/opt/stable-diffusion-webui/models/deepbooru"
export dreambooth_models_dir="/opt/stable-diffusion-webui/models/dreambooth"
export esrgan_models_dir="/opt/stable-diffusion-webui/models/ESRGAN"
export gfpga_models_dir="/opt/stable-diffusion-webui/models/GFPGAN"
export hypernetworks_models_dir="/opt/stable-diffusion-webui/models/hypernetworks"
export insightface_models_dir="/opt/stable-diffusion-webui/models/insightface"
export karlo_models_dir="/opt/stable-diffusion-webui/models/karlo"
export ldsr_models_dir="/opt/stable-diffusion-webui/models/LDSR"
export lora_models_dir="/opt/stable-diffusion-webui/models/Lora"
export reactor_models_dir="/opt/stable-diffusion-webui/models/reactor"
export swinIR_models_dir="/opt/stable-diffusion-webui/models/swinIR"
export vae_models_dir="/opt/stable-diffusion-webui/models/VAE"
export vae_approx_models_dir="/opt/stable-diffusion-webui/models/VAE-approx"

# Setup additional repositories (ensure you're in the correct directory for these operations)
install git lfs
cd ${controlnet_models_dir}
git lfs install
git clone https://huggingface.co/lllyasviel/sd_control_collection
git clone https://huggingface.co/lllyasviel/fav_models
git clone https://huggingface.co/lllyasviel/control_v11e_sd15_ip2p

# Add any additional model download or setup commands here
# Remember to adjust commands for services like Google Drive or Mega as needed

# Final steps or cleanup, if necessary
