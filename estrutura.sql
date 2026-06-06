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
);
