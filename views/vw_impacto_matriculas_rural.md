# View: `vw_impacto_matriculas_rural`

## Finalidade

Consolidar indicadores de impacto estrutural ponderados por matrícula no recorte das escolas localizadas em área rural (TP_LOCALIZACAO = 2).

A view permite avaliar o percentual de estudantes matriculados em escolas rurais com acesso à rede pública de esgoto e abastecimento de água por rede pública, mensurando o impacto real das condições sanitárias sobre o conjunto de alunos atendidos nesse território.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:
- TP_LOCALIZACAO
- QT_MAT_BAS
- IN_ESGOTO_REDE_PUBLICA
- IN_AGUA_REDE_PUBLICA

---

## Tratamentos Aplicados

- Filtro aplicado: TP_LOCALIZACAO = 2 (Zona Rural).
- QT_MAT_BAS tratado com COALESCE para evitar impacto de valores nulos.
- Percentuais calculados sobre o total de matrículas rurais.
- Utilização de NULLIF para evitar divisão por zero.
- Valores retornados no padrão decimal (0–1).
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Indicadores Gerados

- total_escolas_rurais  
  Total de escolas classificadas como rurais.

- total_matriculas_rurais  
  Soma total de matrículas nas escolas rurais.

### Infraestrutura Sanitária (Impacto por Matrícula)

- mat_rurais_com_esgoto  
  Matrículas em escolas rurais com acesso à rede pública de esgoto.

- mat_rurais_esgoto_sem_dado  
  Matrículas em escolas rurais sem informação declarada para o indicador.

- pct_matriculas_rurais_com_esgoto  
  Proporção de matrículas rurais em escolas com rede pública de esgoto (0–1).

- mat_rurais_com_agua  
  Matrículas em escolas rurais com abastecimento de água por rede pública.

- mat_rurais_agua_sem_dado  
  Matrículas em escolas rurais sem informação declarada para o indicador.

- pct_matriculas_rurais_com_agua  
  Proporção de matrículas rurais em escolas com água por rede pública (0–1).

---

## Objetivo Analítico

Avaliar a magnitude do déficit estrutural sanitário nas escolas situadas em área rural, mensurando o impacto direto sobre o volume total de estudantes atendidos.

A análise permite identificar a vulnerabilidade estrutural sob a perspectiva do aluno, complementando as avaliações por escola e por região.
