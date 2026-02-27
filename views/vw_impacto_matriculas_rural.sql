-- Criação de Views

-- View Consulta 10

CREATE OR REPLACE VIEW vw_impacto_matriculas_rural AS
SELECT
  COUNT(*) AS total_escolas_rurais,
  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas_rurais,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_com_esgoto,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_esgoto_sem_dado,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_rurais_com_esgoto,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_rurais_esgoto_sem_dado,

  /* ÁGUA */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_com_agua,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END) AS mat_rurais_agua_sem_dado,
  ROUND(
    SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_rurais_com_agua,
  ROUND(
    SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_matriculas_rurais_agua_sem_dado

FROM microdados_ed_basica
WHERE TP_LOCALIZACAO = 2;
