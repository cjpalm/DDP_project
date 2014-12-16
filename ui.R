shinyUI(
  pageWithSidebar(
    headerPanel("Predict your Iris type"),
    sidebarPanel(
      sliderInput('Sepal.Length', 'Length of Sepal',value = 6, min = 4.3, max = 7.9, step = 0.05,),
      sliderInput('Sepal.Width', 'Width of Sepal',value = 3, min = 2, max = 4.4, step = 0.05,),
      sliderInput('Petal.Length', 'Length of Petal',value = 4, min = 1, max = 6.9, step = 0.05,),
      sliderInput('Petal.Width', 'Width of Petal',value = 1.5, min = 0.1, max = 2.5, step = 0.05,)
    #  submitButton('Submit')
    ),
    mainPanel(
      h4('Sepal Length:'),
      verbatimTextOutput("Sepal.Length"),
      h4('Sepal Width:'),
      verbatimTextOutput("Sepal.Width"),
      h4('Petal Length:',textOutput("Petal.Length")), 
      #verbatimTextOutput("Petal.Length"),
      h4('Petal Width:'),
      textOutput("Petal.Width"),
      h3('Predicted Species:'),
      verbatimTextOutput("Species"),
      imageOutput("image1")
      
    )
  )
)
