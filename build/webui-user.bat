@echo off

set PYTHON="3.10.14"
set GIT=
set VENV_DIR=/workspace/stable-diffusion-webui/
set COMMANDLINE_ARGS=

@set A1111_HOME=/opt/stable-diffusion-webui/
set VENV_DIR=/worksapce/stable-diffusion-webui/
set COMMANDLINE_ARGS="--xformers --enable-insecure-extension-access --api --deforum-api" ^
--ckpt-dir /opt/storage/stable_diffusion/models/ckpt ^
--hypernetwork-dir /opt/storage/stable_diffusion/models/hypernetworks ^
--embeddings-dir /opt/storage/stable_diffusion/models//embeddings ^
--lora-dir /opt/storage/stable_diffusion/models/models/Lora

call webui.bat
