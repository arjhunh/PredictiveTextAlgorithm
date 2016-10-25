## Loading libraries

library(tm) # Framework for text mining.
library(SnowballC) # Provides wordStem() for stemming.
library(qdap)# Quantitative discourse analysis of transcripts.
library(qdapDictionaries)
library(dplyr) # Data preparation and pipes %>%.
library(RColorBrewer) # Generate palette of colours for plots.library(ggplot2) # Plot word frequencies.
library(scales) # Include commas in numbers.
library(Rgraphviz) # Correlation plots.
library(RWeka)

##Loading corpus and files

cname <- file.path("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project", "Dataset", "split processed")
length(dir(cname))
dir(cname)

docs <- Corpus(DirSource(cname))
docs

class(docs)
summary(docs)

## Term matrix

##dtm <- TermDocumentTermMatrix(docs)
##dtm

##tdmsingle = DocumentTermMatrix(docs)

## Bigram tokenization

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3, delimiters = " \\r\\n\\t.,;:\"()?!"))
tdm3 <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))

inspect(tdm[340:345,1:3])

# Sets the default number of threads to use
##options(mc.cores=1)
##BigramTokenizer <- function(x) {RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 2, max = 2))}

## Exploring the matrix

freq <- rowSums(as.matrix(tdm))
length(freq)

ord <- order(freq)

# Least frequent terms
freq[head(ord)]

# Most frequent terms
freq[tail(ord)]

# Frequency of frequencies.
head(table(freq), 15)

tail(table(freq), 15)


## Remove sparse terms

tdms3 <- removeSparseTerms(tdm3, 0.5)
dim(tdms3)
inspect(tdms)
freq <- rowSums(as.matrix(tdms))
freq
table(freq)

## Storing the matrix as CSV
setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM Split")
ms <- as.matrix(tdms3)
##m <- as.matrix(tdm)
dim(m)
##write.csv(m, file="tdm-1.csv")
write.csv(ms, file="tdms-trigram.csv")
## Identifying freq and associations

findFreqTerms(tdms, lowfreq=1000)
findFreqTerms(tdms, lowfreq=100)

##findAssocs(tdms, "happy", corlimit=0.95)


## Correlation plot

plot(tdms,
     terms=findFreqTerms(tdms, lowfreq=100)[1:10],
     corThreshold=0.5)

## plotting word frequencies

freq <- sort(rowSums(as.matrix(tdms)), decreasing=TRUE)
head(freq, 14)
wf <- data.frame(word=names(freq), freq=freq)
head(wf)

library(ggplot2)
subset(wf, freq>5000) %>%
  ggplot(aes(word, freq)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1))

## Wordclouds

library(wordcloud)
wordcloud(names(freq), freq, min.freq=500, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))

#?plot.TermDocumentMatrix
