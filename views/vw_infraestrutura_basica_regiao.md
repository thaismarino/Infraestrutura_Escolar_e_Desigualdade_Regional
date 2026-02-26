# View: `vw_infraestrutura_basica_regiao`

## Finalidade

Consolidar os indicadores de infraestrutura básica escolar por região geográfica, com base nos microdados do Censo Escolar 2024.

A view agrega os dados da tabela `microdados_ed_basica`, calculando totais e proporções regionais para serviços essenciais.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:

- IN_AGUA_REDE_PUBLICA
- IN_ESGOTO_REDE_PUBLICA
- IN_ENERGIA_REDE_PUBLICA
- IN_LIXO_SERVICO_COLETA
- NO_REGIAO

---

## Indicadores Gerados

Para cada região geográfica, a view retorna:

- total_escolas  
  Total de escolas na região (inclui registros com dado não informado).

### Água – Rede Pública

- agua_sim → escolas com acesso (valor 1)
- agua_sem_dado → registros com valor nulo
- pct_agua_sim → proporção sobre o total (0–1)

### Esgoto – Rede Pública

- esgoto_sim → escolas com acesso (valor 1)
- esgoto_sem_dado → registros com valor nulo
- pct_esgoto_sim → proporção sobre o total (0–1)

### Energia – Rede Pública

- energia_sim → escolas com acesso (valor 1)
- energia_sem_dado → registros com valor nulo
- pct_energia_sim → proporção sobre o total (0–1)

### Coleta de Lixo

- lixo_sim → escolas com serviço (valor 1)
- lixo_sem_dado → registros com valor nulo
- pct_lixo_sim → proporção sobre o total (0–1)

---

## Observação Metodológica

- Os percentuais são calculados sobre o total de escolas por região.
- Registros com valor nulo são mantidos no denominador.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Permitir análise comparativa da infraestrutura básica escolar entre regiões,
evidenciando desigualdades estruturais relacionadas a serviços essenciais.
