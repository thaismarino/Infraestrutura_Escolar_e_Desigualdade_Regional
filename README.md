   📊 ETL – Camada de Staging  
 Projeto: Censo Escolar 2024

Este repositório contém o pipeline de *Extração e Carga (ETL)* responsável pela ingestão dos microdados do Censo Escolar 2024 em uma camada intermediária de staging no MySQL.

A base de dados é disponibilizada pelo Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP).


# 🏗 Arquitetura da Solução
A solução foi desenvolvida utilizando:
- Python  
- Pandas  
- SQLAlchemy  
- MySQL  
- DBeaver  

*Fluxo do processo:*

CSV (Fonte Bruta)
↓
Pandas (Extração + Estruturação)
↓
SQLAlchemy
↓
MySQL (Tabela stg_escolas_2024)



 🗄 Camada de Staging – stg_escolas_2024

A tabela stg_escolas_2024 atua como camada intermediária de ingestão, com as seguintes características:

- Recebe dados estruturados sem aplicação de regras analíticas  
- Não contém modelagem dimensional  
- Não aplica cálculos ou agregações  
- É recriada a cada execução do pipeline  

A estrutura da tabela é gerada dinamicamente durante a execução do método DataFrame.to_sql(), com base na inferência automática de tipos realizada pelo Pandas.


🔄 Processo ETL

1️⃣ Extração
 A extração ocorre a partir do arquivo: microdados_ed_basica_2024.csv

Características técnicas do arquivo:
- Separador: ;
- Codificação: latin-1
- Alto volume de registros

Leitura realizada via:

pd.read_csv(
    arquivo_origem,
    sep=';',
    encoding='latin-1',
    usecols=colunas_interesse
)

*Estratégias aplicadas:*
- Uso de usecols para leitura seletiva
- Redução de consumo de memória
- Otimização de performance
- 
 2️⃣ Preparação Estrutural (Staging)

Nesta etapa não são aplicadas transformações analíticas.
O processamento inclui:
- Seleção programática das colunas relevantes
- Organização do DataFrame conforme estrutura esperada
- Inferência automática de tipos de dados pelo Pandas
- Garantia de compatibilidade estrutural com o MySQL

A camada mantém os dados em estado próximo ao original, preservando granularidade.
 3️⃣ Carga no MySQL

Carga realizada por meio do método:

df.to_sql(
    name='stg_escolas_2024',
    con=engine,
    if_exists='replace',
    index=False,
    chunksize=1000
)

*Parâmetros relevantes*
- if_exists='replace' 
Garante recriação da tabela a cada execução (evita duplicidade).
- chunksize=1000 
Realiza inserção em lotes para:
- Reduzir consumo de memória
- Melhorar desempenho
- Minimizar risco de falha em grandes volumes
- Internamente, o SQLAlchemy gera múltiplos comandos INSERT automatizados.

 ✅ Validação Pós-Carga

Validação realizada via DBeaver com consulta:

SELECT COUNT(*) FROM stg_escolas_2024;

Verificações executadas:
- Conferência de total de registros
- Inspeção amostral de dados
- Validação estrutural das colunas
- 
  ⚙️ Características Técnicas da Camada

- Processo idempotente (recriação da tabela)
- Automação completa via Python
- Carga em batches
- Separação arquitetural entre ingestão e camada analítica
- Estrutura reprodutível

📌 Limitações da Camada de Staging

- Não possui constraints explícitas (PRIMARY KEY, FOREIGN KEY)
- Não possui indexação
- Não contém regras de negócio
- Não realiza transformação semântica
- A camada foi projetada exclusivamente para ingestão estruturada.

🚀 Próximas Evoluções

- Implementação de logging estruturado
- Criação de camada de transformação (curated layer)
- Estratégia de carga incremental
- Indexação para consultas analíticas

 Observação
Este pipeline foi desenvolvido com foco em organização estrutural e reprodutibilidade do processo de ingestão de dados educacionais em ambiente relacional.
 Detalhamento Técnico do Processo de ETL e Carga (Camada de Staging)

