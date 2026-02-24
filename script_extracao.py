import os
import pandas as pd
from sqlalchemy import create_engine


# ------------------------------------------------------------
# CONFIGURAÇÕES DE CONEXÃO
# As credenciais são obtidas via variáveis de ambiente
# (não ficam expostas no código-fonte).
# ------------------------------------------------------------

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")
DB_NAME = os.getenv("DB_NAME")
DB_PORT = os.getenv("DB_PORT", "3306")


def pipeline_extracao_carga():
    print("--- INICIANDO PROCESSO DE ETL ---")

    # 1. Definição das Colunas (Escopo do Projeto)
    colunas_interesse = [
        'NO_REGIAO', 'SG_UF', 'NO_MUNICIPIO',
        'TP_DEPENDENCIA', 'TP_LOCALIZACAO',
        'IN_AGUA_REDE_PUBLICA', 'IN_ENERGIA_REDE_PUBLICA', 'IN_ESGOTO_REDE_PUBLICA',
        'IN_INTERNET', 'IN_BANDA_LARGA', 'IN_LABORATORIO_INFORMATICA',
        'IN_BIBLIOTECA', 'IN_QUADRA_ESPORTES',
        'QT_SALAS_UTILIZADAS'
    ]

    # 2. Extração (Leitura do CSV)
    arquivo_origem = 'microdados_ed_basica_2024.csv'

    try:
        print(f"1. Lendo arquivo: {arquivo_origem}...")
        df = pd.read_csv(
            arquivo_origem,
            sep=';',
            encoding='latin-1',
            usecols=colunas_interesse
        )
        print(f"   > Sucesso! {len(df)} registros carregados na memória.")
    except FileNotFoundError:
        print(f"   > ERRO: Arquivo {arquivo_origem} não encontrado.")
        return

    # 3. Verificação das credenciais
    if not all([DB_HOST, DB_USER, DB_PASS, DB_NAME]):
        print("   > ERRO: Variáveis de ambiente do banco não configuradas.")
        print("   > Configure: DB_HOST, DB_USER, DB_PASS, DB_NAME e opcionalmente DB_PORT.")
        return

    # 4. Criação da String de Conexão (SQLAlchemy)
    # Formato: mysql+pymysql://user:password@host:port/database
    connection_string = (
        f"mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )

    try:
        print("2. Conectando ao Banco de Dados...")
        engine = create_engine(connection_string)

        with engine.connect() as conn:
            print("   > Conexão estabelecida com sucesso!")

            # 5. Carga (Enviando dados para o MySQL)
            print("3. Enviando dados para a tabela 'stg_escolas_2024'...")
            df.to_sql(
                name='stg_escolas_2024',
                con=engine,
                if_exists='replace',
                index=False,
                chunksize=1000
            )

            print("   > CARGA CONCLUÍDA COM SUCESSO! Dados disponíveis para consulta.")

    except Exception as e:
        print(f"   > ERRO na conexão ou carga: {e}")


if __name__ == "__main__":
    pipeline_extracao_carga()
