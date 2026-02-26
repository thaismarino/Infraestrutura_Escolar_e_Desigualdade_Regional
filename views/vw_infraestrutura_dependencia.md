# View: `vw_infraestrutura_dependencia`

## Finalidade

Consolidar os indicadores de infraestrutura básica escolar por dependência administrativa, com base nos microdados do Censo Escolar 2024.

A view permite comparar as condições estruturais entre as redes: Federal, Estadual, Municipal e Privada.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

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

### Infraestrutura Básica

- pct_agua_sim → proporção de escolas com abastecimento de água por rede pública (0–1)
- pct_esgoto_sim → proporção de escolas com esgotamento por rede pública (0–1)
- pct_energia_sim → proporção de escolas com energia elétrica por rede pública (0–1)
- pct_internet_sim → proporção de escolas com acesso à internet (0–1)

---

## Observação Metodológica

- Os percentuais são calculados sobre o total de escolas da respectiva dependência administrativa.
- Registros com valor nulo permanecem no denominador.
- A view retorna percentuais no padrão 0–1.
- A formatação em porcentagem (%) é aplicada na camada de visualização (Power BI).

---

## Objetivo Analítico

Evidenciar desigualdades estruturais entre redes administrativas, permitindo análise comparativa da infraestrutura escolar além da dimensão regional.
