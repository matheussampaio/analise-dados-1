# Problema 1
## Imersão no R

Entendendo expertise, localização e salários de profissionais de TI no Brasil ([exercício-problema](https://docs.google.com/document/d/1XzjvS4aHRTR-4OdFqwhrJZ1E43p9tPvscbfdzUP5dz4/edit?usp=sharing), [dados](https://sites.google.com/a/computacao.ufcg.edu.br/analise-de-dados-1/problema/salarios-ti-regioes.csv?attredirects=0&d=1), gabarito)

OBS: veja na aba [RECURSOS](https://sites.google.com/a/computacao.ufcg.edu.br/analise-de-dados-1/recursos) dicas para aprender R.

# Iniciando a brincadeira com R

Alguns objetivos deste exercício problema:
* Usar comandos básicos do R;
* Praticar os comandos que servem para ler e escrever uma tabela de dados no R;
* Criar o hábito de conhecer os dados que tem em mãos para análise e de entender os tipos de dados;
* Criar o hábito de pensar em perguntas interessantes que podem ser investigadas com os dados que tem em mãos, ie. ter a prática de planejar a análise dos dados para extrair valor deles;
* Despertar para diferenças entre média/mediana e o conceito de outliers;
* Praticar comandos básicos como mean, median, summary, sort, max;
* Praticar comandos mais avançados que permitam trabalhar com dados em formato de tabelas (data frames), agrupar dados por um atributo específico e sumarizar resultados com base em um atributo específico.

Antes de começar precisa entender um pouco de R:

1. Instale R em sua máquina;
2. Leia dicas básicas [aqui](https://www.google.com/url?q=https%3A%2F%2Fsites.google.com%2Fa%2Fcomputacao.ufcg.edu.br%2Fanalise-de-dados-1%2Fproblema%2Fr-tutor0.pdf%3Fattredirects%3D0%26d%3D1&sa=D&sntz=1&usg=AFQjCNFkV99mrTNSn_leSOShz3Zy-HyLMQ).

**Dados: salários de profissionais de TI**

Estamos tentando entender um pouco a distribuição dos salários pagos a profissionais de TI (tecnologia da informação). Algumas informações foram coletadas sobre esses profissionais e estão aqui. Dica para passar esses dados para o R em formato de tabela: use read.csv.

Use essas informações para gerar um relatório de análise que responde as seguintes questões:

1. Qual o panorama geral dos profissionais de TI no Brasil sem ainda se preocupar com seus salários, apenas com sua localização, função, expertise...?

  - *Dica 1: Quando temos um conjunto de dados para analisar é muito importante ter ciência de todos os campos de informação que temos disponíveis. Com o comando head, por exemplo, você consegue ter uma visão geral do cabeçalho do seu conjunto de dados e dos tipos de dados que estão envolvidos. Ao ter conhecimento do seu conjunto de dados e de que tipo de informação cada campo traz, fica mais fácil ter boas ideias para analisar.*
  - *Faça o exercício de fazer perguntas aos dados!*
  - *O comando table pode ajudar nessa tarefa.*



2. Os salários estão bem distribuídos no intervalo que vai do menor salário para o maior salário? Ou será que os salários são muito concentrados em um intervalo pequeno de valores? Será que existem salários atípicos (outliers)?
  - *Dica 1: summary e boxplot.*

3. É interessante ver a média (mean) salarial para cada região. Como resultado, apresente uma tabela com o nome da região e a sua média salarial ordenada da região com a maior média salarial para a menor. Se você tivesse usado a mediana (median) em vez da média como métrica de interesse, o resultado seria o mesmo? Analise a situação e justifique. Aproveite e salve esta tabela em um arquivo do tipo csv.
  - *Dica: use tapply, write.csv e sort.*

4. Se um profissional de TI deseja ter um salario melhor, qual a dica para ele?
  - *Dica: Use sua criatividade para brincar com os dados e descobrir informações relevantes/interessantes.*
