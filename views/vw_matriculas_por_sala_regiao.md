# View: `vw_matriculas_por_sala_regiao`

## Finalidade

Calcular a razão média entre matrículas e salas utilizadas por região, permitindo avaliar a pressão estrutural sobre a infraestrutura física das unidades escolares.

A métrica representa a densidade média de alunos por sala, não sendo um percentual, mas uma razão física.

---

## Fonte de Dados

Tabela: `microdados_ed_basica`

Campos utilizados:
- NO_REGIAO
- QT_MAT_BAS
- QT_SALAS_UTILIZADAS

---

## Tratamentos Aplicados

- QT_MAT_BAS tratado com COALESCE para evitar impacto de valores nulos.
- Apenas salas com QT_SALAS_UTILIZADAS > 0 são consideradas no denominador.
- Registros com QT_SALAS_UTILIZADAS nulo ou igual a zero não entram no cálculo da razão.
- Utilização de NULLIF para evitar divisão por zero.

---

## Indicadores Gerados

Para cada região, a view retorna:

- total_matriculas  
  Soma total de matrículas.

- total_salas_validas  
  Soma das salas utilizadas com valor válido (> 0).

- escolas_sala_sem_dado  
  Quantidade de escolas sem informação de salas.

- escolas_sala_zero  
  Quantidade de escolas com zero salas declaradas.

- matriculas_por_sala  
  Razão entre total de matrículas e total de salas válidas.
  Representa a média de alunos por sala na região.

---

## Objetivo Analítico

Avaliar a pressão estrutural sobre a capacidade física das escolas, identificando diferenças regionais na densidade média de alunos por sala.

A análise complementa os eixos anteriores (infraestrutura e conectividade), introduzindo a dimensão da capacidade física instalada como componente da desigualdade educacional.
