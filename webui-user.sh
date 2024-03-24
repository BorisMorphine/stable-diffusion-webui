#!/bin/bash

install_dir="/opt"

clone_dir="/opt/stable-diffusion-webui-forge"

venv_dir="/opt/micromamba/envs/webui"

export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

export REQS_FILE="/stable-diffusion-webui-forge/requirements.txt"

# Fixed git repos
export K_DIFFUSION_PACKAGE="pip install k-diffusion"
export GFPGAN_PACKAGE="pip install gfpgan"
export GFPGAN_PATCH="pip install gfpgan"
export SD_KIT="pip install sdkit"

export COMMANDLINE_ARGS="
--ckpt-dir /opt/stable-diffusion-webui-forge/models/ckpt
--hypernetwork-dir /opt/stable-diffusion-webui-forge/models/hypernetworks
--embeddings-dir /opt/stable-diffusion-webui-forge/embeddings
--lora-dir /opt/stable-diffusion-webui-forge/models/lora
--esrgan-dir /opt/storage/stable_diffusion/models/esrgan
--reinstall-x-formers
--xformers
--autostart
"

#export ACCELERATE="True"

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
