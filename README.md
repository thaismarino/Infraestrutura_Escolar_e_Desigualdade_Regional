# Análise da infraestrutura escolar e das desigualdades regionais no Brasil com base nos microdados do Censo Escolar 2024 

## Projeto Integrador: Apoio Decisório aos Negócios 
O projeto tem como foco a análise de **infraestrutura escolar e desigualdade regional** no Brasil, utilizando os **microdados do Censo Escolar da Educação Básica 2024 (INEP)** como base para apoiar a tomada de decisão e a formulação de políticas públicas educacionais.

### 👥 Integrantes do Grupo
- [Bruno Costa Caiado](https://github.com/costacaiado)
- [Felipe Augusto Santinho](https://github.com/felipe-santinho)
- [Isabel Helena Hartmann](https://github.com/belhartmann)
- [Paula Barros Ortiz](https://github.com/paulabortiz)
- [Thais Oliveira dos Santos](https://github.com/thaismarino)

### 👨‍🏫 Orientador
- Gustavo Calixto

## Tema do Projeto 

**Infraestrutura escolar e desigualdade regional**
Análise das desigualdades na infraestrutura das escolas brasileiras, considerando diferenças regionais, dependência administrativa (pública e privada) e localização (urbana e rural).

## Objetivo Geral

Analisar as desigualdades regionais na infraestrutura das escolas brasileiras por meio dos microdados do Censo Escolar 2024, utilizando processos de **ETL (Extração, Transformação e Carga)** para a construção de indicadores comparativos que apoiem a tomada de decisão.

## Estrutura do Projeto

O projeto está dividido em **duas etapas principais**:

- **Primeira Etapa (Fase 1)** – Planejamento, modelagem analítica e definição do processo ETL  
- **Segunda Etapa (Fase 2)** –

## Primeira Etapa – Planejamento e Modelagem

A Primeira Etapa teve caráter **conceitual e metodológico**, com foco na compreensão do problema de negócio, definição da base de dados e planejamento do processo analítico.

### Principais atividades realizadas

- Definição do problema de apoio à decisão relacionado à desigualdade de infraestrutura escolar
- Pesquisa e seleção da base de dados oficial (Censo Escolar 2024 – INEP)
- Identificação e descrição das variáveis relevantes para a análise
- Levantamento de perguntas de negócio e decisões possíveis a partir dos dados
- Planejamento detalhado do processo de ETL
- Definição conceitual de um **Índice Médio de Infraestrutura Escolar**
- Escolha das ferramentas analíticas e de visualização

Nesta etapa, **não houve execução do ETL**, apenas o planejamento e a modelagem do processo.

## Fonte de Dados

- **Base:** Microdados do Censo Escolar da Educação Básica – 2024  
- **Órgão responsável:** INEP (Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira)  
- **Formato:** CSV  
- **Abrangência:** Nacional (escolas públicas e privadas)

Os dados permitem análises comparativas por:
- Região
- Unidade Federativa
- Dependência administrativa
- Localização (urbana e rural)
- Condições de infraestrutura física e tecnológica

## Planejamento do Processo ETL

O processo de ETL foi planejado em três etapas:

### Extração
- Download e leitura dos microdados do Censo Escolar 2024
- Seleção do arquivo referente às escolas
- Garantia da integridade e consistência dos dados originais

### Transformação
- Limpeza e padronização das variáveis
- Tratamento de valores ausentes e inconsistências
- Recodificação de variáveis binárias
- Criação do Índice Médio de Infraestrutura Escolar

### Carga
- Armazenamento da base tratada em formato adequado para análise
- Preparação para uso em ferramentas de visualização e análise estatística

## Ferramentas Planejadas

- **Python** (Pandas, NumPy) – tratamento e transformação dos dados  
- **Power BI** – visualização e análise comparativa  
- **Excel** – validação e conferência dos dados

## Perguntas de Negócio

Algumas das perguntas que o projeto se propõe a responder:

- Quais regiões apresentam as piores condições de infraestrutura escolar?
- Quais diferenças existem entre escolas públicas e privadas?
- Como a localização urbana ou rural impacta a infraestrutura disponível?
- Quais itens de infraestrutura são mais críticos no cenário nacional?
- Onde os investimentos públicos devem ser priorizados?

## Organização da Equipe – Primeira Etapa

A divisão das atividades na Primeira Etapa foi realizada da seguinte forma:

- **Isabel Helena Hartmann**  
  Introdução, contextualização do tema e definição dos objetivos.

- **Felipe Augusto Santinho**  
  Pesquisa, escolha da base de dados, descrição das variáveis e justificativa da fonte de dados.

- **Bruno Costa Caiado**  
  Análise das atividades de apoio à decisão, possibilidades analíticas e decisões possíveis.

- **Thais Oliveira dos Santos**  
  Planejamento do processo ETL, detalhando as etapas de extração, transformação e carga dos dados.

- **Paula Barros Ortiz**  
  Revisão conforme normas ABNT, elaboração da conclusão e organização das referências bibliográficas.

  ## Segunda Etapa – Implantação da Solução (Em desenvolvimento)

A Segunda Etapa do projeto contempla a implantação da solução proposta na fase inicial,
incluindo a definição das tecnologias utilizadas, o detalhamento técnico do processo de ETL,
a execução da carga dos dados e a realização de operações analíticas (OLAP) para apoio à
tomada de decisão.

As entregas desta etapa serão adicionadas gradualmente a este repositório.

  ## Referências

As referências utilizadas estão disponíveis no documento acadêmico entregue na Primeira Etapa, com base em fontes oficiais como INEP, MEC, IBGE e UNESCO.
  
