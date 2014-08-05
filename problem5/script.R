
# ==================================== Questão 1 ======================================

# Importanto os Dados
dados.comerciais <- read.csv("~/git/analise-dados-1/problem5/dados-comerciais.csv")

modelo1 <- lm(formula=teste ~ duracao, data = dados.comerciais)
summary(modelo1)


hist(dados.comerciais$duracao, plot = T, labels = T, main = "Histograma", col = "lightblue")

# qqnorm
qqnorm(dados.comerciais$duracao, main="Normal Q-Q Plot Duracao"); qqline(dados$duracao)

cor.test(dados$duracao, dados$teste, method="kendall")

# ==================================== Questão 2 ======================================

dados.credito <- read.csv("~/git/analise-dados-1/problem5/dados-credito.csv")

modelo2 <- lm(formula=num.cards ~ family.size + income + num.cars, data = dados.credito)
summary(modelo2)

confint(modelo2)