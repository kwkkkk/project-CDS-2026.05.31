# THE PROJECT CDS-2026

O **CDS (Coletor de Dados em Shell)** é um projeto desenvolvido por **Kwkkkk** com a finalidade de coletar informações de desempenho e sistema de uma determinada máquina Linux e armazená-las em um banco de dados. Para realizar essa coleta, o script utiliza nativamente as variáveis e comandos do próprio sistema operacional.

## Por Que Linux?

O Linux é o kernel que serve como base para a maioria dos sistemas corporativos e servidores de grandes empresas ao redor do mundo, tornando-se o ambiente ideal e mais relevante para o monitoramento e coleta de dados métricos.

##DB & Arquitetura

Atualmente, o projeto está na versão **BETA (0.2.1)** e conta com a seguinte estrutura de infraestrutura:

* **Conteinerização:** O projeto gera automaticamente um contêiner **Docker**.
* **Banco de Dados:** Dentro do contêiner, é criado um servidor **MySQL** para armazenar todos os dados coletados.

### Por que o MySQL?
O MySQL foi o banco de dados escolhido para esta fase do projeto por ser extremamente estável, completamente documentado e rápido no processamento de queries precisas.

---

## Tecnologias Utilizadas

* **Shell Script:** Para a lógica de coleta de dados no sistema.
* **Docker:** Para encapsulamento e consistência do ambiente de banco de dados.
* **MySQL:** Para armazenamento dos dados coletados.
