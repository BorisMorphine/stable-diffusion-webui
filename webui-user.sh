#!/bin/bash
#########################################################
# Uncomment and change the variables below to your need:#
#########################################################

# Name of the subdirectory
clone_dir="stable-diffusion-webui"

# Install directory without trailing slash
#install_dir="/workspace"
install_dir="opt"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
export COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# python3 executable
#python_cmd="python3"

# git executable
export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
venv_dir="/opt/micromamba/envs/webui/"

# script to launch to start the app
export LAUNCH_SCRIPT="launch.py"

# install command for torch
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Requirements file to use for stable-diffusion-webui
export REQS_FILE="requirements.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE="/Home/User/Sync"
#export GFPGAN_PACKAGE="/Home/User/Sync"

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
