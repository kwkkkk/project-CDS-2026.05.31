#!/bin/bash
source tmp/db_datas.env

declare DB_USR="root" 
declare DB_NAME="dados_inventory"

source tmp/inventory.env

echo "[*] enviando dados para $CNT_NAME"
sleep 10

docker exec -i "$CNT_NAME" mysql --user="$DB_USR" --password="$CNT_PASS" --database="$DB_NAME" << EOF
INSERT INTO inventory 
(collection_date, hostname, distro, kernel, arch, uptime, local_ip, public_ip, gateway)
VALUES
('$COLLECTION_DATE', '$HOSTNAME', '$DISTRO', '$KERNEL', '$ARCH', '$UPTIME', '$LOCAL_IP', '$PUBLIC_IP', '$GATEWAY');
EOF

if [ $? -eq 0 ]; then
	echo -e "[+] Os dados foram enviados para o DB central\n execute:"SELECT * FROM inventory" para acessar as informações no DB central..."
	echo "    Container: $CNT_NAME"
        echo "    Hostname: $HOSTNAME"
else
	echo "[-] erro ao enviar os dados ao banco, verifique se não há informações comrrompidas."
fi
