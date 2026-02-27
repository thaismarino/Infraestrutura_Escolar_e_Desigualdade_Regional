-- 1) Conectividade por Região (IN_INTERNET)
-- Observação: No Power BI, o visual consome a view vw_conectividade_regiao

SELECT
  NO_REGIAO,

  COUNT(*) AS total_escolas,

  SUM(CASE WHEN IN_INTERNET IN (0,1) THEN 1 ELSE 0 END) AS escolas_com_dado,

  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS escolas_com_internet,
  SUM(CASE WHEN IN_INTERNET = 0 THEN 1 ELSE 0 END) AS escolas_sem_internet,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS escolas_sem_dado,

  ROUND(
    (SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0)) * 100,
    2
  ) AS percentual_com_internet,

  ROUND(
    (SUM(CASE WHEN IN_INTERNET = 0 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0)) * 100,
    2
  ) AS percentual_sem_internet,

  ROUND(
    (SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0)) * 100,
    2
  ) AS percentual_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY percentual_com_internet DESC;


-- 2) Infraestrutura básica por região (percentuais)
-- Observação: No Power BI, os visuais consomem a view vw_infraestrutura_basica_regiao.

SELECT
  NO_REGIAO,
  COUNT(*) AS total_escolas,

  /* ÁGUA - rede pública */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS agua_sim,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IN (0,1) THEN 1 ELSE 0 END) AS agua_com_dado,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS agua_sem_dado,
  ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_agua_sim,
  ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_agua_sem_dado,

  /* ESGOTO - rede pública */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS esgoto_sim,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IN (0,1) THEN 1 ELSE 0 END) AS esgoto_com_dado,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS esgoto_sem_dado,
  ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_esgoto_sim,
  ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_esgoto_sem_dado,

  /* ENERGIA - rede pública */
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS energia_sim,
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IN (0,1) THEN 1 ELSE 0 END) AS energia_com_dado,
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS energia_sem_dado,
  ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_energia_sim,
  ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_energia_sem_dado,

  /* LIXO - serviço de coleta */
  SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END) AS lixo_sim,
  SUM(CASE WHEN IN_LIXO_SERVICO_COLETA IN (0,1) THEN 1 ELSE 0 END) AS lixo_com_dado,
  SUM(CASE WHEN IN_LIXO_SERVICO_COLETA IS NULL THEN 1 ELSE 0 END) AS lixo_sem_dado,
  ROUND(SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_lixo_sim,
  ROUND(SUM(CASE WHEN IN_LIXO_SERVICO_COLETA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_lixo_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY NO_REGIAO;

-- 3) Infraestrutura básica por dependência administrativa

SELECT
  TP_DEPENDENCIA,
  CASE WHEN TP_DEPENDENCIA = 1 THEN 'Federal' 
  WHEN TP_DEPENDENCIA = 2 THEN 'Estadual'
  WHEN TP_DEPENDENCIA = 3 THEN 'Municipal'
  ELSE 'Privada' END AS desc_dependencia,
  COUNT(*) AS total_escolas,

  /* ÁGUA */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS agua_sim,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS agua_sem_dado,
  ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_agua_sim,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS esgoto_sim,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS esgoto_sem_dado,
  ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_esgoto_sim,

  /* ENERGIA */
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS energia_sim,
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS energia_sem_dado,
  ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_energia_sim,

  /* INTERNET */
  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS internet_sim,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS internet_sem_dado,
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_internet_sim

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 4) Conectividade por dependência administrativa (percentuais)

SELECT
  CASE TP_DEPENDENCIA
    WHEN 1 THEN 'Federal'
    WHEN 2 THEN 'Estadual'
    WHEN 3 THEN 'Municipal'
    WHEN 4 THEN 'Privada'
    ELSE 'Não informado'
  END AS dependencia_administrativa,

  COUNT(*) AS total_escolas,

  /* Internet */
  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS internet_sim,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS internet_sem_dado,
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_internet_sim,
  ROUND(SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_internet_sem_dado,

  /* Banda larga */
  SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) AS banda_larga_sim,
  SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) AS banda_larga_sem_dado,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_banda_larga_sim,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_banda_larga_sem_dado,

  /* Rede local (TP_REDE_LOCAL em 1,2,3) */
  SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) AS rede_local_sim,
  SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) AS rede_local_sem_dado,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_rede_local_sim,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_rede_local_sem_dado

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 5) Conectividade por localização (urbana/rural)

SELECT
  CASE TP_LOCALIZACAO
    WHEN 1 THEN 'Urbana'
    WHEN 2 THEN 'Rural'
    ELSE 'Não informado'
  END AS localizacao,

  COUNT(*) AS total_escolas,

  /* Internet */
  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS internet_sim,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS internet_sem_dado,
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_internet_sim,
  ROUND(SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_internet_sem_dado,

  /* Banda larga */
  SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) AS banda_larga_sim,
  SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) AS banda_larga_sem_dado,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_banda_larga_sim,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_banda_larga_sem_dado,

  /* Rede local (TP_REDE_LOCAL em 1,2,3) */
  SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) AS rede_local_sim,
  SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) AS rede_local_sem_dado,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_rede_local_sim,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_rede_local_sem_dado

