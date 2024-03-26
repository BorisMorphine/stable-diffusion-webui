#!/bin/bash
#########################_JUPYTER_###########################
####-e DATA_DIRECTORY=/workspace/ -e JUPYTER_DIR=/ -e JUPYTER_PASSWORD=password -e PROVISIONING_SCRIPT="https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/Forge_Morphine.sh"  -e WEBUI_FLAGS="--xformers --port 3001 --listen --api --deforuem-api --no-half-controlnet" -p 22:22 -p 1111:1111 -p 7860:7860 -p 8888:8888 -e OPEN_BUTTON_TOKEN=1 -e OPEN_BUTTON_PORT=1111

# Install directory without trailing slash
install_dir="/workspace"

data_dir="/workspace"

# Name of the subdirectory
clone_dir="forge"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
export COMMANDLINE_ARGS="--port 3001 --listen --api —-data-dir /workspace —-subpath /forge --xformers --enable-insecure-extension-access --no-half-vae

# python3 executable
#python_cmd="python3"

# git executable
export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
venv_dir="/workspace/venv"

# script to launch to start the app
export LAUNCH_SCRIPT="launch.py"

# install command for torch
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Requirements file to use for stable-diffusion-webui
export REQS_FILE="requirements_versions.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
