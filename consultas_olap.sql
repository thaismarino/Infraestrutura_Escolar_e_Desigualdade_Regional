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
