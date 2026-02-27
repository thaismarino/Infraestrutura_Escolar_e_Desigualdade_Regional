# View: `vw_escolas_sem_esgoto_regiao`

## Finalidade

Consolidar o percentual de escolas sem acesso à rede pública de esgoto por região geográfica, permitindo avaliar a magnitude da ausência de infraestrutura sanitária na Educação Básica brasileira.

Diferentemente das análises que medem a presença do serviço, esta view enfatiza a ausência da cobertura, evidenciando a concentração territorial do déficit estrutural.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:
- NO_REGIAO
- IN_ESGOTO_REDE_PUBLICA

---

## Tratamentos Aplicados

- O percentual é calculado considerando apenas escolas com informação válida (0 ou 1).
- Registros com valor NULL para IN_ESGOTO_REDE_PUBLICA são excluídos do denominador.
- Utilização de NULLIF para evitar divisão por zero.
- Percentuais retornados no padrão decimal (0–1).
- A formatação percentual (%) é aplicada na camada de visualização (Power BI).

---

## Indicadores Gerados

Para cada região, a view retorna:

- total_escolas  
  Total de escolas registradas na região (incluindo registros sem dado).

- escolas_com_dado  
  Total de escolas com informação válida (0 ou 1).

- escolas_sem_esgoto  
  Quantidade de escolas sem acesso à rede pública de esgoto.

- escolas_com_esgoto  
  Quantidade de escolas com acesso à rede pública de esgoto.

- escolas_sem_dado  
  Quantidade de escolas sem informação declarada.

- pct_escolas_sem_esgoto  
  Proporção de escolas sem rede pública de esgoto (0–1),
  considerando apenas escolas com dado válido.

- pct_escolas_sem_dado  
  Proporção de escolas sem informação declarada (0–1),
  calculada sobre o total de escolas da região.

---

## Objetivo Analítico

Mensurar a concentração regional da ausência de infraestrutura sanitária, evidenciando a magnitude do déficit estrutural sob a perspectiva da carência do serviço.

A análise complementa as consultas anteriores, permitindo observar a desigualdade educacional a partir da ausência de cobertura, e não apenas da presença do indicador.
