# Análises OLAP

As análises a seguir foram estruturadas em três eixos principais: território (região e localização), dependência administrativa e impacto ponderado por matrícula, permitindo avaliar desigualdades educacionais sob diferentes perspectivas estruturais.

---

## 1) Conectividade por Região (IN_INTERNET)

### Evidência (resultado no DBeaver)
![Conectividade por Região](analises/img/01_conectividade_por_regiao.png)

### Interpretação

A análise evidencia desigualdade regional no acesso à internet nas escolas brasileiras, considerando o total de unidades por região.

As regiões Centro-Oeste (**91,51%**) e Sul (**90,65%**) apresentam os maiores percentuais de escolas com acesso à internet, indicando elevado nível de conectividade institucional.

Em contraste, a Região Norte registra apenas **58,85%** de escolas com internet, além de apresentar o maior percentual de escolas sem acesso (**29,26%**), configurando diferença superior a 30 pontos percentuais entre os extremos regionais.

O Nordeste e o Sudeste apresentam níveis intermediários de conectividade, com **73,56%** e **80,18%**, respectivamente, mas também concentram proporção relevante de registros sem informação declarada (**19,45%** no Nordeste e **18,09%** no Sudeste).

A presença de escolas sem dado declarado varia entre as regiões, sendo mais expressiva no Nordeste e Sudeste, o que indica possível fragilidade no preenchimento ou na consolidação das informações.

De forma geral, os resultados confirmam distribuição territorial desigual da infraestrutura tecnológica educacional, com maior consolidação nas regiões mais desenvolvidas e maiores déficits estruturais nas regiões Norte e Nordeste.

> Observação: A métrica foi calculada com base na proporção de escolas com IN_INTERNET = 1 em relação ao total de escolas por região, incluindo no denominador as escolas sem informação declarada.



### Evidência (Power BI) - Consulta 1

![Conectividade por Região - Power BI](analises/img/01_conectividade_por_regiao_powerbi.png)

O painel confirma os resultados obtidos na consulta SQL, evidenciando maior concentração de conectividade nas regiões Centro-Oeste e Sul, e menor cobertura na Região Norte.

---

## 2) Infraestrutura básica por Região

### Evidência (resultado no DBeaver)
![Infraestrutura básica por Região](analises/img/02_infraestrutura_basica_por_regiao.png)

### Interpretação

A análise evidencia desigualdade regional consistente nos indicadores de infraestrutura básica escolar, considerando o total de escolas por região e a presença de registros sem informação declarada.

A Região Norte concentra os menores percentuais de cobertura em todos os serviços analisados, com maior criticidade no acesso à rede pública de esgoto (**11,94%**) e à água por rede pública (**30,91%**), indicando vulnerabilidade estrutural relevante. O Nordeste também apresenta baixa cobertura de esgoto (**32,16%**), reforçando a concentração do déficit sanitário nas regiões Norte e Nordeste.

Em contraste, Sul e Centro-Oeste registram os maiores percentuais de cobertura, sobretudo no fornecimento de energia elétrica (acima de **91%**) e em coleta de lixo (aproximadamente **86%** a **90%**), evidenciando maior consolidação da infraestrutura básica nessas regiões.

Observa-se que a energia elétrica é o serviço mais universalizado entre os indicadores avaliados, enquanto o esgotamento sanitário permanece como o principal gargalo estrutural no país.

Além disso, há variação regional na proporção de registros sem dado informado para cada indicador, com maior impacto no Sudeste e Nordeste, o que sugere cautela na leitura comparativa e possível fragilidade no preenchimento ou consolidação dos microdados.

> Observação: Os percentuais foram calculados sobre o total de escolas por região. Na camada analítica, a view retorna percentuais no padrão 0–1, e a formatação em porcentagem é aplicada no Power BI.


### Evidência Visual (Power BI) - Consulta 2 

![Infraestrutura básica por Região - Power BI](analises/img/02_infraestrutura_basica_por_regiao_powerbi.png)

O gráfico confirma os percentuais obtidos via SQL e facilita a comparação direta entre os serviços por região, destacando o esgotamento sanitário como principal gargalo.

---

## 3) Infraestrutura por Dependência Administrativa

### Evidência (resultado no DBeaver)
![Infraestrutura por Dependência](analises/img/03_infraestrutura_por_dependencia.png)

### Interpretação

A análise evidencia desigualdade relevante na infraestrutura escolar conforme a dependência administrativa.

As escolas federais apresentam os maiores percentuais de cobertura em praticamente todos os indicadores, com destaque para energia elétrica (**97,65%**) e acesso à internet (**97,79%**), indicando infraestrutura amplamente consolidada nesse segmento.

