# View: `vw_conectividade_dependencia`

## Finalidade

Consolidar os indicadores de conectividade digital das escolas brasileiras
segundo a dependência administrativa, com base nos microdados do Censo Escolar 2024.

A view permite comparar as redes Federal, Estadual, Municipal e Privada
quanto ao acesso e à qualidade da infraestrutura digital.

---

## Fonte de Dados

Tabela base: `microdados_ed_basica`

Campo de agrupamento:
- TP_DEPENDENCIA

Codificação original:
- 1 = Federal
- 2 = Estadual
- 3 = Municipal
- 4 = Privada

Na view, os valores são apresentados de forma descritiva.

---

## Indicadores Gerados

Para cada dependência administrativa, a view retorna:

- total_escolas  
  Total de escolas da rede.

### Conectividade Digital

- internet_sim → escolas com acesso à internet (valor 1)
- internet_sem_dado → registros sem informação
- pct_internet_sim → proporção de escolas com internet (0–1)
- pct_internet_sem_dado → proporção de registros sem informação (0–1)

- banda_larga_sim → escolas com banda larga (valor 1)
- banda_larga_sem_dado → registros sem informação
- pct_banda_larga_sim → proporção de escolas com banda larga (0–1)
- pct_banda_larga_sem_dado → proporção de registros sem informação (0–1)

- rede_local_sim → escolas com rede local estruturada (TP_REDE_LOCAL IN (1,2,3))
- rede_local_sem_dado → registros sem informação
- pct_rede_local_sim → proporção de escolas com rede local (0–1)
- pct_rede_local_sem_dado → proporção de registros sem informação (0–1)

---

## Observação Metodológica

- Os percentuais são calculados sobre o total de escolas da respectiva dependência administrativa.
- Registros com valor nulo permanecem no denominador.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Evidenciar desigualdades digitais entre as redes administrativas,
com ênfase não apenas no acesso à internet,
mas também na qualidade da conectividade
(banda larga e infraestrutura interna de rede).
