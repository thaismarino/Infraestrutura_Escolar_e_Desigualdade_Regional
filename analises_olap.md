# Análises OLAP

## 1) Conectividade por Região (IN_INTERNET)

### Evidência (resultado no DBeaver)
![Conectividade por Região](analises/img/01_conectividade_por_regiao.png)

### Interpretação

A análise evidencia disparidade regional no acesso à internet nas escolas brasileiras.

As regiões Centro-Oeste e Sul apresentam percentuais superiores a 90% de conectividade, enquanto a Região Norte apresenta aproximadamente 58,85%, configurando diferença superior a 30 pontos percentuais entre os extremos.

Essa diferença sugere desigualdade estrutural na infraestrutura tecnológica educacional, possivelmente associada a fatores geográficos, econômicos e de investimento público.

O resultado reforça a hipótese de que o acesso à conectividade escolar não ocorre de maneira homogênea no território nacional.

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

Os resultados sugerem que as desigualdades regionais na educação não se restringem à conectividade digital, mas também envolvem condições físicas e sanitárias essenciais ao funcionamento escolar.

## 3) Infraestrutura por Dependência Administrativa

### Evidência (resultado no DBeaver)
![Infraestrutura por Dependência](analises/img/03_infraestrutura_por_dependencia.png)

### Interpretação

A análise revela desigualdade significativa de infraestrutura conforme a dependência administrativa.

As escolas federais apresentam os maiores percentuais de cobertura em praticamente todos os indicadores, com destaque para energia elétrica (97,65%) e acesso à internet (97,79%), indicando infraestrutura amplamente consolidada.

As escolas privadas também apresentam desempenho elevado e consistente, especialmente no acesso à rede pública de esgoto (73,31%), superior às redes estadual e municipal.

As escolas estaduais apresentam desempenho intermediário, enquanto as escolas municipais, que concentram o maior número absoluto de unidades (128.999), registram os menores percentuais em todos os indicadores analisados, especialmente em esgotamento sanitário (36,87%) e abastecimento de água (57,67%).

Observa-se que o esgotamento sanitário permanece como o principal gargalo estrutural em todas as dependências administrativas.

Os resultados sugerem que a desigualdade de infraestrutura educacional não ocorre apenas entre regiões, mas também entre níveis de gestão e financiamento das escolas.
