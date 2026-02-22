# Análises OLAP

## 1) Conectividade por Região (IN_INTERNET)

### Evidência (resultado no DBeaver)
![Conectividade por Região](analises/img/01_conectividade_por_regiao.png)

### Interpretação

A análise evidencia disparidade regional no acesso à internet nas escolas brasileiras.

As regiões Centro-Oeste e Sul apresentam percentuais superiores a 90% de conectividade, enquanto a Região Norte apresenta aproximadamente 58,85%, configurando diferença superior a 30 pontos percentuais entre os extremos.

Essa diferença sugere desigualdade estrutural na infraestrutura tecnológica educacional, possivelmente associada a fatores geográficos, econômicos e de investimento público.

O padrão observado confirma que a conectividade escolar apresenta distribuição territorial assimétrica, com maior consolidação nas regiões mais desenvolvidas.

> Observação: A métrica foi calculada com base na proporção de escolas com IN_INTERNET = 1 em relação ao total de escolas por região.

## 2) Infraestrutura básica por Região

### Evidência (resultado no DBeaver)
![Infraestrutura básica por Região](analises/img/02_infraestrutura_basica_por_regiao.png)

### Interpretação

A análise evidencia desigualdade regional consistente nos indicadores de infraestrutura básica escolar.

A Região Norte apresenta os menores percentuais em todos os serviços analisados, com destaque para o acesso à rede pública de esgoto (11,94%) e água (30,91%), indicando forte vulnerabilidade estrutural.

A Região Nordeste também apresenta baixa cobertura de esgoto (32,16%), reforçando a concentração do déficit sanitário nas regiões Norte e Nordeste.

Em contraste, Sul e Centro-Oeste registram os maiores percentuais de cobertura, especialmente no fornecimento de energia elétrica (acima de 91%), evidenciando maior consolidação da infraestrutura básica nessas regiões.

Observa-se que a energia elétrica é o serviço mais universalizado nacionalmente, enquanto o esgotamento sanitário configura o principal gargalo estrutural.

Os dados indicam que as diferenças regionais observadas abrangem não apenas aspectos tecnológicos, mas também serviços básicos essenciais à estrutura física das escolas.

## 3) Infraestrutura por Dependência Administrativa

### Evidência (resultado no DBeaver)
![Infraestrutura por Dependência](analises/img/03_infraestrutura_por_dependencia.png)

### Interpretação

A análise revela desigualdade significativa de infraestrutura conforme a dependência administrativa.

As escolas federais apresentam os maiores percentuais de cobertura em praticamente todos os indicadores, com destaque para energia elétrica (97,65%) e acesso à internet (97,79%), indicando infraestrutura amplamente consolidada.

As escolas privadas também apresentam desempenho elevado e consistente, especialmente no acesso à rede pública de esgoto (73,31%), superior às redes estadual e municipal.

As escolas estaduais apresentam desempenho intermediário, enquanto as escolas municipais, que concentram o maior número absoluto de unidades (128.999), registram os menores percentuais em todos os indicadores analisados, especialmente em esgotamento sanitário (36,87%) e abastecimento de água (57,67%).

Observa-se que o esgotamento sanitário permanece como o principal gargalo estrutural em todas as dependências administrativas.

O esgotamento sanitário mantém-se como o indicador mais crítico entre as dependências administrativas analisadas.

## 4) Conectividade por Dependência Administrativa

### Evidência (resultado no DBeaver)
![Conectividade por Dependência](analises/img/04_conectividade_por_dependencia.png)

### Interpretação

A análise destaca que a desigualdade digital nas escolas brasileiras apresenta forte relação com a dependência administrativa.

Embora o acesso básico à internet esteja relativamente disseminado nas redes estadual, municipal e privada, observa-se diferença mais acentuada quando o indicador é banda larga e presença de rede local estruturada.

