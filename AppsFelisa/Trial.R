library(shiny)

ui <- fluidPage(
  headerPanel("Example eventReactive"),
  
  mainPanel(
    
    # input field
    textInput("user_text", label = "Enter some text:", placeholder = "Please enter some text."),
    
    # submit button
    actionButton("submit", label = "Submit"),
    
    # display text output
    textOutput("text"))
)

server <- function(input, output) {
  
  # reactive expression
  text_reactive <- eventReactive( input$submit, {
    input$user_text
  })
  
  # text output
  output$text <- renderText({
    text_reactive()
  })
}

shinyApp(ui = ui, server = server)