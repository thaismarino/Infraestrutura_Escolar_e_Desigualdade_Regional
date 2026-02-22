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
