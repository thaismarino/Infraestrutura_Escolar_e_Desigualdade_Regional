-- Criação de Views 

-- View da Consulta 11

CREATE OR REPLACE VIEW vw_escolas_sem_esgoto_regiao AS
SELECT
  NO_REGIAO,

  COUNT(*) AS total_escolas,

  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IN (0,1) THEN 1 ELSE 0 END) AS escolas_com_dado,

  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 0 THEN 1 ELSE 0 END) AS escolas_sem_esgoto,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS escolas_com_esgoto,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS escolas_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 0 THEN 1 ELSE 0 END)
    / NULLIF(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IN (0,1) THEN 1 ELSE 0 END), 0),
    4
  ) AS pct_escolas_sem_esgoto,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END)
    / NULLIF(COUNT(*), 0),
    4
  ) AS pct_escolas_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO;
