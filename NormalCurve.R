  library(shiny)  


ui <- fluidPage(
                fluidRow(
                  column(8, offset =6, tags$h1("Adriana F Chavez - Lab25"))),
                tags$img(height=100, 
                         width=100,
                         src = "http://www.thinkgeek.com/images/products/additional/large/jgpo_poke_ball_serving_bowl_set_closed.jpg"),
                tags$h3("Learning R Shiny"),
                tags$p( "This is my very", tags$strong("FIRST"),"Shiny app"),
                tags$a(href = "https://adrifelcha.github.io/", "My Github Page"),
                tags$hr(),
                actionButton(inputId="click", label ="Click me!"),
                wellPanel(textInput(inputId = "titulo",
                          label = "Titulo", 
                          value = "Histograma"),
                textInput(inputId = "evidence",
                          label = "Datos", 
                          value = "Variable"),
                sliderInput(inputId="num", 
                            label = "Choose a number",
                            value=25, min=1, max=100),
                actionButton(inputId="go", label ="Update Graph")),
                fluidRow(
                  column(6, offset = 3, plotOutput(outputId="hist"))),
                fluidRow(
                  column(6, offset = 3, verbatimTextOutput("stats"))))

server <- function(input, output) {
  data <- eventReactive(input$go, {rnorm(input$num)})
  output$hist <- renderPlot({hist(data(), xlab=input$evidence, 
                                  ylab='Slider', main=input$titulo)})
  output$stats <- renderPrint({summary(data())})
  observeEvent(input$click, {print(as.numeric(input$click))})
}

shinyApp(ui = ui, server = server)