As escolas privadas também demonstram desempenho elevado, especialmente no acesso à rede pública de esgoto (**73,31%**), percentual significativamente superior ao observado nas redes estadual (**56,20%**) e municipal (**36,87%**).

As escolas estaduais apresentam desempenho intermediário, enquanto as escolas municipais, que concentram o maior número absoluto de unidades (**128.999**), registram os menores percentuais em todos os indicadores analisados, com destaque para o esgotamento sanitário (**36,87%**) e abastecimento de água por rede pública (**57,67%**).

Observa-se que o esgotamento sanitário constitui o principal gargalo estrutural entre as redes públicas, especialmente na esfera municipal, onde se concentra a maior parcela das escolas do país.

Os resultados indicam que a desigualdade de infraestrutura não se limita a diferenças regionais, mas também se manifesta de forma significativa entre os diferentes níveis de administração escolar.


### Evidência Visual (Power BI) - Consulta 3 

![Infraestrutura por Dependência - Power BI](analises/img/03_infraestrutura_por_dependencia_powerbi.png)

A visualização confirma o contraste estrutural entre as redes federal e privada, com maiores níveis de cobertura, e a rede municipal, que apresenta os menores percentuais, especialmente em esgotamento sanitário. A diferença é mais acentuada no indicador de esgoto, evidenciando vulnerabilidade estrutural concentrada nas escolas municipais.

---

## 4) Conectividade por Dependência Administrativa

### Evidência (resultado no DBeaver)
![Conectividade por Dependência](analises/img/04_conectividade_por_dependencia.png)

### Interpretação

A análise evidencia desigualdade digital associada à dependência administrativa das escolas.

As escolas federais apresentam níveis de conectividade amplamente consolidados, com percentuais superiores a **95%** em todos os indicadores analisados, indicando infraestrutura digital praticamente universalizada nesse segmento.

As redes estadual e privada apresentam desempenho intermediário. Embora o acesso básico à internet ultrapasse **80%** nessas redes, observa-se redução relevante quando o indicador passa a ser banda larga e, sobretudo, presença de rede local estruturada.

As escolas municipais registram os menores percentuais em todos os indicadores digitais, especialmente em banda larga (**63,25%**) e rede local (**61,93%**), evidenciando que o principal desafio não se limita ao acesso à internet, mas à qualidade e à estrutura da conectividade disponível.

Os dados indicam que a desigualdade digital manifesta-se de forma mais intensa nos indicadores de infraestrutura interna e qualidade de conexão, reforçando que o simples acesso à internet não garante condições adequadas para uso pedagógico da tecnologia.

### Evidência Visual (Power BI) - Consulta 4

![Conectividade por Dependência - Power BI](analises/img/04_conectividade_por_dependencia_powerbi.png)

O gráfico confirma os percentuais obtidos via SQL e evidencia que as diferenças entre as redes são mais acentuadas nos indicadores de qualidade da conectividade, banda larga e rede local, do que no acesso básico à internet, destacando maior vulnerabilidade na rede municipal.

--- 

## 5) Conectividade por Localização (Urbana x Rural)

### Evidência (resultado no DBeaver)
![Conectividade por Localização](analises/img/05_conectividade_por_localizacao.png)

### Interpretação

A análise evidencia desigualdade significativa entre escolas urbanas e rurais no que se refere à conectividade digital.

Nas áreas urbanas, **88,43%** das escolas possuem acesso à internet, enquanto nas áreas rurais esse percentual é de **54,91%**, configurando diferença superior a 30 pontos percentuais.

A disparidade torna-se ainda mais acentuada quando observados os indicadores de qualidade da conectividade. Apenas **41,51%** das escolas rurais possuem banda larga, frente a **80,08%** nas escolas urbanas. O mesmo padrão é verificado na presença de rede local estruturada, com **78,46%** nas áreas urbanas e **41,15%** nas rurais.

Observa-se também maior proporção de registros sem informação nas escolas rurais, especialmente nos indicadores de banda larga e rede local, o que reforça a fragilidade estrutural e possivelmente informacional nesse segmento.

Os resultados indicam que a desigualdade digital no contexto educacional brasileiro apresenta forte componente territorial, com vulnerabilidade mais intensa nas áreas rurais, sobretudo nos aspectos relacionados à qualidade e estrutura da infraestrutura tecnológica.


### Evidência Visual (Power BI) - Consulta 5

![Conectividade por Localização - Power BI](analises/img/05_conectividade_por_localizacao_powerbi.png)

O gráfico confirma a diferença estrutural entre escolas urbanas e rurais, evidenciando que a desigualdade é mais intensa nos indicadores de qualidade da conectividade, banda larga e rede local, do que no acesso básico à internet.

