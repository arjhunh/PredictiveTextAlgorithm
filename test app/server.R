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

shinyServer(function(input, output) {
  
  output$text1 <- renderText({ 
    print(colnames(bi)[1])
    })
})