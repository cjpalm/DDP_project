shinyUI(
  pageWithSidebar(
    headerPanel("Predict your Iris type"),
    sidebarPanel(
      sliderInput('Sepal.Length', 'Length of Sepal',value = 6, min = 4.3, max = 7.9, step = 0.05,),
      sliderInput('Sepal.Width', 'Width of Sepal',value = 3, min = 2, max = 4.4, step = 0.05,),
      sliderInput('Petal.Length', 'Length of Petal',value = 4, min = 1, max = 6.9, step = 0.05,),
      sliderInput('Petal.Width', 'Width of Petal',value = 1.5, min = 0.1, max = 2.5, step = 0.05,),
      #  submitButton('Submit')
      includeMarkdown("instructions.md")
    ),
    mainPanel(
      h4(textOutput("Sepal.Length")),
      h4(textOutput("Sepal.Width")),
      h4(textOutput("Petal.Length")), 
      #verbatimTextOutput("Petal.Length"),
      h4(textOutput("Petal.Width")),
      h2(textOutput("Species")),
      imageOutput("image1")
      
    )
  )
)
