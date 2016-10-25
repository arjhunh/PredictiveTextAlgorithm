##sampling 5% from twitter file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.twitter.txt","rb")
a=rbinom(7867,1,0.5) ## 2360100/30/20. need this amount of 1s, so generating that by putting that value * 2, with a probability of 0.5
twitter=list()
j=1
for(i in 1:length(a))
{
  if(a[i]==1)
  {
  ##  temp = readLines(con, n=30)
   ## Encoding(temp)="UTF-8"
  ##  temp2=iconv(temp, "UTF-8", "UTF-8",sub='')
  ##  twitter[[j]] = temp2
    twitter[[j]]=readLines(con, n=30)
##    Encoding(twitter[[j]])="UTF-8"
##    twitter[[j]]=iconv(twitter[[j]], "UTF-8", "UTF-8",sub='')
    j=j+1
  }
}
close(con)
lapply(twitter, write, "twitter.txt", append=TRUE)

##sampling 5% from blog file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.blogs.txt","rb")
a=rbinom(2998,1,0.5) ## 899400/30/20
blog=list()
j=1
for(i in 1:length(a))
{
  if(a[i]==1)
  {
    ##temp = readLines(con, n=30)
    ##Encoding(temp)="UTF-8"
    ##temp2=iconv(temp, "UTF-8", "UTF-8",sub='')
    ##blog[[j]] = temp2
    blog[[j]]=readLines(con, n=30)
  ##  Encoding(blog[[j]])="UTF-8"
  ##  blog[[j]]=iconv(blog[[j]], "UTF-8", "UTF-8",sub='')
    j=j+1
  }
}
close(con)
lapply(blog, write, "blog.txt", append=TRUE)

##sampling 10% from news file

setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/Dataset/final/en_US")
con = file("en_US.news.txt","rb")
a=rbinom(516,1,0.5) ##77400/30/10
news=list()
j=1
for(i in 1:length(a))
{
  if(a[i]==1)
  {
    ##temp = readLines(con, n=30)
    ##Encoding(temp)="UTF-8"
    ##temp2=iconv(temp, "UTF-8", "UTF-8",sub='')
    ##news[[j]] = temp2
    news[[j]]=readLines(con, n=30)
   ## Encoding(news[[j]])="UTF-8"
  ##  news[[j]]=iconv(news[[j]], "UTF-8", "UTF-8",sub='')
    j=j+1
  }
}
close(con)
lapply(news, write, "news.txt", append=TRUE)