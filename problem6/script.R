install.packages("SnowballC", dependencies = TRUE)
install.packages("tm", dependencies = TRUE)
install.packages("ggplot2", dependencies = TRUE)
install.packages("wordcloud", dependencies = TRUE)
install.packages("Rgraphviz", dependencies = TRUE)

library("tm")
library("SnowballC")
library("ggplot2")
library("wordcloud")

folder_path <- "/home/matheussampaio/git/analise-dados-1/problem6/news/petrobras/"

txt <- system.file(folder_path, "txt")

term_matrix = function (emp) {
  
  folder_path <- paste("/home/matheussampaio/git/analise-dados-1/problem6/news", emp, sep = "/" );
  
  a <- VCorpus(DirSource(folder_path, encoding = "UTF-8"), readerControl = list(language = "pt"));
  
  a <- tm_map(a, removeNumbers);
  a <- tm_map(a, removePunctuation);
  a <- tm_map(a, stripWhitespace);
  a <- tm_map(a, content_transformer(tolower));
  a <- tm_map(a, removeWords, stopwords("portuguese"));
  # a <- tm_map(a, stemDocument, lazy=TRUE, language = "portuguese");
  # a <- tm_map(a, stemCompletion, lazy=TRUE, language = "portuguese");
  # a <- tm_map(a, stemDocument, language = "english");
  
  adtm <- TermDocumentMatrix(a) ;
  adtm <- removeSparseTerms(adtm, 0.95);
  
  return(adtm);
}

(ovid <- term_matrix("petrobras"))

# inspect(ovid[5:10, 0:100])
ovid.matrix <- as.matrix(ovid)
wordFreq.sort <- sort(rowSums(ovid.matrix), decreasing = T)

set.seed(1234)

grayLevels <- gray( (wordFreq.sort + 10) / (max(wordFreq.sort) + 10))
word.cloud <- wordcloud(words=names(wordFreq.sort), freq=wordFreq.sort, min.freq=10, random.order=F, colors=grayLevels)
