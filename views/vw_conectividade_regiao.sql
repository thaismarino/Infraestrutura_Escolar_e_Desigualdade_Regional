-- Criação de Views 

-- View Consulta 1 

CREATE OR REPLACE VIEW vw_conectividade_regiao AS
SELECT
  NO_REGIAO,

  COUNT(*) AS total_escolas,

  SUM(CASE WHEN IN_INTERNET IN (0,1) THEN 1 ELSE 0 END) AS escolas_com_dado,

  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS escolas_com_internet,
  SUM(CASE WHEN IN_INTERNET = 0 THEN 1 ELSE 0 END) AS escolas_sem_internet,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS escolas_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0),
    4
  ) AS percentual_com_internet,

  ROUND(
    SUM(CASE WHEN IN_INTERNET = 0 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0),
    4
  ) AS percentual_sem_internet,

  ROUND(
    SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0),
    4
  ) AS percentual_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO;
