@echo off

# set env variables
set PYTHON="3.10.14"
set GIT="git"

# clone from:
A1111_HOME="workspace/home/user/stable-diffusion-webui"
VENV_DIR="workspace/home/user/stable-diffusion-webui/venv/"
COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

# Cloning repos into Forge
set VENV_DIR="${A1111_HOME}/venv"
set COMMANDLINE_ARGS=${COMMANDLINE_ARGS}
set MODELS_DIR="${A1111_HOME}/models"
set EMBEDDINGS_DIR="{${A1111_HOME}/embeddings"

# Setting model subdirectories
ckpt_dir="${MODELS_DIR}/Stable-diffusion"
dreambooth-dir="${MODELS_DIR}/dreambooth"
hypernetwork_dir="${MODELS_DIR}/hypernetworks"
lora_dir="${MODELS_DIR}/Lora"
annotators_dir="${MODELS_DIR}/annnotators"
codeformers_dir="${MODELS_DIR}/Codeformer"
deepbooru_dir="${MODELS_DIR}/deepbooru"
gfpgan_dir="${MODELS_DIR}/GFPGAN"
insightface_dir="${MODELS_DIR}/insightface"
karlo_dir="${MODELS_DIR}/karlo"
LDSR_dir="${MODELS_DIR}/LDSR"
swinIR_dir="${MODELS_DIR}/swinIR"
vae_approx_dir="${MODELS_DIR}/VAE-approx"

call webui.bat