---

## 6) Infraestrutura Básica por Localização (Urbana x Rural)

### Evidência (resultado no DBeaver)
![Infraestrutura por Localização](analises/img/06_infraestrutura_por_localizacao.png)

### Interpretação

A análise evidencia desigualdade estrutural significativa entre escolas urbanas e rurais nos indicadores de infraestrutura básica.

Nas áreas urbanas, os percentuais de cobertura são elevados, superando **84%** no abastecimento de água por rede pública e aproximando-se de **90%** nos serviços de energia elétrica e coleta de lixo, indicando maior consolidação da infraestrutura essencial.

Nas áreas rurais, os percentuais são substancialmente inferiores, com destaque para o esgotamento sanitário, onde apenas **6,56%** das escolas possuem acesso à rede pública. A diferença superior a 60 pontos percentuais em relação às áreas urbanas evidencia um déficit sanitário crítico no meio rural.

As disparidades também se manifestam no abastecimento de água e nos demais serviços básicos, reforçando que as condições materiais mínimas de funcionamento escolar apresentam forte componente territorial.

Os resultados indicam que a vulnerabilidade estrutural das escolas rurais não se limita à conectividade digital, mas abrange serviços básicos essenciais, especialmente no que se refere ao saneamento.

### Evidência Visual (Power BI) - Consulta 6 

![Infraestrutura por Localização - Power BI](analises/img/06_infraestrutura_por_localizacao_powerbi.png)

O gráfico confirma a diferença estrutural entre escolas urbanas e rurais, evidenciando maior déficit nas áreas rurais, especialmente no acesso à rede pública de esgoto, que se configura como o principal gargalo de infraestrutura básica.

---

## 7) Impacto por Matrículas (Região)

### Evidência (resultado no DBeaver)
![Matrículas em escolas com internet e esgoto por região](analises/img/07_matriculas_com_internet_esgoto_por_regiao.png)

### Interpretação

Ao considerar o peso das matrículas, observa-se que a proporção de alunos matriculados em escolas com acesso à internet é elevada na maior parte das regiões, superando **97%** no Centro-Oeste, Sul, Sudeste e Nordeste. Mesmo na Região Norte, o percentual atinge **86,59%**, valor significativamente superior ao observado quando a análise considera apenas o número de escolas.

Esse resultado indica que as matrículas estão concentradas em unidades com acesso à internet, o que reduz parcialmente o impacto da desigualdade estrutural quando a métrica é ponderada pelo volume de estudantes atendidos.

Entretanto, o cenário difere substancialmente no indicador de esgotamento sanitário. A Região Norte apresenta apenas **24,62%** das matrículas em escolas com acesso à rede pública de esgoto, enquanto o Sudeste atinge **93,97%**. A diferença expressiva evidencia que, sob a perspectiva do aluno, a desigualdade estrutural permanece significativa, especialmente nas regiões com menor cobertura sanitária.

A análise ponderada por matrículas demonstra que a conectividade digital atinge maior parcela dos estudantes do que a infraestrutura sanitária, reforçando que o principal déficit estrutural, quando avaliado pelo impacto sobre alunos, permanece concentrado no esgotamento sanitário.


### Evidência Visual (Power BI) - Consulta 7 

![Impacto por Matrículas - Região - Power BI](analises/img/07_matriculas_internet_esgoto_por_regiao_powerbi.png)

O gráfico confirma que, quando ponderada por matrículas, a conectividade digital atinge a maior parte dos estudantes, enquanto o acesso à rede pública de esgoto permanece desigual entre as regiões, evidenciando maior impacto estrutural nas regiões com menor cobertura sanitária

---

## 8) Impacto por Matrículas (Dependência Administrativa)

### Evidência (resultado no DBeaver)
![Matrículas por Dependência](analises/img/08_matriculas_por_dependencia.png)

### Interpretação

Ao considerar o volume de matrículas, observa-se que o acesso à internet atinge patamar praticamente universal em todas as dependências administrativas, alcançando **100%** na rede federal, **99,60%** na rede privada e aproximadamente **97%** nas redes estadual e municipal.

Esse resultado indica que, sob a perspectiva do estudante, a conectividade digital apresenta cobertura amplamente consolidada, independentemente da dependência administrativa.

Entretanto, a análise do esgotamento sanitário revela disparidades estruturais mais expressivas. A rede municipal apresenta **60,85%** das matrículas em escolas com acesso à rede pública de esgoto, percentual inferior ao observado na rede estadual (**74,02%**) e significativamente abaixo da rede privada (**90,85%**).

