library("moments")

dados <- read.table("~/git/analise-dados-1/problem4/velocidade-isp.txt", header=T, quote="\"")

dados.rj.gzt <- dados[dados$estado=="RJ",]
dados.sp.gzt <- dados[dados$estado=="SP",]

plodados.pb <- dados[dados$estado=="PB",]
dados.pb.gzt <- dados.pb[dados.pb$provedor=="GZT",]
dados.pb.ola <- dados.pb[dados.pb$provedor=="Ola",]

hist_norm = function(x, title) {
  hist(x, plot=T, xlab = "", main=title, labels=T)
  
  # plotar a distribuicao da normal no histograma
  media = mean(x)
  desvio.padrao = sd(x);
  par(new=T)
  plot(function(x) dnorm(x, mean=media,sd=desvio.padrao), summary(x)[1], summary(x)[6], main = "", xlab="", axes = F, ylab="");
}

# Sumario
summary(dados.pb$velocidade)

# Boxplot
boxplot(dados.pb$velocidade)

# histograma distribuicao de velocidade da paraiba
hist(dados.pb$velocidade, plot=T, xlab = "", main="Distribuicao Velocidade - Paraiba", labels=T)

# histograma com distribuicao normal
hist_norm(dados.pb$velocidade, "Distribuicao Velocidade - Paraiba")

# qqnorm
qqnorm(dados.pb$velocidade, main="Normal Q-Q Plot Paraiba"); qqline(dados.pb$velocidade)

shapiro.test(dados.pb.ola$velocidade)

shapiro.test(dados.pb.gzt$velocidade)

# Skewness
skewness(dados.pb$velocidade)

# Kurtosis
kurtosis(dados.pb$velocidade)

# Verificar se a media de velocidade da GZT ?? maior que 50Mbps
t.test(dados.pb.gzt$velocidade, alternative="less", mu = 50)

# Verificar se a media de velocidade da Ola ?? maior que 50Mbps
t.test(dados.pb.ola$velocidade, alternative="less", mu = 50)


# RIO DE JANEIRO

dados.rj.gzt <- dados[dados$estado=="RJ",]

# histograma com distribuicao normal
hist_norm(dados.rj.gzt$velocidade, "Distribuicao Velocidade - Rio de Janeiro")

# qqnorm
qqnorm(dados.rj.gzt$velocidade, main="Normal Q-Q Plot Rio de Janeiro"); qqline(dados.rj.gzt$velocidade)

shapiro.test(dados.rj.gzt$velocidade)

# SAO PAULO

dados.sp.gzt <- dados[dados$estado=="SP",]

# histograma com distribuicao normal
hist_norm(dados.sp.gzt$velocidade, "Distribuicao Velocidade - Sao Paulo")

# qqnorm
qqnorm(dados.sp.gzt$velocidade, main="Normal Q-Q Plot Sao Paulo"); qqline(dados.sp.gzt$velocidade)

shapiro.test(dados.sp.gzt$velocidade)

provedores = data.frame(dados.pb.gzt$velocidade, dados.rj.gzt$velocidade, dados.sp.gzt$velocidade)

#teste ANOVA
oneway.test(values ~ ind, data=stack(stack(provedores)), var.equal=T)
print(sprintf("Valor de F: %f", qf(.95, 2, 27)))
