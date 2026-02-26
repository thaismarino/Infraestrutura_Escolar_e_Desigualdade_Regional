# View: `vw_conectividade_regiao`

## Finalidade
Consolidar os indicadores de conectividade escolar por região geográfica com base no Censo Escolar 2024.

## Fonte de Dados

Tabela: `microdados_ed_basica`

## Indicadores Gerados

- total_escolas: total de escolas por região
- escolas_com_dado: registros com IN_INTERNET preenchido
- escolas_com_internet: IN_INTERNET = 1
- escolas_sem_internet: IN_INTERNET = 0
- escolas_sem_dado: IN_INTERNET nulo
- percentual_com_internet: proporção sobre o total (0–1)
- percentual_sem_internet: proporção sobre o total (0–1)
- percentual_sem_dado: proporção sobre o total (0–1)

## Observação Metodológica

Os percentuais são calculados sobre o total de escolas por região.

A formatação em porcentagem (%) é aplicada no Power BI.
