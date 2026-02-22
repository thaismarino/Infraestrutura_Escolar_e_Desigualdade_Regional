# Consultas OLAP e Análises

Esta etapa do projeto é responsável pela construção das consultas OLAP, modelagem analítica e geração de análises estratégicas a partir dos dados do Censo Escolar 2024. 

O foco está na análise de desigualdades educacionais com base em:

- Região
- Dependência administrativa
- Localização urbana/rural
- Infraestrutura básica
- Conectividade

---

## Organização das Camadas de Dados

Para garantir rastreabilidade e organização metodológica, os dados foram estruturados em camadas:

### Camada Raw

Arquivo original:

`microdados_ed_basica_2024.csv`

Arquivo bruto contendo todas as variáveis do microdado oficial do Censo Escolar 2024 (INEP).  
O arquivo raw não foi versionado no repositório devido ao tamanho.

### Camada Processed

Arquivo derivado:

`microdados_ed_basica_2024_filtrado.csv`

Arquivo contendo apenas as variáveis necessárias ao escopo analítico da etapa de OLAP.

### Base Relacional

A partir do arquivo filtrado, foi criada no MySQL a tabela:

`microdados_ed_basica`

Essa tabela serve como base estruturada para a construção das consultas OLAP e geração dos indicadores analíticos.

### Dicionário de Dados

Foi elaborado um dicionário específico para o dataset filtrado, contendo:

- Tipo conceitual das variáveis  
- Domínio de valores  
- Descrição analítica  
- Origem dos dados

---

## Consultas Desenvolvidas

Nesta etapa foram desenvolvidas consultas analíticas com foco na identificação de desigualdades estruturais na Educação Básica, contemplando:

1. Conectividade por região  
2. Infraestrutura básica por região  
3. Infraestrutura por dependência administrativa  
4. Conectividade por dependência administrativa  
5. Conectividade por localização (urbana x rural)  
6. Infraestrutura básica por localização  
7. Impacto por matrículas (região)  
8. Impacto por matrículas (dependência administrativa)  
9. Pressão de infraestrutura (matrículas por sala)  
10. Impacto estrutural nas escolas rurais  
11. Percentual de escolas sem rede pública de esgoto por região  

As consultas SQL encontram-se no arquivo `consultas_olap.sql`, e as análises interpretativas com evidências estão documentadas em `analises_olap.md`.

  
