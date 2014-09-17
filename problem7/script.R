# install.packages("tm", dependencies = TRUE)

library("tm")

handler_news = function (news) {
  news <- iconv(news, to = "ASCII//TRANSLIT");
  
  news <- tolower(news);
  news <- removeNumbers(news);
  news <- removePunctuation(news);
  
  news <- removeWords(news, stopwords("portuguese"));
  news <- stripWhitespace(news);
  
  news <- stemDocument(news, language = "portuguese");
  
  return (news)
}

dados.news <- read.csv("~/git/analise-dados-1/problem7/trainingtest.csv", sep=";", stringsAsFactors = FALSE);

for (i in 1:nrow(dados.news)) {
  dados.news$titulo[i] = handler_news(dados.news$titulo[i]);
  dados.news$texto[i] = handler_news(dados.news$texto[i]);
}

write.table(dados.news, file = "~/git/analise-dados-1/problem7/training.csv", quote = FALSE, sep = ";")
