##Uni

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-unigram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"uniprob.csv")


##Bi

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-bigram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"biprob.csv")


##Tri

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-trigram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"triprob.csv")


##Quad

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-quadgram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"quadprob.csv")


##Pent

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-pentgram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"pentprob.csv")

##Hex

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM")
hexgram=read.csv("tdms-hexgram.csv",header=TRUE)
hexgram[,5]=hexgram[,2]+hexgram[,3]+hexgram[,4] ## count
hexgram[,6]=hexgram[,5]+1 ## add 1 for smoothening
hexgram[,7]=hexgram[,6]/sum(hexgram[1:nrow(hexgram),6]) ## probability
hexgram[,8]=log(hexgram[,7]) ## ln of probability

hexprob=as.matrix(hexgram[,8]) ## converting it to a matrix of 1 row
rownames(hexprob)=hexgram[,1] ## giving rownames as the text name
colnames(hexprob)="log prob" ##setting column name

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")
write.csv(hexprob,"hexprob.csv")
