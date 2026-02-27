# Modelagem Analítica – Etapa OLAP

## Granularidade

A base `microdados_ed_basica` possui granularidade ao nível de escola.

Cada registro representa uma unidade escolar da Educação Básica no Censo Escolar 2024, identificada por `CO_ENTIDADE`.

As análises partem dessa granularidade e, quando necessário, realizam agregações por região, dependência administrativa ou localização.

---

## Dimensões Analíticas

### Dimensão Geográfica

- Região (NO_REGIAO)
- Unidade da Federação (SG_UF)
- Município (NO_MUNICIPIO)

### Dimensão Administrativa

- Dependência administrativa (Federal, Estadual, Municipal, Privada)

### Dimensão de Localização

- Classificação territorial da escola (Urbana ou Rural)

### Dimensão de Infraestrutura Sanitária

- Acesso à rede pública de água
- Acesso à rede pública de esgoto
- Coleta de lixo
- Energia elétrica

### Dimensão de Conectividade Digital

- Acesso à internet
- Banda larga
- Presença de rede local estruturada

### Dimensão de Capacidade Física

- Quantidade de salas utilizadas

---

## Métricas Analíticas

As métricas foram estruturadas em três eixos principais:

### 1) Estrutura por Escola

- Percentual de escolas com infraestrutura disponível
- Percentual de escolas sem determinado serviço
- Percentual de escolas com conectividade

Base de cálculo: total de escolas com dado válido (0 ou 1).

---

### 2) Impacto Ponderado por Matrícula

- Percentual de matrículas em escolas com internet
- Percentual de matrículas em escolas com esgoto por rede pública
- Indicadores estruturais no recorte rural

Base de cálculo: soma de `QT_MAT_BAS`.

---

### 3) Pressão Estrutural

- Razão entre matrículas e salas utilizadas (matrículas por sala)

Base de cálculo: soma de matrículas / soma de salas válidas.

---

## Observação Metodológica

Os indicadores percentuais foram padronizados em duas camadas:

- Consulta SQL (DBeaver): percentuais em escala 0–100 para validação.
- Views analíticas (MySQL): percentuais retornados em escala decimal (0–1) para utilização no Power BI.

Registros com valores nulos foram tratados explicitamente, evitando distorções no denominador das métricas.
