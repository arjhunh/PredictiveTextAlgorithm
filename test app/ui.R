library(shiny)

shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
  ##  sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
        
   ##   textInput("input", 
  ##                label = "Range of interest:",
   ##               value="welcome")
   ##   ),
    
    mainPanel(
      textOutput("text1")
    )
  )
))