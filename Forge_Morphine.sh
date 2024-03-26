########################__FLAG__##############################################################
#—-config https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/webui-user.sh
##############################################################################################
#!/bin/bash

cd /
pip install opencv-python imageio imageio-ffmpeg onnxruntime pymatting pooch ezsynth GitPython Pillow accelerate blendmodes clean-fid einops facexlib fastapi>=0.90.1 gradio==3.41.2 inflection jsonmerge kornia lark numpy omegaconf open-clip-torch piexif psutil pytorch_lightning requests resize-right safetensors scikit-image>=0.19 tomesd torch torchdiffeq torchsde transformers==4.30.2 pytest-base-url~=2.0 pytest-cov~=4.0 pytest~=7.3 cloudpickle decorator synr==0.5.0 tornado

cd /workspace
git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
git branch lllyasviel/main
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
git pull

cd /extensions
git remote add animateddiff https://github.com/continue-revolution/sd-forge-animatediff
git branch forge-master
git checkout forge-master
git fetch forge
git branch -u forge-master
git pull

cd /workspace/forge/extensions
git clone Deforum https://github.com/deforum-art/sd-forge-deforum.git
cd Deforum
pip install -r requirements.txt

cd /workspace/forge/extensions
git clone ControlNet https://github.com/lllyasviel/ControlNet-v1-1-nightly.git
cd/ControlNet
git lfs install
git clone https://huggingface.co/lllyasviel/sd_control_collection

cd /workspace/forge
wget -O https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/heavy-user.sh sudo | bash
python3 launch.py

