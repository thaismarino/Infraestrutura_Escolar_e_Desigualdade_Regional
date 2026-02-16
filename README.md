## 🛠️ Definição das Tecnologias

Para a implementação da solução de apoio decisório, selecionamos uma stack tecnológica que prioriza a escalabilidade e a integridade dos dados, garantindo que os microdados do Censo Escolar 2024 sejam convertidos em ativos inteligentes.

### 🗄️ Banco de Dados (SGBD)
* **MySQL:** Escolhido como o banco de dados relacional central para armazenamento e gestão.
* **Justificativa:** Oferece alta performance em operações de leitura e suporte robusto para scripts **DDL/DML**, garantindo a integridade referencial necessária para relacionar variáveis geográficas e indicadores de infraestrutura.

### 🔄 Processo de ETL (Extração, Transformação e Carga)
* **Linguagem Python (Pandas & NumPy):** Ferramentas fundamentais para a automação da limpeza de inconsistências e tratamento de grandes volumes de dados.
* **DBeaver:** Interface universal utilizada para gerenciar a conexão com o banco de dados e validar a carga das informações de forma visual e organizada.
* **Justificativa:** O uso de Python permite o cálculo preciso do **Índice Médio de Infraestrutura**, transformando dados brutos em métricas comparáveis.

### 📊 Análise e Visualização (OLAP)
* **Power BI:** Plataforma principal para a criação de painéis dinâmicos e suporte à decisão.
* **Operações OLAP:** Implementação de funções de *drill-down* por macrorregião, UF e localização (urbana/rural).
* **Justificativa:** Facilita a identificação visual de áreas críticas que demandam prioridade em investimentos públicos educacionais.

### 📂 Versionamento e Colaboração
* **GitHub:** Repositório oficial para a publicação de fontes, scripts SQL e documentação técnica.
* **Justificativa:** Garante a transparência, o rigor acadêmico no versionamento e a rastreabilidade de todas as transformações realizadas na base de dados.