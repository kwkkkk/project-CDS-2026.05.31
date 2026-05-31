#!/bin/bash

source tmp/inventory.env
REPORT_FILE="output/$(date +%Y-%m-%d_%H-%M-%S).md"

cat > output/inventory.md << EOF
# Relatório de Inventário

Data da coleta: $COLLECTION_DATE

## Sistema

Hostname: $HOSTNAME

Distribuição: $DISTRO

Kernel: $KERNEL

Arquitetura: $ARCH

Uptime: $UPTIME

## Rede

IP Local: $LOCAL_IP

IP Público: $PUBLIC_IP

Gateway: $GATEWAY
EOF

echo "[+] Relatório gerado:"
echo "    $REPORT_FILE"