A etapa de ETL foi estruturada com foco na ingestão controlada dos microdados do Censo Escolar 2024 em uma camada intermediária de armazenamento, denominada stg_escolas_2024. Essa camada foi concebida como ambiente técnico de staging, responsável por receber e organizar preliminarmente os dados brutos antes de qualquer consolidação analítica ou modelagem dimensional.

A estrutura da tabela stg_escolas_2024 não foi criada manualmente por meio de script SQL tradicional. Sua definição ocorreu dinamicamente durante a execução do pipeline em Python, por meio do método DataFrame.to_sql(), integrado ao SQLAlchemy para comunicação com o MySQL. Ao utilizar o parâmetro if_exists='replace', o processo passou a recriar automaticamente a tabela a cada execução, garantindo que a estrutura refletisse fielmente o DataFrame gerado na etapa de extração. Os tipos de dados no MySQL foram determinados com base na inferência automática realizada pelo Pandas durante a leitura do arquivo CSV, sendo posteriormente convertidos para tipos compatíveis pelo mecanismo de abstração do SQLAlchemy.

O processo de extração iniciou-se com a leitura do arquivo original microdados_ed_basica_2024.csv, disponibilizado pelo Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP). O arquivo, estruturado em formato .CSV, utiliza separador ; e codificação latin-1, características que foram explicitamente definidas na função pd.read_csv() para garantir correta interpretação dos dados. Durante essa etapa, foi utilizada a parametrização usecols, permitindo a leitura seletiva apenas das colunas relevantes para a composição da camada de estágio. Essa estratégia reduziu significativamente o consumo de memória e aumentou a eficiência do carregamento, especialmente considerando o elevado volume de registros do Censo Escolar.

A etapa de preparação dos dados teve caráter exclusivamente estrutural. Não foram aplicadas transformações analíticas, cálculos derivados ou agregações. O tratamento realizado consistiu na organização do DataFrame conforme o conjunto de colunas previamente definido, assegurando compatibilidade nominal e estrutural com a tabela que seria criada no MySQL. A inferência automática de tipos pelo Pandas garantiu que variáveis numéricas fossem reconhecidas como inteiros ou floats, enquanto variáveis categóricas e textuais fossem interpretadas como strings. Essa inferência foi utilizada como base para a geração do schema no banco de dados, mantendo coerência entre a estrutura em memória e a estrutura persistida.

A etapa de carga foi realizada integralmente por meio do método to_sql(), responsável por transferir os dados do DataFrame para o banco relacional. O envio ocorreu em lotes de mil registros (chunksize=1000), estratégia adotada para evitar sobrecarga de memória e otimizar a comunicação entre a aplicação Python e o servidor MySQL. Internamente, o SQLAlchemy gerou automaticamente múltiplos comandos INSERT, realizando a inserção em massa de forma automatizada e transacional. O uso de if_exists='replace' assegurou que execuções subsequentes do pipeline não gerassem duplicidade de registros, uma vez que a tabela é recriada a cada execução.

Após a conclusão da carga, a validação foi realizada por meio do DBeaver, utilizando consulta SQL para verificação da contagem total de registros inseridos na tabela stg_escolas_2024. A consulta SELECT COUNT(*) FROM stg_escolas_2024; permitiu comparar o total persistido no banco com o número de registros carregados inicialmente no DataFrame, assegurando completude da operação. Também foi realizada inspeção exploratória das primeiras linhas para confirmar consistência estrutural e integridade aparente dos dados.

É importante destacar que a camada stg_escolas_2024 não possui modelagem dimensional, não contém cálculos de indicadores e não aplica regras de negócio. Sua função é exclusivamente atuar como camada transitória de ingestão, garantindo organização preliminar e reprodutibilidade do processo. A consolidação analítica e a preparação para consultas OLAP foram realizadas posteriormente em estrutura complementar, mantendo separação arquitetural entre ingestão e análise.
