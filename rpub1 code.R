library(tm) # Framework for text mining.
library(qdap)# Quantitative discourse analysis of transcripts.
library(qdapDictionaries)
library(dplyr) # Data preparation and pipes %>%.
library(RColorBrewer) # Generate palette of colours for plots.library(ggplot2) # Plot word frequencies.
library(scales) # Include commas in numbers.
library(Rgraphviz) # Correlation plots.
library(RWeka) ## N Grams
library(wordcloud) ## wordcloud
library(ggplot2)

##Uni gram

cname <- file.path("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project", "Dataset", "Processed")
docs <- Corpus(DirSource(cname))
tdm1 = TermDocumentMatrix(docs)
tdms1 <- removeSparseTerms(tdm1, 0.1)

freq1 <- sort(rowSums(as.matrix(tdms1)), decreasing=TRUE)
wf1 <- data.frame(word=names(freq1), freq=freq1)
subset(wf1, freq>1000) %>%
  ggplot(aes(word, freq)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1))

wordcloud(names(freq1), freq1, min.freq=10, scale=c(5, 1), colors=brewer.pal(6, "Dark2"))

plot(tdms1,terms=findFreqTerms(tdms1, lowfreq=1000)[1:10],corThreshold=0.9)

## BI gram

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2, delimiters = " \\r\\n\\t.,;:\"()?!"))
tdm2 <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))
tdms2 <- removeSparseTerms(tdm2, 0.1)

freq2 <- sort(rowSums(as.matrix(tdms2)), decreasing=TRUE)
wf2 <- data.frame(word=names(freq2), freq=freq2)
subset(wf2, freq>3000) %>%
  ggplot(aes(word, freq)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1))

wordcloud(names(freq2), freq2, min.freq=1000, scale=c(3, 0.5), colors=brewer.pal(6, "Dark2"))

plot(tdms2,terms=findFreqTerms(tdms2, lowfreq=1000)[1:10],corThreshold=0.9)

## Tri gram

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3, delimiters = " \\r\\n\\t.,;:\"()?!"))
tdm3 <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))
tdms3 <- removeSparseTerms(tdm3, 0.1)

freq3 <- sort(rowSums(as.matrix(tdms3)), decreasing=TRUE)
wf3 <- data.frame(word=names(freq3), freq=freq3)
subset(wf3, freq>400) %>%
  ggplot(aes(word, freq)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1))

wordcloud(names(freq3), freq3, min.freq=250, scale=c(2, 0.5), colors=brewer.pal(6, "Dark2"))

plot(tdms3,terms=findFreqTerms(tdms3, lowfreq=250)[1:10],corThreshold=0.9)



##FIrst

cname1 <- file.path("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset", "Final", "en_US")
##length(dir(cname1))
dir(cname1)

docs1 <- Corpus(DirSource(cname1))
docs1
class(docs1)

char1=sum(nchar(docs1[[1]]))
char2=sum(nchar(docs1[[2]]))
char3=sum(nchar(docs1[[3]]))
word1=length(unlist(strsplit(docs1[[1]]," ")))
word2=length(unlist(strsplit(docs1[[2]]," ")))
word3=length(unlist(strsplit(docs1[[3]]," ")))



cat("Summary of the blogs.txt file: \n")
cat("\n\t Number of lines in the file: ", length(docs1[[1]]))
cat("\n\tNumber of characters in the file: ",char1)
cat("\n\tNumber of words in the file: ",word1)

cat("\n\nSummary of the news.txt file: \n")
cat("\n\tNumber of lines in the file: ", length(docs1[[2]]))
cat("\n\tNumber of characters in the file: ",char2)
cat("\n\tNumber of words in the file: ",word2)

cat("\n\nSummary of the twitter.txt file: \n")
cat("\n\t Number of lines in the file: ", length(docs1[[3]]))
cat("\n\tNumber of characters in the file: ",char3)
cat("\n\tNumber of words in the file: ",word3)


