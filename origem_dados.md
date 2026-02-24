# Fonte de Dados, Extração e Armazenamento

1. Fonte Oficial

A fonte primária dos dados são os Microdados do Censo Escolar da Educação Básica 2024, fornecidos pelo INEP (Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira).

Origem: Portal de Dados Abertos do INEP (gov.br/inep).

Formato Original: Arquivos .CSV (separador ;, codificação latin-1).

2. Processo de Extração e Carga (Pipeline de Dados)

Para viabilizar a análise colaborativa do grupo, foi desenvolvido um script em Python que realiza a leitura dos dados brutos e a migração para um banco de dados relacional compartilhado.

O processo segue o modelo clássico de ETL (Extração, Transformação e Carga), garantindo padronização, integridade e rastreabilidade das informações.

Etapas do Script:

Conexão:
O script estabelece conexão com o servidor de banco de dados do projeto utilizando a biblioteca SQLAlchemy.
As credenciais de acesso são configuradas por meio de variáveis de ambiente, não sendo armazenadas diretamente no código-fonte.

Leitura (Extração):
Utiliza a biblioteca Pandas para ler o arquivo local microdados_ed_basica_2024.csv, aplicando filtro nas colunas relacionadas à:

Localização geográfica

Dependência administrativa

Infraestrutura básica e tecnológica

Quantidade de salas utilizadas

Persistência (Carga):
Os dados filtrados são inseridos automaticamente em uma tabela no banco de dados MySQL, permitindo:

Consultas SQL centralizadas

Execução de operações OLAP

Geração de indicadores comparativos

3. Infraestrutura de Banco de Dados

Os dados tratados estão armazenados em um banco de dados relacional em ambiente de nuvem, acessível via DBeaver ou ferramentas de análise como Python e Power BI.

SGBD: MySQL

Ambiente: Servidor em nuvem (AWS RDS)

Modelo de Acesso: Conexão autenticada via variáveis de ambiente

Porta Padrão: 3306

Por questões de boas práticas de segurança da informação, os detalhes específicos de conexão (host, nome do banco e credenciais) não são expostos neste repositório público.
