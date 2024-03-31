#!/bin/bash

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
