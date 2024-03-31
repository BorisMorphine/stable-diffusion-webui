#!/bin/bash

cd /opt/stable-diffusion-webui
sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
sudo git branch lllyasviel/main
sudo git checkout lllyasviel/main
sudo git fetch forge
sudo git branch -u forge/main
sudo git pull

sudo git config --global pull.rebase true

sudo wget bash https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/webui-user.sh

cd /
sudo pip install opencv-python imageio imageio-ffmpeg onnxruntime pymatting pooch ezsynth GitPython Pillow accelerate blendmodes clean-fid einops facexlib fastapi>=0.90.1 gradio==3.41.2 inflection jsonmerge kornia lark numpy omegaconf open-clip-torch piexif psutil pytorch_lightning requests resize-right safetensors scikit-image>=0.19 tomesd torch torchdiffeq torchsde transformers==4.30.2 pytest-base-url~=2.0 pytest-cov~=4.0 pytest~=7.3 cloudpickle decorator synr==0.5.0 tornado

cd /opt/stable-diffusion-webui-forge/models
sudo mkdir annotators
cd annotators
sudo git clone https://huggingface.co/lllyasviel/Annotators

# Setting download directory paths: 
set annotators_models_dir="/workspace/stable-diffusion-webui/models/annotators"
set safetensors_models_dir="/workspace/stable-diffusion-webui/models/Stable-diffusion"
set codeformer_models_dir="/workspace/stable-diffusion-webui/models/Codeformer"
set controlnet_models_dir="/workspace/stable-diffusion-webui/models/ControlNet"
set deepbooru_models_dir="/workspace/stable-diffusion-webui/models/deepbooru"
set dreambooth_models_dir="/workspace/stable-diffusion-webui/models/dreambooth"
set esrgan_models_dir="/workspace/stable-diffusion-webui/models/ESRGAN"
set gfpga_models_dir="/opt/stable-diffusion-webui/models/GFPGAN"
set hypernetworks_models_dir="/opt/stable-diffusion-webui/models/hypernetworks"
set insightface_models_dir="/opt/stable-diffusion-webui/models/insightface"
set karlo_models_dir="/opt/stable-diffusion-webui/models/karlo"
set ldsr_models_dir="/opt/stable-diffusion-webui/models/LDSR"
set lora_models_dir="/opt/stable-diffusion-webui/models/Lora"
set reactor_models_dir="/opt/stable-diffusion-webui/models/reactor"
set swinIR_modles_dir="/opt/stable-diffusion-webui/models/swinIR"
set vae_models_dir="/opt/stable-diffusion-webui/models/VAE"
set vae_approx_models_dir="/opt/stable-diffusion-webui/models/VAE-approx

cd ${esrgan_models_dir}
curl -O 4xUltraSharp.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/vRYVhaDA
curl -O 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -O 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -O 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
curl -O 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
curl -O Bendel_Halftone.pth https://drive.google.com/uc?export=download&confirm=1&id=1vR_tvWNi8jXhXdmgW5xvWsQp0pXN3ge-
curl -O 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
curl -O 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
curl -O https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth

cd ${Lora_models_dir}
wget https://civitai.com/models/292351
wget https://civitai.com/models/234351
wget https://civitai.com/models/274425
wget https://civitai.com/models/187082
wget https://civitai.com/models/263993
wget https://civitai.com/models/335970

cd ${controlnet_models_dir}
git lfs install
git clone https://huggingface.co/lllyasviel/sd_control_collection/tree/main
git clone https://huggingface.co/lllyasviel/fav_models
git clone https://huggingface.co/lllyasviel/control_v11e_sd15_ip2p
