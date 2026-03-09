# Análise da Infraestrutura Escolar e das Desigualdades Regionais no Brasil com base nos Microdados do Censo Escolar 2024

## Projeto Integrador: Apoio Decisório aos Negócios

O projeto tem como foco a análise de infraestrutura escolar e desigualdade regional no Brasil, utilizando os microdados do Censo Escolar da Educação Básica 2024 (INEP) como base para apoiar a tomada de decisão e a formulação de políticas públicas educacionais.

---

### 👥 Integrantes do Grupo
- [Bruno Costa Caiado](https://github.com/costacaiado)
- [Felipe Augusto Santinho](https://github.com/felipe-santinho)
- [Isabel Helena Hartmann](https://github.com/belhartmann)
- [Paula Barros Ortiz](https://github.com/paulabortiz)
- [Thais Oliveira dos Santos](https://github.com/thaismarino)

### 👨‍🏫 Orientador
- Gustavo Calixto

---

## Tema do Projeto

Infraestrutura escolar e desigualdade regional

Análise das desigualdades na infraestrutura das escolas brasileiras, considerando diferenças regionais, dependência administrativa (pública e privada) e localização (urbana e rural).

---

## Objetivo Geral

Analisar as desigualdades regionais na infraestrutura das escolas brasileiras por meio dos microdados do Censo Escolar 2024, utilizando processos de ETL (Extração, Transformação e Carga) para a construção de indicadores comparativos que apoiem a tomada de decisão.

---

# Estrutura do Projeto

O projeto está dividido em duas etapas principais:

- **Fase 1 – Planejamento e Modelagem**
- **Fase 2 – Implantação da Solução**

---

# Fase 1 – Planejamento e Modelagem

A Primeira Etapa teve caráter conceitual e metodológico, com foco na compreensão do problema de negócio, definição da base de dados e planejamento do processo analítico.

### Principais atividades realizadas

- Definição do problema de apoio à decisão
- Seleção da base de dados oficial (Censo Escolar 2024 – INEP)
- Identificação das variáveis relevantes
- Levantamento de perguntas de negócio
- Planejamento do processo de ETL
- Definição conceitual de métricas comparativas de infraestrutura escolar
- Escolha das ferramentas analíticas

Nesta etapa não houve execução do ETL, apenas planejamento e modelagem.

---

## Fonte de Dados

- Base: Microdados do Censo Escolar da Educação Básica – 2024  
- Órgão responsável: INEP  
- Formato: CSV  
- Abrangência: Nacional  

Link oficial: [microdados](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-escolar)

Os dados utilizados correspondem ao arquivo de escolas da edição 2024.

---

## Planejamento do Processo ETL

### Extração
- Download e leitura dos microdados
- Seleção do arquivo referente às escolas
- Verificação de integridade

### Transformação
- Limpeza e padronização
- Tratamento de inconsistências
- Recodificação de variáveis
- Definição conceitual de indicadores compostos de infraestrutura escolar

### Carga
- Armazenamento da base tratada
- Preparação para uso em análises e visualizações

---

## Ferramentas Planejadas

- Python (Pandas, NumPy)
- Power BI
- Excel

---

## Perguntas de Negócio

- Quais regiões apresentam piores condições de infraestrutura?
- Quais diferenças existem entre escolas públicas e privadas?
- Como a localização impacta a infraestrutura?
- Quais itens são mais críticos?
- Onde os investimentos devem ser priorizados?

---

## Organização da Equipe – Fase 1

- Isabel – Introdução e objetivos
- Felipe – Base de dados e variáveis
- Bruno – Apoio à decisão e possibilidades analíticas
- Thais – Planejamento do ETL
- Paula – Revisão ABNT e conclusão

---

# Fase 2 – Implantação da Solução

A Segunda Etapa corresponde à implementação prática da solução planejada na Fase 1, contemplando a execução do ETL, estruturação da base relacional e construção das análises OLAP.

A arquitetura foi organizada em camadas complementares:

- Fonte de dados (CSV oficial – INEP)
- Camada Staging: `stg_escolas_2024`
- Camada Analítica: `microdados_ed_basica`

Essa separação garante organização, rastreabilidade e suporte adequado às análises comparativas desenvolvidas.

---

## 1. Definição das Tecnologias e Vídeo – Felipe  
**Branch:** `Definicao-tecnologias`

Responsável por:

- Consolidação da stack tecnológica utilizada na solução  
- Definição do MySQL como SGBD relacional  
- Uso de Python (Pandas e NumPy) no processo de ETL  
- Utilização do DBeaver para validação e gerenciamento do banco  
- Definição do Power BI como ferramenta de visualização analítica  
- Organização do versionamento via GitHub  

---

## 2. Fonte de Dados e Extração – Isabel  
**Branch:** `Fonte-de-dados-e-extração`

Responsável por:

- Documentação da fonte oficial dos microdados (INEP)  
- Descrição técnica do formato original dos arquivos (CSV, encoding, separador)  
- Desenvolvimento de script Python para extração e carga inicial dos dados  
- Implementação da conexão segura ao banco MySQL via SQLAlchemy  
- Inserção dos dados na tabela staging `stg_escolas_2024`  

---

## 3. Detalhamento Técnico do ETL – Bruno  
**Branch:** `Detalhamento-técnico`

Responsável por:

- Documentação técnica da arquitetura do pipeline ETL  
- Descrição da camada de staging `stg_escolas_2024`  
- Detalhamento das decisões técnicas (usecols, chunksize, replace, idempotência)  
- Validação pós-carga e controle de integridade  
- Análise de limitações e possibilidades de evolução da solução  

---

## 4. Execução da Carga e Estrutura Relacional e PDF – Paula  
**Branch:** `Processo-de-ETL-e-carga`

Responsável por:

- Execução da etapa de carga do pipeline ETL para a camada de staging
- Criação e documentação da tabela `stg_escolas_2024` (DDL e evidências)  
- Validação pós-carga via consultas no DBeaver  
- Organização da base intermediária para posterior consolidação analítica
- Responsável pela organização e consolidação do documento acadêmico da Segunda Etapa do projeto.

**Observação:** A tabela `stg_escolas_2024` representa a camada de staging. Variáveis complementares previstas no escopo analítico foram incorporadas posteriormente na camada analítica utilizada nas consultas OLAP.

---

## 5. Operações OLAP – Thais  
**Branch:** `Consultas-OLAP-e-Analises`

Responsável por:

- Construção da camada analítica `microdados_ed_basica`, derivada da tabela staging  
- Incorporação de variáveis previstas na Fase 1 não contempladas na camada de staging  
- Desenvolvimento das consultas OLAP para análise comparativa  
- Criação de views analíticas padronizadas (0–1) para integração com Power BI  
- Tratamento metodológico de valores nulos e padronização dos indicadores  

A tabela `microdados_ed_basica` representa a camada analítica consolidada do projeto, utilizada na geração dos indicadores estruturais, análises comparativas e evidências apresentadas na Fase 2.

---

### Principais resultados identificados:

- Forte desigualdade territorial, com maior concentração de déficits nas regiões Norte e Nordeste  
- Maior vulnerabilidade estrutural na rede municipal  
- Persistência do esgotamento sanitário como principal gargalo  
- Déficit crítico nas escolas rurais  
- Diferenças regionais na densidade média de alunos por sala  

---

## Estrutura do Repositório – Fase 2

- `data/raw` → Referência ao microdado original (não versionado)
- `data/processed` → Dataset filtrado para escopo analítico
- `database/ddl` → Estrutura da tabela staging (`stg_escolas_2024`)
- `database/views` → Views analíticas (camada OLAP)
- `consultas_olap.sql` → Consultas desenvolvidas
- `analises_olap.md` → Interpretação dos resultados
- `modelagem_analitica.md` → Estrutura conceitual da camada analítica
- `origem_dados.md` → Documentação da fonte e extração
- `detalhamento_tecnico_etl.md` → Documentação técnica do pipeline

---

# Vídeo do Projeto

https://github.com/user-attachments/assets/16e41835-b82e-4cee-9190-47c15d9e358b

---

## Referências

As referências completas encontram-se no documento acadêmico entregue na Primeira Etapa.
  
