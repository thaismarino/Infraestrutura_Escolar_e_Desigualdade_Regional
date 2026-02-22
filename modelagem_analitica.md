# Modelagem Analítica – Etapa OLAP

## Granularidade

A base `microdados_ed_basica` possui granularidade ao nível de escola.

Cada registro representa uma escola da Educação Básica no Censo Escolar 2024.

---

## Dimensões Analíticas

### Dimensão Geográfica
- Região  
- Unidade da Federação  
- Município  

### Dimensão Administrativa
- Dependência administrativa da escola  

### Dimensão de Localização
- Classificação da escola (urbana ou rural)  

### Dimensão de Infraestrutura
- Indicadores de infraestrutura física  
- Indicadores de conectividade  
- Indicadores de acessibilidade  

---

## Métricas Principais

- Quantidade de matrículas  
- Quantidade de salas de aula  
- Percentual de escolas com infraestrutura disponível  
- Percentual de escolas com conectividade  
- Indicadores ponderados por matrícula  
- Razão entre matrículas e salas (pressão estrutural)
