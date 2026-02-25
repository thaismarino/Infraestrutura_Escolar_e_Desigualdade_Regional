## ⚙️ Processo de ETL e Carga

A etapa de ETL foi responsável por estruturar e disponibilizar os microdados do Censo Escolar 2024 em uma base relacional organizada, garantindo controle estrutural e preparo para consolidação na camada analítica.

### 🗄️ Estrutura da Base de Dados (DDL)

* **Tabela de Estágio –** stg_escolas_2024: Criada automaticamente durante o processo de carga para armazenar o recorte inicial dos dados do Censo Escolar 2024 na camada de staging.

* **Script DDL:** A estrutura da tabela foi criada dinamicamente pelo método to_sql() da biblioteca Pandas, via SQLAlchemy, utilizando o parâmetro if_exists='replace'.

A definição dos tipos de dados ocorreu por meio de inferência automática baseada nos tipos do DataFrame, gerando a estrutura correspondente no MySQL no momento da execução do pipeline.


### 🔄 Processo de Extração

* **Fonte dos Dados:** Microdados do Censo Escolar 2024, disponibilizados pelo Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP).

* **Formato Original:** Arquivo .CSV, separador ;, codificação latin-1.

* **Ferramenta Utilizada:** Python com a biblioteca Pandas.



### 🔧 Preparação e Organização dos Dados (Camada de Staging)

A camada de estágio foi estruturada como ambiente intermediário de ingestão, com objetivo de organizar preliminarmente os dados extraídos do arquivo original antes da consolidação na base analítica.

Por se tratar de uma etapa de staging, o conjunto de variáveis carregadas corresponde a um recorte técnico inicial, não contemplando integralmente todas as variáveis previstas no modelo conceitual da primeira etapa. Variáveis complementares foram incorporadas posteriormente na base analítica destinada às consultas OLAP.

As atividades executadas consistiram em:

* **Seleção de Variáveis**: Recorte inicial de colunas do arquivo original, priorizando variáveis estruturais e indicadores de infraestrutura necessários para viabilizar a ingestão e organização preliminar dos dados.

* **Padronização de Dados:** Conversão e inferência automática de tipos realizada pelo Pandas durante a leitura do arquivo, com posterior adequação aos tipos definidos na DDL da tabela stg_escolas_2024.

* **Preparação para Carga:** Organização do DataFrame para aderência ao schema da tabela de estágio, garantindo compatibilidade estrutural antes da execução do processo de inserção via método to_sql().


### 📥 Processo de Carga (DML)

* **Script Automatizado:** Implementado em Python utilizando SQLAlchemy.

* **Método Utilizado:** to_sql() com envio em lotes (chunksize=1000).

* **Tipo de Operação:** Execução automatizada de múltiplos comandos INSERT na tabela stg_escolas_2024.


### ✅ Validação da Base Populada

* **Ferramenta de Verificação:** DBeaver.

* **Consulta de Validação:** SELECT COUNT(*) FROM stg_escolas_2024;

* **Resultado:** Confirmação da inserção integral dos registros provenientes do arquivo original.


