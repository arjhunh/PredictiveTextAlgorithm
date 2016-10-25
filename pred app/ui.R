library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Prediction of the next word"), ## Heading
    sidebarPanel(
      textInput('input', 'Please enter a sentence or a phrase') , ##Inputting text
      submitButton('Submit') ##Submit butotn
    ),
    mainPanel(
      ##Introduction text
      h4('By Arjhun Hariharan - 07/12/2014'),
      h4('This app predicts the word next to the sentence or a phrase given as the input at the left. After entering, please click the \'Submit\' button. The next predicted word will be displayed below.'),
      p(em("To know more, ",a("click here",href="http://rpubs.com/arjhunh/46934"))),
      h4('Prediction : '),strong(verbatimTextOutput("word"))
    )
  )
)
