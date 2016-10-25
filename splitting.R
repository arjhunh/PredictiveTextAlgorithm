## Twitter file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.twitter.txt","rb")
twitter=readLines(con)
totlength=length(twitter)
length=round(totlength/100,0)
finallength=totlength-(99*length)
tw=list()
close(con)
con = file("en_US.twitter.txt","rb")
for(i in 1:99)
{
  tw[[i]]=readLines(con,n=length)
}
tw[[100]]=readLines(con,finallength)
close(con)
setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/split")
for(i in 1:100)
{
  filename <- paste(formatC(i, width = 3, format = "d", flag = "0"),"tw",".txt",sep="")#leading zeros
  writeLines(tw[[i]],filename)
}

## Blogs file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.blogs.txt","rb")
twitter=readLines(con)
totlength=length(twitter)
length=round(totlength/100,0)
finallength=totlength-(99*length)
tw=list()
close(con)
con = file("en_US.blogs.txt","rb")
for(i in 1:99)
{
  tw[[i]]=readLines(con,n=length)
}
tw[[100]]=readLines(con,finallength)
close(con)
setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/split")
for(i in 1:100)
{
  filename <- paste(formatC(i, width = 3, format = "d", flag = "0"),"bl",".txt",sep="")#leading zeros
  writeLines(tw[[i]],filename)
}

## News file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.news.txt","rb")
twitter=readLines(con)
totlength=length(twitter)
length=round(totlength/100,0)
finallength=totlength-(99*length)
tw=list()
close(con)
con = file("en_US.news.txt","rb")
for(i in 1:99)
{
  tw[[i]]=readLines(con,n=length)
}
tw[[100]]=readLines(con,finallength)
close(con)
setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/split")
for(i in 1:100)
{
  filename <- paste(formatC(i, width = 3, format = "d", flag = "0"),"ne",".txt",sep="")#leading zeros
  writeLines(tw[[i]],filename)
}