FROM microdados_ed_basica
GROUP BY TP_LOCALIZACAO
ORDER BY TP_LOCALIZACAO;

-- 6) Infraestrutura básica por localização (urbana/rural)

SELECT
  CASE TP_LOCALIZACAO
    WHEN 1 THEN 'Urbana'
    WHEN 2 THEN 'Rural'
    ELSE 'Não informado'
  END AS localizacao,

  COUNT(*) AS total_escolas,

  /* ÁGUA */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS agua_sim,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS agua_sem_dado,
  ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_agua_sim,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS esgoto_sim,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS esgoto_sem_dado,
  ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_esgoto_sim,

  /* ENERGIA */
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS energia_sim,
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS energia_sem_dado,
  ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_energia_sim,

  /* COLETA DE LIXO */
  SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END) AS lixo_sim,
  SUM(CASE WHEN IN_LIXO_SERVICO_COLETA IS NULL THEN 1 ELSE 0 END) AS lixo_sem_dado,
  ROUND(SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) * 100, 2) AS pct_lixo_sim

FROM microdados_ed_basica
GROUP BY TP_LOCALIZACAO
ORDER BY TP_LOCALIZACAO;

-- 7) Impacto por matrícula: % de matrículas em escolas com internet e com esgoto de rede (por região)
-- Métrica: soma de matrículas (QT_MAT_BAS) nas escolas com o recurso / soma total de matrículas na região

SELECT
  NO_REGIAO,

  /* Total de matrículas (tratando NULL como 0) */
  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas,

  /* INTERNET: matrículas em escolas com internet */
  SUM(CASE WHEN IN_INTERNET = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_em_escolas_com_internet,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_em_escolas_internet_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_mat_em_escolas_com_internet,

  ROUND(
    SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_mat_internet_sem_dado,

  /* ESGOTO: matrículas em escolas com esgoto por rede pública */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_em_escolas_com_esgoto_rede,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_em_escolas_esgoto_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_mat_em_escolas_com_esgoto_rede,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_mat_esgoto_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY pct_mat_em_escolas_com_internet DESC;

-- 8) Impacto por matrícula: dependência administrativa
-- Métrica: % das matrículas em escolas com internet e esgoto de rede

SELECT
  CASE TP_DEPENDENCIA
    WHEN 1 THEN 'Federal'
    WHEN 2 THEN 'Estadual'
    WHEN 3 THEN 'Municipal'
    WHEN 4 THEN 'Privada'
    ELSE 'Não informado'
  END AS dependencia_administrativa,

  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas,

  /* INTERNET */
  SUM(CASE WHEN IN_INTERNET = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_com_internet,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_internet_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_com_internet,

  ROUND(
    SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_internet_sem_dado,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_com_esgoto_rede,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_esgoto_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_com_esgoto_rede,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_esgoto_sem_dado

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 9) Pressão de infraestrutura: matrículas por sala por região
-- Métrica: total de matrículas / total de salas utilizadas (somente salas > 0)

SELECT
  NO_REGIAO,

  /* Totais */
  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas,

  /* Salas válidas */
  SUM(
    CASE
      WHEN QT_SALAS_UTILIZADAS IS NOT NULL AND QT_SALAS_UTILIZADAS > 0
      THEN QT_SALAS_UTILIZADAS
      ELSE 0
    END
  ) AS total_salas_validas,

  /* Contagem para transparência */
  SUM(CASE WHEN QT_SALAS_UTILIZADAS IS NULL THEN 1 ELSE 0 END) AS escolas_sala_sem_dado,
  SUM(CASE WHEN QT_SALAS_UTILIZADAS = 0 THEN 1 ELSE 0 END) AS escolas_sala_zero,

  ROUND(
    SUM(COALESCE(QT_MAT_BAS, 0)) /
    NULLIF(
      SUM(CASE WHEN QT_SALAS_UTILIZADAS IS NOT NULL AND QT_SALAS_UTILIZADAS > 0
               THEN QT_SALAS_UTILIZADAS ELSE 0 END),
      0
    ),
    2
  ) AS matriculas_por_sala

FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY matriculas_por_sala DESC;

-- 10) Impacto por matrícula nas escolas rurais (infraestrutura básica)
-- Métrica: % das matrículas rurais em escolas com esgoto de rede e água de rede

SELECT
  COUNT(*) AS total_escolas_rurais,

  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas_rurais,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_com_esgoto,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_esgoto_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_rurais_com_esgoto,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_rurais_esgoto_sem_dado,

  /* ÁGUA */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_com_agua,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_agua_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_rurais_com_agua,

  ROUND(
    SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0) * 100,
    2
  ) AS pct_matriculas_rurais_agua_sem_dado

FROM microdados_ed_basica
WHERE TP_LOCALIZACAO = 2;

-- 11) Percentual de escolas sem rede publica de esgoto por regiao

SELECT
  NO_REGIAO,
  COUNT(*) AS total_escolas,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 0 THEN 1 ELSE 0 END) AS escolas_sem_esgoto,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 0 THEN 1 ELSE 0 END)
    / NULLIF(COUNT(IN_ESGOTO_REDE_PUBLICA), 0) * 100
  , 2) AS pct_escolas_sem_esgoto
FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY pct_escolas_sem_esgoto DESC;
