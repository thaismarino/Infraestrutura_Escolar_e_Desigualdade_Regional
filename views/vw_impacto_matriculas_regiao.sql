-- Criação de View 

-- View Consulta 

CREATE OR REPLACE VIEW vw_impacto_matriculas_regiao AS
SELECT
  NO_REGIAO,

  /* Total de matrículas */
  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas,

  /* INTERNET */
  SUM(
    CASE WHEN IN_INTERNET = 1
         THEN COALESCE(QT_MAT_BAS, 0)
         ELSE 0
    END
  ) AS mat_em_escolas_com_internet,

  SUM(
    CASE WHEN IN_INTERNET IS NULL
         THEN COALESCE(QT_MAT_BAS, 0)
         ELSE 0
    END
  ) AS mat_em_escolas_internet_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_mat_em_escolas_com_internet,

  ROUND(
    SUM(CASE WHEN IN_INTERNET IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_mat_internet_sem_dado,

  /* ESGOTO */
  SUM(
    CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1
         THEN COALESCE(QT_MAT_BAS, 0)
         ELSE 0
    END
  ) AS mat_em_escolas_com_esgoto_rede,

  SUM(
    CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL
         THEN COALESCE(QT_MAT_BAS, 0)
         ELSE 0
    END
  ) AS mat_em_escolas_esgoto_sem_dado,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_mat_em_escolas_com_esgoto_rede,

  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA IS NULL THEN COALESCE(QT_MAT_BAS,0) ELSE 0 END)
    / NULLIF(SUM(COALESCE(QT_MAT_BAS,0)), 0),
    4
  ) AS pct_mat_esgoto_sem_dado

FROM microdados_ed_basica
GROUP BY NO_REGIAO;
