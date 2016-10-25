library(shiny)

uni=read.csv("data/uniprob.csv",header=TRUE)
bi=read.csv("data/biprob.csv",header=TRUE)
tri=read.csv("data/triprob.csv",header=TRUE)
quad=read.csv("data/quadprob.csv",header=TRUE)
pent=read.csv("data/pentprob.csv",header=TRUE)
hex=read.csv("data/hexprob.csv",header=TRUE)
uni[,1]=as.character(uni[,1])
bi[,1]=as.character(bi[,1])
tri[,1]=as.character(tri[,1])
quad[,1]=as.character(quad[,1])
pent[,1]=as.character(pent[,1])
hex[,1]=as.character(hex[,1])
word = "Enter a sentence or a phrase"
processing = function(input)
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
  
  input
}

runalgo = function(input)
{
  input=processing(input)
  nwords=sapply(strsplit(input, "\\s+"), length)
  if(nwords>5)
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
    q=grep(e,hex$X)
    if(length(q)!=0)
    {
      sub=hex[q,]
      sub=sub[with(sub, order(-sub[,2])),]
      tempsub=unlist(strsplit(sub[1,1]," "))
      word= tempsub[nwords+1]
    }
    if(length(q)==0)
    {
      input=gsub("^.*? ","",input)
      nwords=sapply(strsplit(input, "\\s+"), length)
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
      word= tempsub[nwords+1]
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
      word= tempsub[nwords+1]
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
      word= tempsub[nwords+1]
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
      word= tempsub[nwords+1]
    }
    if(length(q)==0)
    {
      word="the"
    } 
  }
  word
  
}

shinyServer(
  function(input, output) {
    output$word <- renderText({
      
      runalgo(input$input)})
  }
)