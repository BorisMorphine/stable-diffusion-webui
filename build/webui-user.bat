@echo off

set PYTHON="3.10.14"
set GIT=
set VENV_DIR=/workspace/stable-diffusion-webui/
set COMMANDLINE_ARGS="--reinstall-torch"

set A1111_HOME=/opt/stable-diffusion-webui/
set VENV_DIR=/workspace/stable-diffusion-webui/
set COMMANDLINE_ARGS="--xformers --enable-insecure-extension-access --api --deforum-api"
set ckpt-dir /opt/storage/stable_diffusion/models/ckpt
set hypernetwork-dir /opt/storage/stable_diffusion/models/hypernetworks
set embeddings-dir /opt/storage/stable_diffusion/models//embeddings
set lora-dir /opt/storage/stable_diffusion/models/models/Lora

call webui.bat
