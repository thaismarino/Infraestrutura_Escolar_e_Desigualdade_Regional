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
