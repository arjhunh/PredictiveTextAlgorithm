setwd("E:/Dropbox/Courses/DATA SCIENCE TRACK/10. Capstone Project/TDM/prob mat")

uni=read.csv("uniprob.csv",header=TRUE)
bi=read.csv("biprob.csv",header=TRUE)
tri=read.csv("triprob.csv",header=TRUE)
quad=read.csv("quadprob.csv",header=TRUE)
pent=read.csv("pentprob.csv",header=TRUE)
hex=read.csv("hexprob.csv",header=TRUE)
uni[,1]=as.character(uni[,1])
bi[,1]=as.character(bi[,1])
tri[,1]=as.character(tri[,1])
quad[,1]=as.character(quad[,1])
pent[,1]=as.character(pent[,1])
hex[,1]=as.character(hex[,1])


readcharacter <- function() #getting input from the user
{ 
  n <- readline(prompt="Enter text: ")
  return(as.character(n))
}

processing = function(input) #processing the input text
{
  input=tolower(input)
  input=gsub("~","",input)
  input=gsub("`","",input)
  input=gsub("!","",input)
  input=gsub("@","",input)
  input=gsub("#","",input)
  input=gsub("\\$","",input)
  input=gsub("\\%","",input)
  input=gsub("^","",input)
  input=gsub("\\&","",input)
  input=gsub("*","",input)
  input=gsub("\\(","",input)
  input=gsub("\\)","",input)
  input=gsub("-","",input)
  input=gsub("_","",input)
  input=gsub("=","",input)
  input=gsub("+","",input)
  input=gsub("\\|","",input)
  input=gsub("\\]","",input)
  input=gsub("\\}","",input)
  input=gsub("\\[","",input)
  input=gsub("\\{","",input)
  input=gsub("\\' ","",input)
  input=gsub(" \\'","",input)
  input=gsub('"',"",input)
  input=gsub(";","",input)
  input=gsub(":","",input)
  input=gsub("?","",input)
  input=gsub("/","",input)
  input=gsub("\\.","",input)
  input=gsub(">","",input)
  input=gsub(",","",input)
  input=gsub("<","",input)
  
  input=gsub("^\\'+|\\'+$", "", input)
  input=gsub('^\\"+|\\"+$', "", input)
  
}

runalgo = function(input)
{
 ## input=processing(input)
  nwords=sapply(strsplit(input, "\\s+"), length)  #calculate the number of words of the input
  if(nwords>5)                                    # if number of words is more than 5, remove the first n words to bring the final word count to 5
  {
    split <- strsplit(input, " ")[[1]]
    nwordstemp=length(split)
    start=nwordstemp-4
    splitreq=split[start:nwordstemp]
    input=paste(splitreq, collapse = ' ')
    nwords=5
  }
  if(nwords==5)                                 
  {
    e=paste0(input," ([A-Za-z]|[0-9])")
    q=grep(e,hex$X)          # if number of words is 5, search for the input in the hexprob matrix ans store the row numbers in q
    if(length(q)!=0)         # if q has elements,
    {
      sub=hex[q,]            #sub has the matrix of akk the matches and their probabilities
      sub=sub[with(sub, order(-sub[,2])),]          # oder sub in descending order by probability
      tempsub=unlist(strsplit(sub[1,1]," "))        # take the top most elemt (which has least probaility) and split it into words and save it in tempsub
      print(tempsub[nwords+1])                      # display the last word of tempsub. His is the output.
    }
    if(length(q)==0)                                 # if q has no elements, 
    {
      input=gsub("^.*? ","",input)                   # then remove the first word from the input
      nwords=sapply(strsplit(input, "\\s+"), length) #update the number of words and carry on.
    } 
  }
  
  if(nwords==4)
  {
    e=paste0(input," ([A-Za-z]|[0-9])")
    q=grep(e,pent$X)
    if(length(q)!=0)
    {
      sub=pent[q,]
      sub=sub[with(sub, order(-sub[,2])),]
      tempsub=unlist(strsplit(sub[1,1]," "))
      print(tempsub[nwords+1])
     ## print(sub('^.* ([[:alnum:]]+)$', '\\1', sub[1:5,1]))
    }
    if(length(q)==0)
    {
      input=gsub("^.*? ","",input)
      nwords=sapply(strsplit(input, "\\s+"), length)
    } 
  }
  
  if(nwords==3)
  {
    e=paste0(input," ([A-Za-z]|[0-9])")
    q=grep(e,quad$X)
    if(length(q)!=0)
    {
      sub=quad[q,]
      sub=sub[with(sub, order(-sub[,2])),]
      tempsub=unlist(strsplit(sub[1,1]," "))
      print(tempsub[nwords+1])
      ##print(sub('^.* ([[:alnum:]]+)$', '\\1', sub[1:5,1]))
    }
    if(length(q)==0)
    {
      input=gsub("^.*? ","",input)
      nwords=sapply(strsplit(input, "\\s+"), length)
    } 
  }
  
  if(nwords==2)
  {
    e=paste0(input," ([A-Za-z]|[0-9])")
    q=grep(e,tri$X)
    if(length(q)!=0)
    {
      sub=tri[q,]
      sub=sub[with(sub, order(-sub[,2])),]
      tempsub=unlist(strsplit(sub[1,1]," "))
      print(tempsub[nwords+1])
      ##print(sub('^.* ([[:alnum:]]+)$', '\\1', sub[1:5,1]))
    }
    if(length(q)==0)
    {
      input=gsub("^.*? ","",input)
      nwords=sapply(strsplit(input, "\\s+"), length)
    } 
  }
  if(nwords==1)
  {
    e=paste0(input," ([A-Za-z]|[0-9])")
    q=grep(e,bi$X)
    if(length(q)!=0)
    {
      sub=bi[q,]
      sub=sub[with(sub, order(-sub[,2])),]
      tempsub=unlist(strsplit(sub[1,1]," "))
      print(tempsub[nwords+1])
    ##  print(sub('^.* ([[:alnum:]]+)$', '\\1', sub[1:5,1]))
    }
    if(length(q)==0)
    {
     ## input=gsub("^.*? ","",input)
    ##  nwords=sapply(strsplit(input, "\\s+"), length)
      print("the")
    } 
  }
}

input=readcharacter()
input=processing(input)
runalgo(input)
