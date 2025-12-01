#!/bin/sh

createConfig() {
    echo "[HELPER] Updating Config File"
    cp "/home/ioq3srv/defaults/q3config_server.cfg" "/home/ioq3srv/.config/Quake3/baseq3/q3config_server.cfg"
}

updateConfig() {
    key="$1"
    value="$2"

    echo "[HELPER] Updating properties of ${key}"

    esc_value=$(printf '%s\n' "${value}" | sed 's/[\/&]/\\&/g')
    sed -i "s/^seta[[:space:]]\+${key}[[:space:]]\+\"[^\"]*\"/seta ${key} \"${esc_value}\"/" "/home/ioq3srv/.config/Quake3/baseq3/q3config_server.cfg"

}

processEnviromentVariables() {
    env | while IFS='=' read -r key value; do

        case "${key}" in

        g_* | cm_* | net_* | sv_* | vm_* | com_* | capturelimit | timelimit | fraglimit | dmflags)

            if [ -n "${value}" ]; then
                updateConfig "${key}" "${value}"
            fi
            ;;

        esac

    done
}

createConfig
processEnviromentVariables
