-- Criação de Views 

-- View da Consulta 4 

CREATE OR REPLACE VIEW vw_conectividade_dependencia AS
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
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_internet_sim,
  ROUND(SUM(CASE WHEN IN_INTERNET IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_internet_sem_dado,

  /* Banda larga */
  SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) AS banda_larga_sim,
  SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) AS banda_larga_sem_dado,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_banda_larga_sim,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_banda_larga_sem_dado,

  /* Rede local */
  SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) AS rede_local_sim,
  SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) AS rede_local_sem_dado,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_rede_local_sim,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 4) AS pct_rede_local_sem_dado

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA;
