-- Criação de Views 

-- View da Consulta 3  

CREATE OR REPLACE VIEW vw_infraestrutura_dependencia AS
SELECT
  TP_DEPENDENCIA,
  CASE 
    WHEN TP_DEPENDENCIA = 1 THEN 'Federal' 
    WHEN TP_DEPENDENCIA = 2 THEN 'Estadual'
    WHEN TP_DEPENDENCIA = 3 THEN 'Municipal'
    ELSE 'Privada' 
  END AS desc_dependencia,
  
  COUNT(*) AS total_escolas,

  /* ÁGUA */
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS agua_sim,
  SUM(CASE WHEN IN_AGUA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS agua_sem_dado,
  ROUND(
      SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) 
      / NULLIF(COUNT(*),0),
      4
  ) AS pct_agua_sim,

  /* ESGOTO */
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS esgoto_sim,
  SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS esgoto_sem_dado,
  ROUND(
      SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) 
      / NULLIF(COUNT(*),0),
      4
  ) AS pct_esgoto_sim,

  /* ENERGIA */
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) AS energia_sim,
  SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA IS NULL THEN 1 ELSE 0 END) AS energia_sem_dado,
  ROUND(
      SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) 
      / NULLIF(COUNT(*),0),
      4
  ) AS pct_energia_sim,

  /* INTERNET */
  SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS internet_sim,
  SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) AS internet_sem_dado,
  ROUND(
      SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) 
      / NULLIF(COUNT(*),0),
      4
  ) AS pct_internet_sim

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA;
