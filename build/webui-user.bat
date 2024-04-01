@echo off

set PYTHON="3.10.14"
set GIT="git"
set VENV_DIR="
set COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --enable-insecure-extension-access --no-half-vae"

set A1111_HOME="/Home/User/Stable-Diffusion-Webui"

set VENV_DIR=%A1111_HOME%/venv
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% ^
--ckpt-dir %A1111_HOME%/models/Stable-diffusion ^
--hypernetwork-dir %A1111_HOME%/models/hypernetworks ^
--embeddings-dir %A1111_HOME%/embeddings ^
--lora-dir %A1111_HOME%/models/Lora

call webui.bat
