#!/sbin/sh

configfile=/tmp/compatible.cfg
device_supported=0

# Setup Busybox
cp /tmp/aroma/busybox /tmp/busybox
chmod 777 /tmp/busybox

append_to_file() {
    local content="$1"
    echo "$content" >>"$configfile"
}
is_substring() {
    local substring=$1
    local string=$2

    case "$string" in
    *"$substring"*) return 0 ;;
    *) return 1 ;;
    esac
}

rm -f $configfile
touch $configfile

bootloader=$(getprop ro.boot.bootloader)

# Device Checks
if [ -z "$bootloader" ]; then
    echo "Installer: Employing Alternative Detection Methods"
    bootloader=$(/tmp/busybox sed -n 's/.*androidboot.bootloader=\([^[:space:]]*\).*/\1/p' /proc/cmdline)

fi

device="A105"
device_alt="a10"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1

fi

device="A205"
device_alt="a20"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1

fi

device="A202"
device_alt="a20e"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1

fi

device="A305"
device_alt="a30"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1
fi

device="A307"
device_alt="a30s"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1
fi

device="A405"
device_alt="a40"
if is_substring "$device" "$bootloader"; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#00ff00>Detected as : Galaxy $device </#>"
    append_to_file "device_id=$device"
    append_to_file "device_id_alt=$device_alt"
    append_to_file "is_7904=1"
    device_supported="1"
    exit 1
fi

if [ "$device_supported" == "0" ]; then
    echo "    -> Bootloader  : $bootloader"
    echo "    -> <#ff0000>UNKNOWN DEVICE</#>"
    exit 55
fi
exit 1
