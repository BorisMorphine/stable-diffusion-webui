#!/bin/bash

cd /copt
curl -sS https://webi.sh/gh | sh
gh repo clone ashleykleynhans/forge-docker

# Log in to Docker Hub
docker login -u ashleykza -p 

# Build the image, tag the image, and push the image to Docker Hub
cd forge-docker
docker buildx bake -f docker-bake.hcl --push

docker run -d \
  --gpus all \
  -v /workspace \
  -p 3000:3001 \
  -p 8888:8888 \
  -p 2999:2999 \
  -e VENV_PATH="/opts/venvs/stable-diffusion-webui-forge" \
  ashleykza/forge:latest

cd stable-diffusion-webui-forge

webui_dir=/workspace/stable-diffusion-webui-forge
models_dir=${webui_dir}/models
sd_models_dir=${models_dir}/Stable-diffusion
extensions_dir=${webui_dir}/extensions
lora_dir=${models_dir}/Lora
vae_dir=${models_dir}/VAE
esrgan_dir=${models_dir}/ESRGAN

opt/stabe-diffusion-webui/models/ESRGAN


cd ${ESRGAN}
# throw in some shiny new upscalers...
cd ${ESRGAN}
curl -o 4xUltraSharp.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/vRYVhaDA
curl -o 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -o 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
curl -o 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
curl -o Bendel_Halftone.pth https://drive.google.com/uc?export=download&confirm=1&id=1vR_tvWNi8jXhXdmgW5xvWsQp0pXN3ge-
curl -o 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
curl -o 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
curl -o 16xPNSR.pth https://openmodeldb.info/models/16x-PSNR#:~:text=Download%20(64.1,by%20Google%20Drive


cd stable-diffusion-webui-forge/extensisons

# get and install Deforum...
cd ${extensions_dir}
git clone https://github.com/deforum-art/sd-forge-deforum.git

cd ${extensions_dir}/sd-forge-deforum
pip install -r requirements.txt

# change back to forge dir and cleanup...
cd ${webui_dir}
echo $PATH
PIP_PACKAGES=(
    "numpy==1.26.2"
    "onnx==1.15.0"
    "onnxruntime==1.17.1"
    "open-clip-torch==2.20.0"    
    "optree==0.10.0"
    "pytorch-lightning==1.9.4"
    "torch==2.2.0"
    "torchaudio==2.2.0"
    "torchdiffeq==0.2.3"
    "torchmetrics==1.3.2"
    "torchsde==0.2.6"
    "torchvision==0.17.0"
    "triton==2.2.0"
    "pytest-base-url~=2.0"
    "pytest-cov~=4.0"
    "pytest~=7.3"
    "GitPython"
    "Pillow"
    "accelerate"
    "blendmodes"
    "clean-fid"
    "einops"
    "facexlib"
    "fastapi>=0.90.1"
    "gradio==3.41.2"
    "inflection"
    "jsonmerge"
    "kornia"
    "lark"
    "numpy"
    "omegaconf"
    "open-clip-torch"
    "piexif"
    "psutil"
    "pytorch_lightning"
    "requests"
    "resize-right"
    "safetensors"
    "scikit-image>=0.19"
    "tomesd"
    "torch"
    "torchdiffeq"
    "torchsde"
    "transformers==4.30.2"
    "cloudpickle"
    "decorator"
    "synr==0.5.0"
    "tornado"
    "GitPython==3.1.32"
    "Pillow==9.5.0"
    "accelerate==0.21.0"
    "blendmodes==2022"
    "clean-fid==0.1.35"
    "einops==0.4.1"
    "facexlib==0.3.0"
    "fastapi==0.94.0"
    "gradio==3.41.2"
    "httpcore==0.15"
    "inflection==0.5.1"
    "jsonmerge==1.8.0"
    "kornia==0.6.7"
    "lark==1.1.2"
    "numpy==1.26.2"
    "omegaconf==2.2.3"
    "open-clip-torch==2.20.0"
    "piexif==1.1.3"
    "psutil==5.9.5"
    "pytorch_lightning==1.9.4"
    "resize-right==0.0.2"
    "safetensors==0.4.2"
    "scikit-image==0.21.0"
    "spandrel==0.1.6"
    "tomesd==0.1.3"
    "torch"
    "torchdiffeq==0.2.3"
    "torchsde==0.2.6"
    "transformers==4.30.2"
    "httpx==0.24.1"
    "basicsr==1.4.2"
    "diffusers==0.25.0"
  )

# Download the required script into the current directory
curl -sS https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh -o webui-user.sh

# Execute Python script
python3 webui.py

# Run the shell script
sudo bash webui-user.sh
