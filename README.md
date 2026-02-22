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
- Definição conceitual do Índice Médio de Infraestrutura Escolar
- Escolha das ferramentas analíticas

Nesta etapa não houve execução do ETL, apenas planejamento e modelagem.

---

## Fonte de Dados

- Base: Microdados do Censo Escolar da Educação Básica – 2024  
- Órgão responsável: INEP  
- Formato: CSV  
- Abrangência: Nacional  

Link oficial para download dos microdados:
https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-escolar

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
- Criação do Índice Médio de Infraestrutura

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

# Fase 2 – Implantação da Solução (Em desenvolvimento)

A Segunda Etapa contempla:

- Execução do processo de ETL
- Estruturação da base relacional
- Construção de consultas analíticas (OLAP)
- Geração de indicadores comparativos
- Produção de evidências e análises interpretativas

As entregas desta etapa estão sendo documentadas nas respectivas branches do repositório.

---

## Referências

As referências completas encontram-se no documento acadêmico entregue na Primeira Etapa.
  
