# Fonte de Dados, Extração e Armazenamento

## 1. Fonte Oficial
A fonte primária dos dados são os **Microdados do Censo Escolar da Educação Básica 2024**, fornecidos pelo **INEP** (Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira).
* **Origem:** Portal de Dados Abertos do INEP (gov.br/inep).
* **Formato Original:** Arquivos .CSV (separador `;`, codificação `latin-1`).

## 2. Processo de Extração e Carga (Pipeline de Dados)
Para viabilizar a análise colaborativa do grupo, foi desenvolvido um script em **Python** que realiza a leitura dos dados brutos e a migração para um banco de dados relacional compartilhado.

### Etapas do Script:
1.  **Conexão:** O script estabelece conexão com o servidor de banco de dados do projeto.
2.  **Leitura (Extração):** Utiliza a biblioteca `Pandas` para ler o arquivo local `microdados_ed_basica_2024.csv`, filtrando apenas as colunas de infraestrutura e localização definidas no escopo do projeto.
3.  **Persistência (Carga):** Os dados filtrados são inseridos automaticamente em uma tabela no banco de dados MySQL, permitindo consultas SQL centralizadas.

## 3. Infraestrutura de Banco de Dados
Os dados tratados estão armazenados em um banco de dados em nuvem, acessível via DBeaver ou aplicações de análise.

* [cite_start]**SGBD:** MySQL [cite: 236, 252]
* [cite_start]**Servidor (Host):** AWS RDS (`gzp0u91edhmxszwf.cbetxkdyhwsb.us-east-1.rds.amazonaws.com`) [cite: 308]
* [cite_start]**Banco de Dados:** `vsp8yojbyj7jd7rg` [cite: 310]
* [cite_start]**Porta:** 3306 [cite: 309]

Esta arquitetura centralizada garante que todos os integrantes do grupo utilizem a mesma versão higienizada dos dados para a geração de indicadores.
