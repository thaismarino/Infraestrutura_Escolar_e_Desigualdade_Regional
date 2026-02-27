# Consultas OLAP e Análises

Esta etapa do projeto é responsável pela construção das consultas OLAP, modelagem analítica e geração de análises estratégicas a partir dos dados do Censo Escolar 2024.

O foco está na análise de desigualdades educacionais sob duas perspectivas complementares:

• Estrutura por unidade escolar (percentual de escolas)  
• Impacto ponderado por matrícula (percentual de estudantes afetados)

As análises contemplam:

- Região
- Dependência administrativa
- Localização urbana/rural
- Infraestrutura básica
- Conectividade
- Impacto estrutural sobre matrículas

---

## Organização das Camadas de Dados

Para garantir rastreabilidade e organização metodológica, os dados foram estruturados em camadas:

### Camada Raw

Arquivo original:

`microdados_ed_basica_2024.csv`

Arquivo bruto contendo todas as variáveis do microdado oficial do Censo Escolar 2024 (INEP).  
O arquivo raw não foi versionado no repositório devido ao tamanho.

### Camada Processed

Arquivo derivado:

`microdados_ed_basica_2024_filtrado.csv`

Arquivo contendo apenas as variáveis necessárias ao escopo analítico da etapa de OLAP.

### Base Relacional

A partir do arquivo filtrado, foi criada no MySQL a tabela:

`microdados_ed_basica`

Essa tabela serve como base estruturada para a construção das consultas OLAP e geração dos indicadores analíticos.

### Arquitetura das Camadas

A solução foi estruturada em duas camadas complementares:

- **Camada Staging:** `stg_escolas_2024`  
  Base intermediária criada no processo de ETL, contendo as variáveis iniciais selecionadas para tratamento e organização relacional.

- **Camada Analítica:** `microdados_ed_basica`  
  Base estruturada para suportar consultas OLAP, contendo variáveis adicionais necessárias à construção de indicadores e análises comparativas.

A camada analítica foi construída a partir do microdado filtrado, garantindo maior abrangência para as operações analíticas desenvolvidas nesta etapa.

---

### Dicionário de Dados

Foi elaborado um dicionário específico para o dataset filtrado, contendo:

- Tipo conceitual das variáveis  
- Domínio de valores  
- Descrição analítica  
- Origem dos dados

---

## Consultas Desenvolvidas

Nesta etapa foram desenvolvidas consultas analíticas com foco na identificação de desigualdades estruturais na Educação Básica, contemplando:

1. Conectividade por região  
2. Infraestrutura básica por região  
3. Infraestrutura por dependência administrativa  
4. Conectividade por dependência administrativa  
5. Conectividade por localização (urbana x rural)  
6. Infraestrutura básica por localização  
7. Impacto por matrículas (região)  
8. Impacto por matrículas (dependência administrativa)  
9. Pressão de infraestrutura (matrículas por sala)  
10. Impacto estrutural nas escolas rurais  
11. Percentual de escolas sem rede pública de esgoto por região  

---

## Estrutura Analítica das Consultas

As consultas foram organizadas em três eixos metodológicos:

### 1) Estrutura por Escola

Indicadores calculados com base no total de unidades escolares, incluindo tratamento explícito de valores nulos.

Consultas:
1 a 6 e 11

### 2) Impacto Ponderado por Matrícula

Indicadores calculados com base na soma de matrículas (QT_MAT_BAS), permitindo avaliar o impacto real das condições estruturais sobre o conjunto de estudantes atendidos.

Consultas:
7 e 8

Essa abordagem altera a perspectiva analítica, pois mede não apenas a quantidade de escolas com determinada infraestrutura, mas o volume de alunos efetivamente impactados.

### 3) Pressão Estrutural
Indicadores relacionados à capacidade física e organização escolar.

Consultas:
9 e 10

As consultas SQL encontram-se no arquivo `consultas_olap.sql`, e as análises interpretativas com evidências estão documentadas em `analises_olap.md`.

As views analíticas encontram-se na pasta database/views, retornando percentuais no padrão decimal (0–1) para utilização no Power BI, onde a formatação percentual é aplicada na camada de visualização.
  
