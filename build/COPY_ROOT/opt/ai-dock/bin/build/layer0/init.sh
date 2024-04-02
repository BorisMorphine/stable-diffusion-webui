#!bin/bash

cd /opt

# Get Forge
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge 
install_dir=“/stable-diffusion-webui-forge”

cd ${INSTALL_DIR}
curl https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/webui-user.sh -force webui-user.sh
curl https://raw.githubusercontent.com/BorisMorphine/stable-diffusion-webui/main/build/webui-user.bat -force webui-user.bat

cd /opt
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
A1111_HOME=“stable-diffusion-webui”

cd ${A1111_HOME}
# start service to create python virtual env
./webui.sh

set VENV=“${A1111_HOME}/venv”

cd ${INSTALL_DIR}
sudo bash /webui-user.bat; 
sudo bash /webui-user.sh

rsync -av /opt/stable-diffusion-webui “${INSTALL_DIR}/“ “/${A111_HOME}“
echo "Synced ${A1111_HOME} to ${INSTALL_DIR}”

cd /opt/stable-diffusion-webui
git remote add forge https://github.com/lllyasviel/stable-diffusion-webui-forge
git branch lllyasviel/main
git checkout lllyasviel/main
git fetch forge
git branch -u forge/main
git pull;
git config pull.rebase false

python3 /opt/stable-diffusion-webui launch.py
