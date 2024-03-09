#!/bin/false

build_cpu_main() {
    build_cpu_install_webui_forge
}

build_cpu_install_webui() {
    /opt/ai-dock/bin/update-webui-forge.sh
}

build_cpu_main "$@"
