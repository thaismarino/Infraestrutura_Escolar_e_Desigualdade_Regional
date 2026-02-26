# View: `vw_conectividade_localizacao`

## Finalidade

Consolidar os indicadores de conectividade digital das escolas brasileiras segundo a localização territorial (Urbana ou Rural), com base nos microdados do Censo Escolar 2024.

A view permite analisar desigualdades territoriais relacionadas ao acesso e à qualidade da infraestrutura digital.

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

- Os percentuais são calculados sobre o total de escolas por localização.
- Registros com valor nulo permanecem no denominador.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Evidenciar desigualdades territoriais na conectividade digital escolar,
permitindo análise comparativa entre escolas urbanas e rurais,
com foco tanto no acesso quanto na qualidade da infraestrutura tecnológica.
