inst
dados <- read.table("~/git/analise-dados-1/problem4/velocidade-isp.txt", header=T, quote="\"")

dados.rj.gzt <- dados[dados$estado=="RJ",]
dados.sp.gzt <- dados[dados$estado=="SP",]

plodados.pb <- dados[dados$estado=="PB",]
dados.pb.gzt <- dados.pb[dados.pb$provedor=="GZT",]
dados.pb.ola <- dados.pb[dados.pb$provedor=="Ola",]

hist_norm = function(x, title) {
  hist(x, plot=T, xlab = "", main=title, labels=T)
  
  # plotar a distribui????o da normal no histograma
  media = mean(x)
  desvio.padrao = sd(x);
  par(new=T)
  plot(function(x) dnorm(x, mean=media,sd=desvio.padrao), summary(x)[1], summary(x)[6], main = "", xlab="", axes = F, ylab="");
}

# Sumario
summary(dados.pb$velocidade)

# Boxplot

boxplot(dados.pb$velocidade)

# histograma distribui??ao de velocidade da paraiba
hist(dados.pb$velocidade, plot=T, xlab = "", main="Distribui????o Velocidade - Paraiba", labels=T)

# histograma com distribui????o normal
hist_norm(dados.pb$velocidade, "Distribui????o Velocidade - Paraiba")

?ku# qqnorm
qqnorm(dados.pb$velocidade); qqline(dados.pb$velocidade)

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