As escolas municipais apresentam os menores percentuais tanto de banda larga (63,25%) quanto de rede local (61,93%), indicando que o desafio não está apenas no acesso à internet, mas na qualidade e estrutura da conectividade disponível.

As escolas federais demonstram padrão de conectividade praticamente universalizado, com percentuais superiores a 95% em todos os indicadores digitais.

Os resultados sugerem que a desigualdade digital envolve não apenas presença de conexão, mas também qualidade da infraestrutura tecnológica interna, o que pode impactar diretamente o uso pedagógico da tecnologia.

## 5) Conectividade por Localização (Urbana x Rural)

### Evidência (resultado no DBeaver)
![Conectividade por Localização](analises/img/05_conectividade_por_localizacao.png)

### Interpretação

A análise evidencia uma disparidade expressiva entre escolas urbanas e rurais no que se refere à conectividade digital.

Enquanto 88,43% das escolas urbanas possuem acesso à internet, esse percentual cai para 54,91% nas escolas rurais, configurando diferença superior a 30 pontos percentuais.

A desigualdade torna-se ainda mais acentuada quando observados os indicadores de qualidade da conectividade: apenas 41,51% das escolas rurais possuem banda larga, contra 80,08% nas áreas urbanas. O mesmo padrão é observado na presença de rede local estruturada (78,46% urbano vs. 41,15% rural).

Os resultados indicam que a desigualdade digital no contexto educacional brasileiro está fortemente associada ao território, com maior vulnerabilidade nas áreas rurais, especialmente em relação à qualidade e estrutura da infraestrutura tecnológica disponível.

## 6) Infraestrutura Básica por Localização (Urbana x Rural)

### Evidência (resultado no DBeaver)
![Infraestrutura por Localização](analises/img/06_infraestrutura_por_localizacao.png)

### Interpretação

A análise evidencia disparidade estrutural acentuada entre escolas urbanas e rurais nos indicadores de infraestrutura básica.

Enquanto as escolas urbanas apresentam cobertura superior a 84% em abastecimento de água e quase 90% em energia elétrica e coleta de lixo, as escolas rurais registram percentuais significativamente inferiores, especialmente em esgotamento sanitário, onde apenas 6,56% possuem rede pública.

A diferença superior a 60 pontos percentuais no acesso à rede pública de esgoto indica um déficit sanitário crítico nas áreas rurais.

A magnitude das diferenças evidencia que as condições materiais mínimas de funcionamento escolar apresentam forte variação territorial, especialmente nas áreas rurais, onde os serviços sanitários configuram o principal ponto de fragilidade estrutural.

## 7) Impacto por Matrículas (Região)

### Evidência (resultado no DBeaver)
![Matrículas em escolas com internet e esgoto por região](analises/img/07_matriculas_com_internet_esgoto_por_regiao.png)

### Interpretação

Ao considerar o peso das matrículas, observa-se que a proporção de alunos matriculados em escolas com acesso à internet é elevada na maior parte das regiões, superando 97% no Centro-Oeste, Sul, Sudeste e Nordeste. Mesmo no Norte, o percentual atinge 86,59%, valor superior ao observado quando a métrica considera apenas o número de escolas.

Esse resultado indica que os alunos tendem a estar concentrados em unidades com melhor estrutura de conectividade, reduzindo parcialmente o impacto da desigualdade quando a análise é ponderada pelo volume de matrículas.

Entretanto, o cenário é distinto no indicador de esgotamento sanitário. A Região Norte apresenta apenas 24,62% das matrículas em escolas com acesso à rede pública de esgoto, enquanto o Sudeste atinge 93,97%. A diferença expressiva demonstra que, sob a perspectiva do estudante, a desigualdade estrutural permanece significativa, especialmente nas regiões com menor cobertura sanitária.

A análise ponderada por matrículas permite avaliar não apenas a distribuição de infraestrutura entre escolas, mas também o potencial impacto dessas condições sobre o conjunto de alunos atendidos.
