# Consultas OLAP e Análises

Esta etapa do projeto é responsável pela construção das consultas OLAP, modelagem análitica e geração de análises estratégicas a partir do dados do Censo Escolar 2024. 

O foco está na análise de desigualdades educacionais com base em: 
- Região
- Dependência administrativa
- Localização urbana/rural
- Infraestutura básica
- Conectividade

## Base Utilizada

Os dados utilizados nesta etapa foram organizados em duas camadas:

### Arquivo Original 

microdados_ed_basica_2024.csv
Arquivo bruto contendo todas as variáveis do microdado do Censo Escolar 2024.

### Arquivo Filtrado 

microdados_ed_basica_2024_filtrado.csv
Arquivo derivado contendo apenas as variáveis necessárias ao escopo da etapa de OLAP.

### Base Relacional

A partir do arquivo filtrado, foi criado no MySQL a tabela:
microdados_ed_basica

Essa tabela serve como base para as consultas OLAP e geração dos indicadores analíticos. 



  
