# Dicionário de Dados 

microdados_ed_basica_2024_filtrado.csv 

Este documento descreve as variáveis presentes no dataset filtrado utilizado na etapa de Consultas OLAP. 

| Variável | Tipo (conceitual) | Descrição | Domínio / Valores | Origem |
|---|---|---|---|---|
| CO_ENTIDADE | Numérico (inteiro, identificador) | Código identificador da escola | Código INEP da escola | INEP |
| CO_REGIAO | Numérico (inteiro, categórico) | Código da Região Geográfica | 1 a 5 (conforme dicionário INEP) | INEP |
| NO_REGIAO | Texto | Nome da Região Geográfica | Ex.: Norte, Nordeste, Sudeste, Sul, Centro-Oeste | INEP |
| CO_UF | Numérico (inteiro, categórico) | Código da Unidade da Federação | Código IBGE/INEP da UF | INEP |
| SG_UF | Texto (sigla) | Sigla da Unidade da Federação | Ex.: RJ, SP, MG | INEP |
| CO_MUNICIPIO | Numérico (inteiro, categórico) | Código do Município | Código IBGE do município | INEP |
| NO_MUNICIPIO | Texto | Nome do Município | Texto | INEP |
| TP_DEPENDENCIA | Numérico (categórico) | Dependência administrativa da escola | 1=Federal; 2=Estadual; 3=Municipal; 4=Privada | INEP |
| TP_LOCALIZACAO | Numérico (categórico) | Localização da escola | 1=Urbana; 2=Rural | INEP |
| TP_REDE_LOCAL | Numérico (categórico) | Tipo de rede local de interligação de computadores | 0=Não há; 1=Cabo; 2=Wireless; 3=Cabo e Wireless; 9=Não informado | INEP |
| IN_AGUA_REDE_PUBLICA | Indicador binário (0/1) | Abastecimento de água por rede pública | 0=Não; 1=Sim | INEP |
| IN_ESGOTO_REDE_PUBLICA | Indicador binário (0/1) | Esgoto sanitário por rede pública | 0=Não; 1=Sim | INEP |
| IN_ENERGIA_REDE_PUBLICA | Indicador binário (0/1) | Abastecimento de energia elétrica por rede pública | 0=Não; 1=Sim | INEP |
| IN_LIXO_SERVICO_COLETA | Indicador binário (0/1) | Destinação do lixo por serviço de coleta | 0=Não; 1=Sim | INEP |
| IN_INTERNET | Indicador binário (0/1) | Acesso à Internet na escola | 0=Não; 1=Sim | INEP |
| IN_BANDA_LARGA | Indicador (0/1/NA) | Internet banda larga | 0=Não; 1=Sim; NA=Não aplicável (escolas sem internet) | INEP |
| IN_ACESSO_INTERNET_COMPUTADOR | Indicador (0/1/9) | Alunos acessam internet da escola por computadores/tablets da escola | 0=Não; 1=Sim; 9=Não informado | INEP |
| IN_BIBLIOTECA | Indicador binário (0/1) | Existência de biblioteca | 0=Não; 1=Sim | INEP |
| IN_LABORATORIO_INFORMATICA | Indicador binário (0/1) | Existência de laboratório de informática | 0=Não; 1=Sim | INEP |
| IN_LABORATORIO_CIENCIAS | Indicador binário (0/1) | Existência de laboratório de ciências | 0=Não; 1=Sim | INEP |
| IN_BANHEIRO | Indicador binário (0/1) | Existência de banheiro | 0=Não; 1=Sim | INEP |
| IN_BANHEIRO_PNE | Indicador binário (0/1) | Banheiro acessível (PNE/mobilidade reduzida) | 0=Não; 1=Sim | INEP |
| IN_BANHEIRO_FUNCIONARIOS | Indicador binário (0/1) | Banheiro exclusivo para funcionários | 0=Não; 1=Sim | INEP |
| IN_COZINHA | Indicador binário (0/1) | Existência de cozinha | 0=Não; 1=Sim | INEP |
| IN_REFEITORIO | Indicador binário (0/1) | Existência de refeitório | 0=Não; 1=Sim | INEP |
| IN_ALMOXARIFADO | Indicador binário (0/1) | Existência de almoxarifado | 0=Não; 1=Sim | INEP |
| IN_QUADRA_ESPORTES | Indicador binário (0/1) | Existência de quadra de esportes (coberta ou descoberta) | 0=Não; 1=Sim | INEP |
| IN_PARQUE_INFANTIL | Indicador binário (0/1) | Existência de parque infantil | 0=Não; 1=Sim | INEP |
| IN_AREA_VERDE | Indicador binário (0/1) | Existência de área verde/vegetação/gramado | 0=Não; 1=Sim | INEP |
| IN_PATIO_COBERTO | Indicador binário (0/1) | Existência de pátio coberto | 0=Não; 1=Sim | INEP |
| QT_SALAS_UTILIZADAS_DENTRO | Numérico (inteiro, contagem) | Nº de salas de aula utilizadas dentro do prédio | Inteiro >= 0 | INEP |
| QT_SALAS_UTILIZADAS_FORA | Numérico (inteiro, contagem) | Nº de salas de aula utilizadas fora do prédio | Inteiro >= 0 | INEP |
| QT_SALAS_UTILIZADAS | Numérico (inteiro, contagem) | Nº total de salas de aula utilizadas (dentro + fora) | Inteiro >= 0 | INEP |
| QT_SALAS_UTILIZA_CLIMATIZADAS | Numérico (inteiro, contagem) | Nº de salas de aula climatizadas | Inteiro >= 0 | INEP |
| QT_SALAS_UTILIZADAS_ACESSIVEIS | Numérico (inteiro, contagem) | Nº de salas de aula com acessibilidade | Inteiro >= 0 | INEP |
| QT_MAT_BAS | Numérico (inteiro, contagem) | Nº de matrículas da Educação Básica | Inteiro >= 0 | INEP |
| QT_MAT_INF | Numérico (inteiro, contagem) | Nº de matrículas da Educação Infantil | Inteiro >= 0 | INEP |
| QT_MAT_INF_CRE | Numérico (inteiro, contagem) | Nº de matrículas da Educação Infantil (Creche) | Inteiro >= 0 | INEP |
| QT_MAT_INF_PRE | Numérico (inteiro, contagem) | Nº de matrículas da Educação Infantil (Pré-escola) | Inteiro >= 0 | INEP |
| QT_MAT_FUND | Numérico (inteiro, contagem) | Nº de matrículas do Ensino Fundamental | Inteiro >= 0 | INEP |
| QT_MAT_FUND_AI | Numérico (inteiro, contagem) | Nº de matrículas do Ensino Fundamental (Anos iniciais) | Inteiro >= 0 | INEP |
| QT_MAT_FUND_AF | Numérico (inteiro, contagem) | Nº de matrículas do Ensino Fundamental (Anos finais) | Inteiro >= 0 | INEP |
| QT_MAT_MED | Numérico (inteiro, contagem) | Nº de matrículas do Ensino Médio | Inteiro >= 0 | INEP |
| QT_MAT_MED_PROP | Numérico (inteiro, contagem) | Nº de matrículas do Ensino Médio (Propedêutico) | Inteiro >= 0 | INEP |
