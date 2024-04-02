#!bin/bash
cd /opt
export DATA_DIR=“/opt”

git clone https://github.com/lllyasviel/stable-diffusion-webui-forge 
cd stable-diffusion-webui-forge
export GIT="git"
export LAUNCH_SCRIPT="launch.py"
export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"
export REQS_FILE="requirements_versions.txt"
export VENV_DIR=“opt/micromamba/envs/webui”
export COMMANDLINE_ARGS="--port 7860 --listen --api --xformers --autolaunch”
export INSTALL_DIR=“${DATA_DIR}/stable-diffusion-webui-forge”

export CLONE_DIR=“${DATA_DIR}/stable-diffusion-webui"
export A1111_HOME=“${CLONE_DIR}”

cd ${A1111_HOME}
git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
git branch lllyasviel/main
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
git pull && git config pull.rebase false

# Sync
rsync -av “${A1111_HOME}/“ “${INSTALL_DIR}/“
echo "Synced A1111 to WebUI-Forge”

### Step 3 ###
Models_dir=“${INSTALL_DIR}/models”
Extensions_dir=“${INSTALL_DIR}/extensions”
Embeddings_dir=“${INSTALL_DIR}/embeddings”
Safetensors_dir=“${MODELS_DIR}/Stable-Diffusion}
Lora_dir=“${MODELS_DIR}/Lora”
ESRGAN_dir=“${MODELS_DIR}/ESRGAN”

cd ${ckpt_dir}
install git lfs
wget https://huggingface.co/stabilityai/sdxl-turbo/blob/main/sd_xl_turbo_1.0.safetensors
git clone Deliberate_v.5.safetensors https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5.safetensors

cd ${ESRGAN_dir}
curl -O 4xUltraSharp.pth https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth
curl -O 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -O 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
curl -O 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
curl -O 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
curl -O 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
curl -O 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
curl -O 1x_GainRESV3_Aggro.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/TlkHjITR
curl -O 1x_GainRESV3_Nautral.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/KxkVEaAQ
curl -O 1x_GainRESV3_Passive.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/H49nEAzI
curl -O 4xNomos8kDAT.pth https://drive.usercontent.google.com/download?id=1JRwXYeuMBIsyeNfsTfeSs7gsHqCZD7x
curl -O 4xLSDIRplus.pth https://github.com/Phhofm/models/blob/main/4xLSDIRplus/4xLSDIRplus.pth
curl -0 BSRGAN https://github.com/cszn/KAIR/releases/download/v1.0/BSRGAN.pth

cd ${lora_dir}
curl -O weird_lanscape.safetensors https://civitai.com/api/download/models/309330?type=Model&format=SafeTensor
curl -O sheet_of_acid.safetensors https://civitai.com/api/download/models/145277?type=Model&format=SafeTensor
curl -O gonzo.safetensors https://civitai.com/api/download/models/127015?type=Model&format=SafeTensor

# Build StableSR
cd ${EXTENSIONS_DIR}
git clone https://github.com/pkuliyi2015/sd-webui-stablesr.git StableSR

# cd into new directory and download models
cd StableSR/scripts 
git lfs clone https://huggingface.co/Iceclear/StableSR -force scripts

# Build DeOldify
cd ${EXTENSIONS_DIR}
git clone https://github.com/SpenserCai/sd-webui-deoldify.git DeOldify

# cd into new directory download models
cd DeOldify/models/deoldify
curl -O ColorizeArtistic_gen.pth https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth
curl -O ColorizeArtistic_crit https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeArtistic_crit.pth
curl -O ColorizeArtisitic_PretrainOnly.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeArtistic_PretrainOnly_gen.pth
curl -O ColorizeArtistic_PretrainOnly.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeArtistic_PretrainOnly_crit.pth
curl -O ColorizeStable_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeStable_gen.pth
curl -O ColorizeStable_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeStable_crit.pth
curl -O ColorizeStable_PretrainOnly_gen.pth https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeStable_PretrainOnly_gen.pth
curl -O ColorizeStable_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeStable_PretrainOnly_crit.pth
curl -O ColorizeVideo_gen.pth https://www.dropbox.com/s/axsd2g85uyixaho/ColorizeVideo_gen.pth
curl -O ColorizeVideo_crit.pth https://www.dropbox.com/s/xpq2ip9occuzgen/ColorizeVideo_crit.pth
curl -O ColorizeVideo_PretrainOnly_gen.pth  https://www.dropbox.com/s/h782d1zar3vdblw/ColorizeVideo_PretrainOnly_gen.pth
curl -O ColorizeVideo_PretrainOnly_crit.pth https://www.dropbox.com/s/gr81b3pkidwlrc7/ColorizeVidoe_PretrainOnly_crit.pth
curl -O Deoldify790000.pth https://drive.google.com/uc?export=download&confirm=1&id=1-mxmDF1Dh-PnQqRz_PeCrvsTkHjYCbi3

# get some video making extensions
cd ${EXTENSIONS_DIR}

# Install common dependencies for video scripts:
pip install opencv-python imageio imageio-ffmpeg onnxruntime pymatting pooch ezsynth

#get repos
git clone https://github.com/s9roll7/ebsynth_utility.git
git clone https://github.com/Scholar01/sd-webui-mov2mov.git
git clone https://github.com/Scholar01/sd-webui-bg-mask.git

# get misc. extensions:
git clone https://github.com/BlafKing/sd-civitai-browser-plus.git
git clone https://github.com/feffy380/sd-webui-token-downsampling.git
git clone https://github.com/light-and-ray/sd-webui-replacer.git
git clone https://github.com/volotat/SD-CN-Animation.git
git clone https://github.com/miaoshouai/miaoshouai-assistant.git
git clone https://github.com/tritant/sd-webui-creaprompt.git

### Step 5 ###
# clean up after yourself
echo $PATH; if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# Create and activate the virtual environment
source ${VENV_DIR}
micromamba activate webui

cd ${INSTALL_DIR}
sudo ./webui.sh
sudo ./${LAUNCH_SCRIPT}
