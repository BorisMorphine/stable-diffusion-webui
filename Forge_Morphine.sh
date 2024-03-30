########################__FLAG__##############################################################
#—-config https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh
##############################################################################################
#!/bin/bash

sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
git branch lllyasviel/main
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
git pull

sudo apt install nano -y
nano /workspace/stable-diffusion-webui/ui-config.json

{
  "txt2img/Width/maximum": 8192,
  "txt2img/Height/maximum": 8192,
}

cd /
pip install opencv-python imageio imageio-ffmpeg onnxruntime pymatting pooch ezsynth GitPython Pillow accelerate blendmodes clean-fid einops facexlib fastapi>=0.90.1 gradio==3.41.2 inflection jsonmerge kornia lark numpy omegaconf open-clip-torch piexif psutil pytorch_lightning requests resize-right safetensors scikit-image>=0.19 tomesd torch torchdiffeq torchsde transformers==4.30.2 pytest-base-url~=2.0 pytest-cov~=4.0 pytest~=7.3 cloudpickle decorator synr==0.5.0 tornado

cd /extensions
git remote add animateddiff https://github.com/continue-revolution/sd-forge-animatediff
git branch forge-master
git checkout forge-master
git fetch forge
git branch -u forge-master
git pull

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
set vae_approx_models_dir="/opt/stable-diffusion-webui/models/VAE-approx"

cd workspace/stable-diffusion-webui/models/
mkdir annotators
cd annotators
git clone https://huggingface.co/lllyasviel/Annotators

cd ${esrgan_models_dir}
curl -o 4xUltraSharp.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/vRYVhaDA
curl -o 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
curl -o 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
curl -o Bendel_Halftone.pth https://drive.google.com/uc?export=download&confirm=1&id=1vR_tvWNi8jXhXdmgW5xvWsQp0pXN3ge-
curl -o 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
curl -o 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth
Copied!

cd ${Lora_models_dir}
https://civitai.com/models/292351
https://civitai.com/models/234351
https://civitai.com/models/274425
https://civitai.com/models/187082
https://civitai.com/models/263993
https://civitai.com/models/335970

cd ${controlnet_models_dir}
git lfs install
git clone https://huggingface.co/lllyasviel/sd_control_collection/tree/main
git clone https://huggingface.co/lllyasviel/fav_models
git clone https://huggingface.co/lllyasviel/control_v11e_sd15_ip2p
