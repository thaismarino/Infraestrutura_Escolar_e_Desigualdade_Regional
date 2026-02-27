# View: `vw_impacto_matriculas_dependencia`

## Finalidade

Consolidar indicadores de impacto estrutural ponderados por matrícula, avaliando o percentual de estudantes matriculados em escolas com acesso à internet e com esgotamento sanitário por rede pública, segundo a dependência administrativa.

Esta análise permite mensurar o impacto real das condições de infraestrutura sobre o conjunto de alunos atendidos por cada esfera administrativa (Federal, Estadual, Municipal e Privada).

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:
- TP_DEPENDENCIA
- QT_MAT_BAS
- IN_INTERNET
- IN_ESGOTO_REDE_PUBLICA

---

## Tratamentos Aplicados

- Tradução do código TP_DEPENDENCIA para descrição textual:
  - 1 = Federal
  - 2 = Estadual
  - 3 = Municipal
  - 4 = Privada
  - Outros = Não informado

- QT_MAT_BAS tratado com COALESCE para evitar impacto de valores nulos.
- Percentuais calculados sobre o total de matrículas da respectiva dependência.
- Valores retornados no padrão decimal (0–1).
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Indicadores Gerados

Para cada dependência administrativa, a view retorna:

### Total

- total_matriculas  
  Soma total de matrículas na dependência.

---

### Conectividade Digital (Impacto por Matrícula)

- mat_com_internet  
  Matrículas em escolas com IN_INTERNET = 1.

- mat_internet_sem_dado  
  Matrículas em escolas com valor não informado.

- pct_matriculas_com_internet  
  Proporção de matrículas em escolas com internet (0–1).

- pct_matriculas_internet_sem_dado  
  Proporção de matrículas com dado não informado (0–1).

---

### Infraestrutura Sanitária (Impacto por Matrícula)

- mat_com_esgoto_rede  
  Matrículas em escolas com IN_ESGOTO_REDE_PUBLICA = 1.

- mat_esgoto_sem_dado  
  Matrículas em escolas com valor não informado.

- pct_matriculas_com_esgoto_rede  
  Proporção de matrículas em escolas com esgoto por rede pública (0–1).

- pct_matriculas_esgoto_sem_dado  
  Proporção de matrículas com dado não informado (0–1).

---

## Objetivo Analítico

Avaliar a desigualdade estrutural sob a perspectiva do estudante, mensurando o potencial impacto das condições de conectividade digital e saneamento sobre o volume total de matrículas atendidas em cada dependência administrativa.

A análise ponderada por matrícula permite identificar
se os déficits estruturais atingem maior ou menor parcela
da população escolar, complementando as análises baseadas
na quantidade de escolas.
