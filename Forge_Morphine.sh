#!/bin/bash
cd /opt
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge
cd stable-diffusion-webui-forge

cd A1111_HOME
sudo git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge.git
git branch lllyasviel/main
git config pull.rebase false
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
sudo git pull 

############
#!/bin/bash
cd stable-diffusion-webui-forge/extensions
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git 
git_branch="gradio4"

# Install common dependencies for video scripts:
pip install opencv-python imageio imageio-ffmpeg onnxruntime pymatting pooch ezsynth

INSTALL_DIR="opt/stable-diffusion-webui"
WORKSPACE_DIRECTORY="/workspace"
VENV_DIR="opt/micromamba/envs/webui"

# Create and activate the virtual environment
source ${VENV_DIR}
micromamba activate webui

export GIT="git"
export LAUNCH_SCRIPT="launch.py"
export REQS_FILE="requirements_versions.txt"
export COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --autolaunch"
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

set Models_dir="${INSTALL_DIR}/models"
set Extensions_dir="${INSTALL_DIR}/extensions"
set Embeddings_dir="${INSTALL_DIR}/embeddings"
set ckpt_dir="${MODELS_DIR}/Stable-Diffusion"
set Lora_dir="${MODELS_DIR}/Lora"
set ESRGAN_dir="${MODELS_DIR}/ESRGAN”



cd ${ckpt_dir}
install git lfs
git clone Deliberate_v.5.safetensors https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5.safetensors

cd ${ESRGAN_dir}
wget -O 4xUltraSharp.pth https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth
wget -O 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O  4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
wget -O 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
wget -O 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
wget -O 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
wget -O 1x_GainRESV3_Aggro.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/TlkHjITR
wget -O 1x_GainRESV3_Nautral.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/KxkVEaAQ
wget -O 1x_GainRESV3_Passive.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/H49nEAzI
wget -O 4xNomos8kDAT.pth https://drive.usercontent.google.com/download?id=1JRwXYeuMBIsyeNfsTfeSs7gsHqCZD7x
wget -O 4xLSDIRplus.pth https://github.com/Phhofm/models/blob/main/4xLSDIRplus/4xLSDIRplus.pth
wget -O BSRGAN https://github.com/cszn/KAIR/releases/download/v1.0/BSRGAN.pth

cd ${lora_dir}
wget -O weird_lanscape.safetensors https://civitai.com/api/download/models/309330?type=Model&format=SafeTensor
wget -O sheet_of_acid.safetensors https://civitai.com/api/download/models/145277?type=Model&format=SafeTensor
wget -O gonzo.safetensors https://civitai.com/api/download/models/127015?type=Model&format=SafeTensor

# Build StableSR
cd ${EXTENSIONS_DIR}
git clone https://github.com/pkuliyi2015/sd-webui-stablesr.git StableSR
git clone https://github.com/amithgc/DeforumStableDiffusion-v0.5-Local.git
git clone https://github.com/Rakile/DeforumationQT.git
git clone https://github.com/s9roll7/ebsynth_utility.git
git clone https://github.com/Scholar01/sd-webui-mov2mov.git
git clone https://github.com/Scholar01/sd-webui-bg-mask.git
git clone https://github.com/BlafKing/sd-civitai-browser-plus.git
git clone https://github.com/feffy380/sd-webui-token-downsampling.git
git clone https://github.com/light-and-ray/sd-webui-replacer.git
git clone https://github.com/volotat/SD-CN-Animation.git

# cd into new directory and download models
cd StableSR/scripts 
git clone https://huggingface.co/Iceclear/StableSR -force scripts

# cd into new directory download models
cd DeOldify/models/deoldify
wget -O ColorizeArtistic_gen.pth https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth
wget -O ColorizeArtistic_crit https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeArtistic_crit.pth
wget -O ColorizeArtisitic_PretrainOnly.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeArtistic_PretrainOnly_gen.pth
wget -O ColorizeArtistic_PretrainOnly.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeArtistic_PretrainOnly_crit.pth
wget -O ColorizeStable_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeStable_gen.pth
wget -O ColorizeStable_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeStable_crit.pth
wget -O ColorizeStable_PretrainOnly_gen.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeStable_PretrainOnly_gen.pth
wget -O ColorizeStable_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeStable_PretrainOnly_crit.pth
wget -O ColorizeVideo_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeVideo_gen.pth
wget -O ColorizeVideo_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeVideo_crit.pth
wget -O ColorizeVideo_PretrainOnly_gen.pth  https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeVideo_PretrainOnly_gen.pth
wget -O ColorizeVideo_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeVidoe_PretrainOnly_crit.pth
wget -O Deoldify790000.pth https://drive.google.com/uc?export=download&confirm=1&id=1-mxmDF1Dh-PnQqRz_PeCrvsTkHjYCbi3


### Step 5 ###
# clean up after yourself
echo $PATH; if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

cd ${INSTALL_DIR}
sudo ./webui.sh
sudo ./${LAUNCH_SCRIPT}
