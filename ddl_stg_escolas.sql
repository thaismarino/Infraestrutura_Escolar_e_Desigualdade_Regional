CREATE TABLE stg_escolas_2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    no_regiao VARCHAR(50),
    sg_uf CHAR(2),
    no_municipio VARCHAR(100),
    tp_dependencia INT,
    tp_localizacao INT,
    in_agua_rede_publica TINYINT,
    in_energia_rede_publica TINYINT,
    in_esgoto_rede_publica TINYINT,
    in_internet TINYINT,
    in_banda_larga TINYINT,
    in_laboratorio_informatica TINYINT,
    in_biblioteca TINYINT,
    in_quadra_esportes TINYINT,
    qt_salas_utilizadas INT
);