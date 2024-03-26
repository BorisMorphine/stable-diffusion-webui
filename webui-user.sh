#!/bin/bash

export REQS_FILE="/opt/stable-diffusion-webui/requirements.txt; requirements_versions.txt; requirements_npu.txt; requirements-test.txt"

export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Fixed git repos
export K_DIFFUSION_PACKAGE="pip install k-diffusion"
export GFPGAN_PACKAGE="pip install gfpgan"
export GFPGAN_PATCH="pip install gfpgan"
export SD_KIT="pip install sdkit"

export COMMANDLINE_ARGS="
--data-dir /opt/stable-diffusion-webui
"

#export ACCELERATE="True"

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
