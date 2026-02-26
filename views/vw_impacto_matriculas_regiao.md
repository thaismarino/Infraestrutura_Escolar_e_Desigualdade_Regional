# View: `vw_impacto_matriculas_regiao`

## Finalidade

Consolidar indicadores de impacto estrutural ponderados por matrícula, avaliando o percentual de estudantes matriculados em escolas com acesso à internet e com esgotamento sanitário por rede pública, segundo a região geográfica.

Diferentemente das análises por escola, esta view considera o peso das matrículas (QT_MAT_BAS), permitindo mensurar o impacto real das condições de infraestrutura sobre o conjunto de alunos atendidos.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:
- NO_REGIAO
- QT_MAT_BAS
- IN_INTERNET
- IN_ESGOTO_REDE_PUBLICA

---

## Indicadores Gerados

Para cada região geográfica, a view retorna:

- total_matriculas  
  Soma total de matrículas na região.

### Conectividade Digital (Impacto por Matrícula)

- mat_em_escolas_com_internet  
  Soma das matrículas em escolas com IN_INTERNET = 1.

- mat_em_escolas_internet_sem_dado  
  Soma das matrículas em escolas com valor não informado.

- pct_mat_em_escolas_com_internet  
  Proporção de matrículas em escolas com internet (0–1).

- pct_mat_internet_sem_dado  
  Proporção de matrículas em escolas com dado não informado (0–1).

### Infraestrutura Sanitária (Impacto por Matrícula)

- mat_em_escolas_com_esgoto_rede  
  Soma das matrículas em escolas com IN_ESGOTO_REDE_PUBLICA = 1.

- mat_em_escolas_esgoto_sem_dado  
  Soma das matrículas em escolas com valor não informado.

- pct_mat_em_escolas_com_esgoto_rede  
  Proporção de matrículas em escolas com esgoto por rede pública (0–1).

- pct_mat_esgoto_sem_dado  
  Proporção de matrículas em escolas com dado não informado (0–1).

---

## Observação Metodológica

- Os percentuais são calculados sobre o total de matrículas da respectiva região.
- QT_MAT_BAS é tratado com COALESCE para evitar impacto de valores nulos.
- Registros sem matrícula não impactam o cálculo ponderado.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Avaliar a desigualdade estrutural sob a perspectiva do estudante,
medindo o potencial impacto das condições de conectividade e saneamento
sobre o volume total de matrículas atendidas em cada região.
