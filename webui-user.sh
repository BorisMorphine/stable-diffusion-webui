#!/bin/bash

install_dir="workspace/stable-diffusion-webui-forge"

clone_dir="workspace/stable-diffusion-webui"

venv_dir="/opt/micromamba/envs/webui/"

export COMMANDLINE_ARGS="--autostart"

export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

export REQS_FILE="requirements.txt"

export ACCELERATE="True"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
