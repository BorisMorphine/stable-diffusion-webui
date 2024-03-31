#!/bin/bash

# Setup environment and configuration for Stable Diffusion WebUI

# Install directory without trailing slash
data_dir="/workspace"
install_dir="/workspace"

# Name of the subdirectory for the clone
clone_dir="stable-diffusion-webui"

# Python3 virtual environment directory without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
venv_dir="${install_dir}/${clone_dir}/venv"

# Define command-line arguments for webui.py
export COMMANDLINE_ARGS="--port 3001 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# Define the git executable environment variable
export GIT="git"

# Define the script to launch to start the app
export LAUNCH_SCRIPT="launch.py"

# Define the install command for torch, adjusting the version and CUDA version as necessary
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Specify the requirements file to use for stable-diffusion-webui
export REQS_FILE="requirements_versions.txt"

# Assuming git clone has been done, setup Python virtual environment, and install dependencies
cd "${install_dir}/${clone_dir}"

# Create Python virtual environment if it doesn't exist
if [ ! -d "$venv_dir" ]; then
    python3 -m venv "$venv_dir"
fi

# Activate the virtual environment
source "${venv_dir}/bin/activate"

# Install PyTorch with specified command
eval "$TORCH_COMMAND"

# Install other dependencies from the requirements file
pip install -r "$REQS_FILE"

# Additional setup steps can go here
# For example, setting up additional model directories or downloading specific models as needed

# Deactivate the virtual environment
# deactivate

# Navigating to the Stable Diffusion WebUI directory
cd /opt/stable-diffusion-webui

# Adding the remote repository if it doesn't already exist
if ! git remote | grep -q forge; then
    sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
fi

# Fetching data from the new remote, including branches
sudo git fetch forge

# Creating a new branch or switching to it if it already exists
sudo git checkout -b lllyasviel-main forge/main || sudo git checkout lllyasviel-main

# Configuring Git to not rebase by default when pulling
sudo git config --global pull.rebase false

# Downloading and executing a script, if not already present
if [ ! -f webui-user.sh ]; then
    sudo wget https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/webui-user.sh
    sudo chmod +x webui-user.sh
    sudo ./webui-user.sh
fi

# Ensuring the annotators directory exists and cloning the Annotators repo into it
if [ ! -d "/opt/stable-diffusion-webui-forge/models/annotators" ]; then
    sudo mkdir -p /opt/stable-diffusion-webui-forge/models/annotators
    cd /opt/stable-diffusion-webui-forge/models/annotators
    sudo git clone https://huggingface.co/lllyasviel/Annotators
fi

# Setting model directory paths as environment variables
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

# Note: For the model download commands using curl and wget, ensure the commands are suitable
# for the hosting service's requirements. Some services may require specific API calls or tokens.

# Example for setting up additional repositories
cd ${controlnet_models_dir}
git lfs install
git clone https://huggingface.co/lllyasviel/sd_control_collection
git clone https://huggingface.co/lllyasviel/fav_models
git clone https://huggingface.co/lllyasviel/control_v11e_sd15_ip2p

# Additional steps for downloading models would be inserted here, using appropriate tools and methods
# for each external service (e.g., Google Drive, Mega).

# Remember to review and adjust commands for downloading models, as direct downloads may not be supported.
