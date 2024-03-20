#!/bin/bash
# This file will be sourced in init.sh
# Namespace functions with provisioning_

# https://github.com/Roldondo/stable-diffusion-webui/edit/main/config/provisioning/default.sh

### Edit the following arrays to suit your workflow - values must be quoted and separated by newlines or spaces.

DISK_GB_REQUIRED=70

MAMBA_PACKAGES=(
    "package1"
    "package2=version"
  )
  
PIP_PACKAGES=(
    "bitsandbytes==0.41.2.post2"
  )

EXTENSIONS=(
    "https://github.com/Mikubill/sd-webui-controlnet.git"
    "https://github.com/miaoshouai/miaoshouai-assistant.git"
    "https://github.com/Scholar01/sd-webui-mov2mov.git"
    "https://github.com/deforum-art/deforum-for-automatic1111-webui.git"
    "https://github.com/continue-revolution/sd-webui-animatediff.git"
    "https://github.com/volotat/SD-CN-Animation.git"
    "https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper.git"    
)

CHECKPOINT_MODELS=(
    "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    "https://civitai.com/models/101055/sd-xl#:~:text=Model%20SafeTensor%20(6.46%20GB)"
    "https://civitai.com/api/download/models/344540?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors?download=true"
    "https://huggingface.co/RunDiffusion/Juggernaut-XL-Lightning/resolve/main/Juggernaut_RunDiffusionPhoto2_Lightning_4Steps.safetensors?download=true"
    "https://civitai.com/api/download/models/288982?type=Model&format=SafeTensor&size=full&fp=fp16"
)

LORA_MODELS=(
    "https://civitai.com/api/download/models/16576"
    "https://civitai.com/models/124347/xlmoreart-full-xlreal-enhancer?modelVersionId=152309#:~:text=Model%20SafeTensor%20(685.71%20MB)"
    "https://civitai.com/models/229213?modelVersionId=258687"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_mm.ckpt?download=true"
    "https://civitai.com/api/download/models/367245?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    "https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v14.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v15.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v15_v2.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/mm_sdxl_v10_beta.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_PanLeft.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_PanRight.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_RollingAnticlockwise.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_RollingClockwise.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_TiltDown.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_TiltUp.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_ZoomIn.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_ZoomOut.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_adapter.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_mm.ckpt?download=true"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_sparsectrl_rgb.ckpt?download=true"
)

VAE_MODELS=(
    "https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors?download=true"
    "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors?download=true"
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors?download=true"
)

ESRGAN_MODELS=(
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

DIFFUSERS_MODELS=(
    "https://huggingface.co/Iceclear/StableSR/resolve/main/stablesr_turbo.ckpt?download=true"
    "https://huggingface.co/Iceclear/StableSR/resolve/main/stablesr_768v_000139.ckpt?download=true"
    "https://huggingface.co/Iceclear/StableSR/resolve/main/face_vqgan_cfw_00011.ckpt?download=true"
    "https://huggingface.co/Iceclear/StableSR/resolve/main/ldmsr4x_finetune_119.ckpt?download=true"
)

CONTROLNET_MODELS=(
    "https://civitai.com/api/download/models/181335"
    "https://civitai.com/api/download/models/183051?type=Model&format=SafeTensor"
)
    



### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    source https://raw.githubusercontent.com/Roldondo/stable-diffusion-webui/main/config/provisioning/environment.sh
    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_mamba_packages
    provisioning_get_pip_packages
    provisioning_get_extensions
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
     
    PLATFORM_FLAGS=""
    if [[ $XPU_TARGET = "CPU" ]]; then
        PLATFORM_FLAGS="--use-cpu all --skip-torch-cuda-test --no-half"
    fi
    PROVISIONING_FLAGS="--skip-python-version-check --no-download-sd-model --do-not-download-clip --port 11404 --exit"
    FLAGS_COMBINED="${PLATFORM_FLAGS} $(cat /etc/a1111_webui_flags.conf) ${PROVISIONING_FLAGS}"
    
    # Start and exit because webui will probably require a restart
    cd /opt/stable-diffusion-webui && \
    micromamba run -n webui -e LD_PRELOAD=libtcmalloc.so python launch.py \
        ${FLAGS_COMBINED}
    provisioning_print_end
}

function provisioning_get_mamba_packages() {
    if [[ -n $MAMBA_PACKAGES ]]; then
        $MAMBA_INSTALL -n webui ${MAMBA_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
        micromamba run -n webui $PIP_INSTALL ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_extensions() {
    for repo in "${EXTENSIONS[@]}"; do
        dir="${repo##*/}"
        path="/opt/stable-diffusion-webui/extensions/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating extension: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n webui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading extension: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n webui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi
    
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

provisioning_start
