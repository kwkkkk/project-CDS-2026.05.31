#!/bin/bash

HOSTNAME=$(hostname)
DISTRO=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p)
LOCAL_IP=$(hostname -I | awk '{print $1}')
GATEWAY=$(ip route | awk '/default/ {print $3}')
COLLECTION_DATE=$(date "+%Y-%m-%d %H:%M:%S")

if command -v curl >/dev/null 2>&1; then
    PUBLIC_IP=$(curl -s ifconfig.me)
else
    PUBLIC_IP="N/A"
fi

cat > tmp/inventory.env << EOF
HOSTNAME="$HOSTNAME"
DISTRO="$DISTRO"
KERNEL="$KERNEL"
ARCH="$ARCH"
UPTIME="$UPTIME"
LOCAL_IP="$LOCAL_IP"
PUBLIC_IP="$PUBLIC_IP"
GATEWAY="$GATEWAY"
COLLECTION_DATE="$COLLECTION_DATE"
EOF

echo "[+] coleta de dados concluída."
echo "[+] dados salvos."
