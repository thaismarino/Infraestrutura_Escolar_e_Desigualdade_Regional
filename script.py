-- Importa CSV no MySQL criando tabela tipada

import csv
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, text

CSV_PATH = Path(r"C:\csv\microdados_ed_basica_2024_filtrado.csv")
TABLE_NAME = "microdados_ed_basica"

DB_CONFIG = {
    "host": "localhost",
    "port": 3306,
    "user": "seu usuário",
    "password": "sua senha",
    "database": "seu banco de dados",
    # opcional:
    "charset": "utf8mb4",
}

READ_CHUNK_ROWS = 50_000
INSERT_MULTI_ROWS = 2_000


def sniff_csv_dialect(file_path: Path) -> tuple[str, str]:
    raw = file_path.read_bytes()[:200_000]
    for enc in ("utf-8", "latin1"):
        try:
            sample = raw.decode(enc)
            dialect = csv.Sniffer().sniff(sample, delimiters=";,\t|")
            return dialect.delimiter, enc
        except Exception:
            continue
    return ";", "latin1"


def build_engine():
    url = (
        f"mysql+pymysql://{DB_CONFIG['user']}:{DB_CONFIG['password']}"
        f"@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
        f"?charset={DB_CONFIG.get('charset','utf8mb4')}"
    )
    return create_engine(url, pool_pre_ping=True, future=True)


def mysql_type_for_column(col: str) -> str:
    # Regras por prefixo (padrão INEP/microdados)
    if col.startswith("NO_"):
        return "VARCHAR(255)"
    if col.startswith("SG_"):
        return "VARCHAR(20)"
    if col.startswith("IN_"):
        return "TINYINT"
    if col.startswith(("QT_", "CO_", "TP_")):
        return "INT"
    return "TEXT"


def create_typed_table(engine, columns: list[str]):
    cols_sql = ",\n  ".join([f"`{c}` {mysql_type_for_column(c)} NULL" for c in columns])

    ddl = f"""
    CREATE TABLE IF NOT EXISTS `{TABLE_NAME}` (
      `__id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
      {cols_sql},
      PRIMARY KEY (`__id`)
    ) ENGINE=InnoDB DEFAULT CHARSET={DB_CONFIG.get('charset','utf8mb4')};
    """

    with engine.begin() as conn:
        conn.execute(text(ddl))


def coerce_chunk_types(df: pd.DataFrame) -> pd.DataFrame:
   
    # numéricas por prefixo
    int_cols = [c for c in df.columns if c.startswith(("CO_", "TP_", "QT_", "IN_"))]

    for c in int_cols:
        # transforma para numérico, inválidos viram NaN, depois vira inteiro nullable
        df[c] = pd.to_numeric(df[c], errors="coerce").astype("Int64")

    # textos
    text_cols = [c for c in df.columns if c.startswith(("NO_", "SG_"))]
    for c in text_cols:
        # garante string/None
        df[c] = df[c].where(df[c].notna(), None)

    return df


def main():
    if not CSV_PATH.exists():
        raise FileNotFoundError(f"Arquivo não encontrado: {CSV_PATH}")

    sep, encoding = sniff_csv_dialect(CSV_PATH)
    print(f"Detectado: sep={sep!r}, encoding={encoding!r}")

    engine = build_engine()

    # Cabeçalho
    header_df = pd.read_csv(CSV_PATH, sep=sep, encoding=encoding, nrows=0, low_memory=False)
    columns = header_df.columns.tolist()
    if not columns:
        raise ValueError("Não foi possível ler o cabeçalho do CSV.")

    # Cria tabela tipada
    create_typed_table(engine, columns)
    print(f"Tabela criada/ok: {TABLE_NAME}")

    total = 0

    for chunk in pd.read_csv(
        CSV_PATH,
        sep=sep,
        encoding=encoding,
        chunksize=READ_CHUNK_ROWS,
        dtype=str,          # lê tudo como string e depois converte com segurança
        keep_default_na=False,
        na_values=[],
        low_memory=False,
    ):
        # normaliza vazios para None (vira NULL)
        chunk = chunk.replace({"": None})

        # converte para os tipos corretos no pandas antes de inserir
        chunk = coerce_chunk_types(chunk)

        chunk.to_sql(
            TABLE_NAME,
            con=engine,
            if_exists="append",
            index=False,
            method="multi",
            chunksize=INSERT_MULTI_ROWS,
        )

        total += len(chunk)
        print(f"Inseridas {len(chunk):,} linhas (total {total:,})")

    print("Concluído.")


if __name__ == "__main__":
    main()
