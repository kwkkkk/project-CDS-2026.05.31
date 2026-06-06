#!/bin/bash

declare CONTERINER_NAME="server-data"
declare DB_USR="root" 
declare DB_PASS="@Kawa;"
declare DB_NAME="dados_inventory"

source tmp/inventory.env

docker exec -i "$CONTEINER_NAME" mysql -u "$DB_USR" -p "$DB_PASS" "$DB_NAME" << EOF
INSERT INTO inventory 
(collection_date, hostname, distro, kernel, arch, uptime, local_ip, public_ip, gateway)
VALUES
('$COLLECTION_DATE', '$HOSTNAME', '$DISTRO', '$KERNEL', '$ARCH', '$UPTIME', '$LOCAL_IP', '$PUBLIC_IP', '$GATEWAY');
EOF

if [$? -eq 0]; then
	echo "[+] Os dados foram enviados para o DB central/n execute:"SELECT * FROM inventory" para acessar as informações no DB central..."
	echo "    Container: $CONTAINER_NAME"
        echo "    Hostname: $HOSTNAME"
else
	echo "[-] erro ao enviar os dados ao banco, verifique se não há informações comrrompidas."
fi
