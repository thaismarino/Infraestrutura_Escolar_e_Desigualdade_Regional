-- 1) Percentual de escolas com acesso à internet por região

SELECT
    NO_REGIAO,
    COUNT(*) AS total_escolas,
    SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) AS escolas_com_internet,
    ROUND(
        (SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS percentual_com_internet
FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY percentual_com_internet DESC;

-- 2) Infraestrutura básica por região (percentuais)

SELECT
    NO_REGIAO,
    COUNT(*) AS total_escolas,

    ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_agua_rede_publica,
    ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_esgoto_rede_publica,
    ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_energia_rede_publica,
    ROUND(SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_coleta_lixo

FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY NO_REGIAO;

-- 3) Infraestrutura básica por dependência administrativa

SELECT
    TP_DEPENDENCIA,
    COUNT(*) AS total_escolas,

    ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_agua_rede_publica,
    ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_esgoto_rede_publica,
    ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_energia_rede_publica,
    ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS pct_internet

FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 4) Conectividade por dependência administrativa (percentuais)

SELECT
  TP_DEPENDENCIA,
  COUNT(*) AS total_escolas,
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_internet,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_banda_larga,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_rede_local
FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 5) Conectividade por localização (urbana/rural)

SELECT
  TP_LOCALIZACAO,
  COUNT(*) AS total_escolas,
  ROUND(SUM(CASE WHEN IN_INTERNET = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_internet,
  ROUND(SUM(CASE WHEN IN_BANDA_LARGA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_banda_larga,
  ROUND(SUM(CASE WHEN TP_REDE_LOCAL IN (1,2,3) THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_rede_local
FROM microdados_ed_basica
GROUP BY TP_LOCALIZACAO
ORDER BY TP_LOCALIZACAO;

-- 6) Infraestrutura básica por localização (urbana/rural)

SELECT
  TP_LOCALIZACAO,
  COUNT(*) AS total_escolas,
  ROUND(SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_agua_rede_publica,
  ROUND(SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_esgoto_rede_publica,
  ROUND(SUM(CASE WHEN IN_ENERGIA_REDE_PUBLICA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_energia_rede_publica,
  ROUND(SUM(CASE WHEN IN_LIXO_SERVICO_COLETA = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS pct_coleta_lixo
FROM microdados_ed_basica
GROUP BY TP_LOCALIZACAO
ORDER BY TP_LOCALIZACAO;

-- 7) Impacto por matrícula: % de matrículas em escolas com internet e com esgoto de rede (por região)
-- Métrica: soma de QT_MAT_BAS nas escolas com o recurso / soma total de QT_MAT_BAS na região

SELECT
  NO_REGIAO,
  SUM(QT_MAT_BAS) AS total_matriculas,
  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN QT_MAT_BAS ELSE 0 END) / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_em_escolas_com_internet,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN QT_MAT_BAS ELSE 0 END) / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_em_escolas_com_esgoto_rede
FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY pct_matriculas_em_escolas_com_internet DESC;

-- 8) Impacto por matrícula: dependência administrativa
-- Métrica: % das matrículas em escolas com internet e esgoto de rede

SELECT
  TP_DEPENDENCIA,
  SUM(QT_MAT_BAS) AS total_matriculas,
  ROUND(
    SUM(CASE WHEN IN_INTERNET = 1 THEN QT_MAT_BAS ELSE 0 END) / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_com_internet,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN QT_MAT_BAS ELSE 0 END) / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_com_esgoto_rede
FROM microdados_ed_basica
GROUP BY TP_DEPENDENCIA
ORDER BY TP_DEPENDENCIA;

-- 9) Pressão de infraestrutura: matrículas por sala por região
-- Métrica: total de matrículas / total de salas utilizadas

SELECT
  NO_REGIAO,
  SUM(QT_MAT_BAS) AS total_matriculas,
  SUM(QT_SALAS_UTILIZADAS) AS total_salas,
  ROUND(
    SUM(QT_MAT_BAS) / NULLIF(SUM(QT_SALAS_UTILIZADAS),0),
    2
  ) AS matriculas_por_sala
FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY matriculas_por_sala DESC;

-- 10) Impacto por matrícula nas escolas rurais (infraestrutura básica)

SELECT
  COUNT(*) AS total_escolas_rurais,
  SUM(QT_MAT_BAS) AS total_matriculas_rurais,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 1 THEN QT_MAT_BAS ELSE 0 END) 
    / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_rurais_com_esgoto,
  ROUND(
    SUM(CASE WHEN IN_AGUA_REDE_PUBLICA = 1 THEN QT_MAT_BAS ELSE 0 END) 
    / NULLIF(SUM(QT_MAT_BAS),0) * 100,
    2
  ) AS pct_matriculas_rurais_com_agua
FROM microdados_ed_basica
WHERE TP_LOCALIZACAO = 2;

-- 11) Percentual de escolas sem rede publica de esgoto por regiao

SELECT
  NO_REGIAO,
  COUNT(*) AS total_escolas,
  ROUND(
    SUM(CASE WHEN IN_ESGOTO_REDE_PUBLICA = 0 THEN 1 ELSE 0 END) 
    / COUNT(*) * 100,
    2
  ) AS pct_escolas_sem_esgoto
FROM microdados_ed_basica
GROUP BY NO_REGIAO
ORDER BY pct_escolas_sem_esgoto DESC;
