###################################################
#Step 0: Smuggle in this script and execute via CLI
###################################################
#cd /opt/stable-diffusion-webui/
#sudo curl -O webui-macos-env.sh https://raw.githubusercontent.com/BorisMorphine/aarrgghhhh/main/config/provisioning/webui-user.sh
#chmod +x webui-macos-env.sh
#./webui-macos-env.sh
###################################################
!#bin/bash

### Step 1 ###
# Setup Your Home 
cd /Home/User/

# Get A1111
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# start service to create python virtual env
./webui.sh

### Step 2 ###

# Get Forge
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge

# update webui-user.sh
sudo curl -O webui-user.sh https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/webui-user.sh

# update webui-user.bat
sudo curl -O https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/build/webui-user.bat

# Set global variable
git config --global pull.rebase false

# cd to main repo and clone Forge
cd /workspace/stable-diffusion-webui/
git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
git branch lllyasviel/main
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
git pull 

### Step 3 ###

# cd back into Forge via Workspace and update user docs
cd /workspace/home/user/stable-diffusuion-webui-forge/

# create new user env
./webui-user.sh

# redirect A1111 repos to Forge
./webui-user.bat

# run service to commit changes 
./webui.sh

### Step 4 ###

cd ${controlnet_dir}
install git lfs
git lfs clone Deliberate_v.5.safetensors https://huggingface.co/XpucT/Deliberate/blob/main/Deliberate_v5.safetensors

cd ${ESRGAN_dir}
wget -O 4xUltraSharp.pth https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth
wget -O 4xUltraMix_Balanced.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O 4xUltraMix_Restore.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/KBJRBQyR
wget -O 4xUltraMix_Smooth.pth https://mega.nz/folder/qZRBmaIY#nIG8KyWFcGNTuMX_XNbJ_g/file/PIRDEYgT
wget -O 4x-FSDedither.pth https://drive.google.com/uc?export=download&confirm=1&id=1H4KQyhcknOoExjvDdsoxAgTBMO7JuJ3w
wget -O 8xESRGAN.pth https://icedrive.net/1/43GNBihZyi
wget -O 16xESRGAN.pth https://objectstorage.us-phoenix-1.oraclecloud.com/n/ax6ygfvpvzka/b/open-modeldb-files/o/16x-ESRGAN.pth
wget -O 1x_GainRESV3_Aggro.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/TlkHjITR
wget -O 1x_GainRESV3_Nautral.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/KxkVEaAQ
wget -O 1x_GainRESV3_Passive.pth https://mega.nz/folder/yg0lHQoJ#sP8_BfDk2YlshFjOL9Qrtg/file/H49nEAzI
wget -O 4xNomos8kDAT.pth https://drive.usercontent.google.com/download?id=1JRwXYeuMBIsyeNfsTfeSs7gsHqCZD7x
wget -O 4xLSDIRplus.pth https://github.com/Phhofm/models/blob/main/4xLSDIRplus/4xLSDIRplus.pth
wget -0 BSRGAN https://github.com/cszn/KAIR/releases/download/v1.0/BSRGAN.pth

cd ${ckpt_dir}
wget https://huggingface.co/stabilityai/sdxl-turbo/blob/main/sd_xl_turbo_1.0.safetensors

cd ${lora_dir}
wget -O weird_lanscape.safetensors https://civitai.com/api/download/models/309330?type=Model&format=SafeTensor
wget -O sheet_of_acid.safetensors https://civitai.com/api/download/models/145277?type=Model&format=SafeTensor
wget -O gonzo.safetensors https://civitai.com/api/download/models/127015?type=Model&format=SafeTensor

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

# clean up after yourself
echo $PATH; if [ -z "${PATH-}" ]; then export PATH=/workspace/home/user/.local/bin; fi

# return home
cd /home/user/stable-diffusion-webui-forge/

# Run Stable Diffusion WebUI Forge
${LAUNCH_SCRIPT} sudo | bash 
