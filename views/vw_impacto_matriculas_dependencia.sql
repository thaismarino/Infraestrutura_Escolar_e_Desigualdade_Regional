-- Criação de Views 

-- View da Consulta 8 

CREATE OR REPLACE VIEW vw_impacto_matriculas_dependencia AS
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
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_com_internet,
  ROUND(
    SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_internet_sem_dado,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_com_esgoto_rede,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_esgoto_sem_dado,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_com_esgoto_rede,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_esgoto_sem_dado

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA;
