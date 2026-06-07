#!/bin/bash

declare CTN_NAME
declare CTN_PASS 
declare CTN_PORT
declare CONF_DECISAO

clear

echo "<------------------MYSQL SERVER GENERATION------------------>"
echo -n "Qual o nome do conteiner? "
read CTN_NAME
echo -n "Qual senha deseja usar? "
read CTN_PASS
echo -n "Qual a porta? "
read CTN_PORT

clear && sleep 1

echo "<<<<<<Gerando o Conteiner.>>>>>>"
docker run -d \
--name "$CTN_NAME" \
-e MYSQL_ROOT_PASSWORD="$CTN_PASS" \
-p "$CTN_PORT":3306 \
mysql:latest

if [ $? -eq 0 ]; then
	echo "[+] conteiner criado com sucesso."
	echo "[!] use o comando: "
	echo "    docker exec -it $CTN_NAME mysql -u root -p"

	echo -n  "Deseja utilizar o método de configuração automática?<Y\n> "
	read -r CONF_DECISAO

	if [[ "$CONF_DECISAO" =~ ^[Yy]$ ]]; then
		until docker exec -i "$CTN_NAME" mysql -u root -p"$CTN_PASS" -e "SELECT 1;" &> /dev/null; do
			echo -n "#"
			sleep 0.5
		done
		sleep 3
		echo -e "\n[*] configurando DB central."
		sleep 1
		docker exec -i "$CTN_NAME" mysql -u root -p"$CTN_PASS" << 'EOF'
CREATE DATABASE IF NOT EXISTS dados_inventory;
USE dados_inventory;

CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    collection_date DATETIME,
    hostname VARCHAR(100),
    distro VARCHAR(150),
    kernel VARCHAR(100),
    arch VARCHAR(50),
    uptime VARCHAR(100),
    local_ip VARCHAR(50),
    public_ip VARCHAR(50),
    gateway VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
EOF

		echo "configuração criada com sucesso."

	else
		echo "ok."
		clear && neofetch
	fi

	touch tmp/db_datas.env
	cat > tmp/db_datas.env << EOF
CNT_NAME="$CTN_NAME"
CNT_PASS="$CTN_PASS"
EOF

else
	echo "[-] o conteiner não pode ser gerado."
fi