Considerando que a rede municipal concentra o maior volume absoluto de matrículas, o déficit sanitário nessa dependência administrativa assume maior relevância social, ampliando o impacto estrutural sobre o conjunto de alunos atendidos.

A análise ponderada por matrículas demonstra que a desigualdade entre redes não se manifesta de forma significativa na conectividade digital, mas permanece relevante na infraestrutura sanitária.

### Evidência Visual (Power BI) - Consulta 8 

![Impacto por Matrículas - Dependência - Power BI](analises/img/08_matriculas_internet_esgoto_por_dependencia_powerbi.png)

A visualização confirma que a conectividade digital apresenta cobertura quase universal entre as dependências administrativas, enquanto o acesso à rede pública de esgoto permanece desigual, com maior impacto estrutural na rede municipal, que concentra o maior contingente de matrículas

---

## 9) Pressão de Infraestrutura: Matrículas por Sala (Região)

### Evidência (resultado no DBeaver)
![Matrículas por Sala por Região](analises/img/09_matriculas_por_sala_por_regiao.png)

### Interpretação

A análise da razão entre matrículas e salas utilizadas evidencia diferenças na pressão estrutural das unidades escolares entre as regiões brasileiras.

A Região Norte apresenta a maior média, com **33,49** matrículas por sala, enquanto a Região Sul registra o menor valor, com **25,65**. A diferença de aproximadamente oito alunos por sala indica variação relevante na densidade de ocupação dos espaços físicos escolares.

Os resultados sugerem maior concentração de estudantes por sala nas regiões Norte e Centro-Oeste, o que pode indicar maior pressão sobre a infraestrutura física das unidades escolares. Em contraste, a Região Sul apresenta menor densidade média, indicando condições potencialmente mais equilibradas quanto à ocupação dos espaços.

A análise demonstra que a desigualdade educacional não se manifesta apenas na disponibilidade de serviços e conectividade, mas também na capacidade física instalada das escolas, elemento fundamental para a qualidade do ambiente escolar

### Evidência Visual (Power BI) - Consulta 9 

![Matrículas por Sala por Região - Power BI](analises/img/09_matriculas_por_sala_por_regiao_powerbi.png)

A visualização evidencia diferenças na densidade média de alunos por sala entre as regiões, indicando maior pressão estrutural no Norte e menor no Sul, reforçando que a desigualdade educacional também se manifesta na capacidade física das unidades escolares.

---

## 10) Impacto Estrutural nas Escolas Rurais

### Evidência (resultado no DBeaver)
![Impacto estrutural nas escolas rurais](analises/img/10_matriculas_rurais_infraestrutura.png)

### Interpretação

A análise específica das escolas rurais evidencia um cenário de vulnerabilidade estrutural significativa.

Embora o universo analisado compreenda mais de cinco milhões de matrículas em áreas rurais, apenas 13,86% dos alunos estão matriculados em escolas com acesso à rede pública de esgoto. No caso do abastecimento de água via rede pública, o percentual atinge 48,28%.

Os dados indicam que a maioria dos estudantes da zona rural está inserida em unidades escolares sem cobertura adequada de serviços sanitários básicos, revelando um déficit estrutural que ultrapassa a dimensão tecnológica e alcança condições essenciais de salubridade e funcionamento escolar.

### Evidência Visual (Power BI) - Consulta 10

![Impacto estrutural nas escolas rurais - Power BI](analises/img/10_impacto_estrutural_escolas_rurais_powerbi.png)

A visualização consolida o recorte rural (TP_LOCALIZACAO = 2), evidenciando o baixo percentual de matrículas em escolas com rede pública de esgoto e a cobertura parcial de abastecimento de água.

---

## 11) Percentual de Escolas sem Rede Pública de Esgoto (Região)

### Evidência (resultado no DBeaver)
![Escolas sem esgoto por região](analises/img/11_escolas_sem_esgoto_por_regiao.png)

### Interpretação

A análise evidencia disparidade expressiva na cobertura de esgotamento sanitário entre as regiões brasileiras.

Na Região Norte, **86,45%** das escolas não possuem acesso à rede pública de esgoto, percentual significativamente superior ao observado no Sudeste, onde apenas **10,65%** das unidades encontram-se nessa condição.

O contraste regional demonstra forte concentração do déficit sanitário nas regiões Norte e Nordeste, reforçando a persistência de desigualdades estruturais na infraestrutura escolar brasileira.

A leitura do indicador sob a perspectiva da ausência do serviço torna ainda mais evidente a magnitude da carência sanitária em determinadas regiões do país.

> Observação: Os percentuais foram calculados considerando apenas escolas com informação válida (0 ou 1) para o indicador.

