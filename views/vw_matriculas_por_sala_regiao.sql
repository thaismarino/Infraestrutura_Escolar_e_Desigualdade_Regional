-- Criação de View 

-- View Consulta 9 

CREATE OR REPLACE VIEW vw_matriculas_por_sala_regiao AS
SELECT
  NO_REGIAO,

  SUM(COALESCE(QT_MAT_BAS, 0)) AS total_matriculas,

  SUM(
    CASE
      WHEN QT_SALAS_UTILIZADAS IS NOT NULL AND QT_SALAS_UTILIZADAS > 0
      THEN QT_SALAS_UTILIZADAS
      ELSE 0
    END
  ) AS total_salas_validas,

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
GROUP BY NO_REGIAO;
