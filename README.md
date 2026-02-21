## ⚙️ Processo de ETL e Carga

A etapa de ETL foi responsável por estruturar, transformar e disponibilizar os microdados do Censo Escolar 2024 em uma base relacional organizada, pronta para análises estratégicas e suporte à tomada de decisão.

### 🗄️ Estrutura da Base de Dados (DDL)

* **Tabela de Estágio –** stg_escolas_2024: Criada para armazenar os dados selecionados do Censo Escolar 2024.

* **Script DDL:** Desenvolvido manualmente em SQL e executado no MySQL via DBeaver.

* **Justificativa:** A criação explícita da estrutura da tabela garante controle sobre os tipos de dados, padronização das variáveis e integridade da base antes da carga.

### 🔄 Processo de Extração

* **Fonte dos Dados:** Microdados do Censo Escolar 2024 (INEP).

* **Formato Original:** Arquivo .CSV, separador ;, codificação latin-1.

* **Ferramenta Utilizada:** Python com a biblioteca Pandas.

* **Justificativa:** A leitura programática permite selecionar apenas as colunas relevantes ao escopo do projeto, reduzindo volume desnecessário e aumentando eficiência.

### 🔧 Processo de Transformação

* **Seleção de Variáveis:** Filtragem de colunas relacionadas à localização e infraestrutura escolar.

* **Padronização de Dados:** Conversão automática para tipos compatíveis com o banco relacional.

* **Preparação para Carga:** Organização dos dados conforme estrutura definida na DDL.

* **Justificativa:** A transformação assegura que os dados brutos sejam convertidos em informações estruturadas e consistentes para análise.

### 📥 Processo de Carga (DML)

* **Script Automatizado:** Implementado em Python utilizando SQLAlchemy.

* **Método Utilizado:** to_sql() com envio em lotes (chunksize=1000).

* **Tipo de Operação:** Execução de múltiplos comandos INSERT na tabela stg_escolas_2024.

* **Justificativa:** A carga automatizada garante eficiência, escalabilidade e redução de erros manuais na inserção de grandes volumes de dados.

### ✅ Validação da Base Populada

* **Ferramenta de Verificação:** DBeaver.

* **Consulta de Validação:** SELECT COUNT(*) FROM stg_escolas_2024;

* **Resultado:** Confirmação da inserção integral dos registros.

* **Justificativa:** A validação assegura a integridade e completude da etapa de carga, garantindo confiabilidade para as análises posteriores.
