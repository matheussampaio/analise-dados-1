tab <- read.csv("~/git/analise-dados-1/problem3/dados-deputados - dados-deputados.csv")

hist(tab$gastos.total, labels=TRUE)
hist(tab$presencas.total, labels=TRUE)

summary(tab$gastos.total)

boxplot(tab$gastos.total)
boxplot(tab$presencas.total)
boxplot(tab$presencas.total, outline=FALSE)

qqnorm(tab$gastos.total); qqline(tab$gastos.total)
qqnorm(tab$presencas.total); qqline(tab$presencas.total)

