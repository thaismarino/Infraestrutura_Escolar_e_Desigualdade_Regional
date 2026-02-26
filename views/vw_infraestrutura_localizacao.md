# View: `vw_infraestrutura_localizacao`

## Finalidade

Consolidar os indicadores de infraestrutura básica escolar segundo a localização territorial (Urbana ou Rural), com base nos microdados do Censo Escolar 2024.

A view permite analisar desigualdades estruturais relacionadas a serviços essenciais ao funcionamento das escolas.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campo de agrupamento:
- TP_LOCALIZACAO

Codificação original:
- 1 = Urbana
- 2 = Rural

Na view, os valores são apresentados de forma descritiva.

---

## Indicadores Gerados

Para cada localização territorial, a view retorna:

- total_escolas  
  Total de escolas da respectiva localização.

### Infraestrutura Básica

- agua_sim → escolas com abastecimento de água por rede pública (valor 1)
- agua_sem_dado → registros sem informação
- pct_agua_sim → proporção de escolas com água por rede pública (0–1)

- esgoto_sim → escolas com esgotamento sanitário por rede pública (valor 1)
- esgoto_sem_dado → registros sem informação
- pct_esgoto_sim → proporção de escolas com esgoto por rede pública (0–1)

- energia_sim → escolas com energia elétrica por rede pública (valor 1)
- energia_sem_dado → registros sem informação
- pct_energia_sim → proporção de escolas com energia elétrica (0–1)

- lixo_sim → escolas com coleta regular de lixo (valor 1)
- lixo_sem_dado → registros sem informação
- pct_lixo_sim → proporção de escolas com coleta de lixo (0–1)

---

## Observação Metodológica

- Os percentuais são calculados sobre o total de escolas por localização.
- Registros com valor nulo permanecem no denominador.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Evidenciar desigualdades territoriais na infraestrutura básica escolar, com destaque para os serviços sanitários, identificando vulnerabilidades estruturais nas áreas rurais.
