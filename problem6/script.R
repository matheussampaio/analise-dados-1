library("tm")

folder_path <- "/home/matheussampaio/git/analise-dados-1/problem6/news/petrobras/"

txt <- system.file(folder_path, "txt")

term_matrix = function (emp) {
  folder_path <- paste("/home/matheussampaio/git/analise-dados-1/problem6/news", emp, sep = "/" );
  
  a <- VCorpus(DirSource(folder_path, encoding = "UTF-8"), readerControl = list(language = "pt"));
  
  a <- tm_map(a, removeNumbers);
  a <- tm_map(a, removePunctuation);
  a <- tm_map(a, stripWhitespace);
  a <- tm_map(a, content_transformer(tolower));
  a <- tm_map(a, removeWords, stopwords("english"));
  # a <- tm_map(a, stemDocument, language = "english");
  
  adtm <- DocumentTermMatrix(a) ;
  adtm <- removeSparseTerms(adtm, 0.95);
  
  return(adtm);
}

(ovid <- term_matrix("petrobras"))

inspect(ovid[5:10, 0:4])

