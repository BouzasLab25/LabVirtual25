  library(shiny)  


ui <- fluidPage(
  fluidRow(HTML('<h1 style="text-align:center;"><b>Distribución  Normal</b></h1>'),
           HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')), 
  
  fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')),
  
  fluidRow(column(width=5, offset = 0.6, background = 'yellow',
                  HTML('<h1 style="text-align:center; color:green;">Definición</h1>'),
                  HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                  tags$p("También llamada Curva Normal o Campana de Gauss, una distribución de probabilidad Normal esta definida por los siguientes parámetros:"),
                  tags$br(),
                  wellPanel(sliderInput(inputId="mean", 
                    label = "Media",
                    value=25, min=-100, max=100),
                    sliderInput(inputId="dev", 
                    label = "Desviación Estándar",
                    value=25, min=1, max=100),
                  actionButton(inputId="go", label ="Update Graph"))),
            column(width=5, offset = 6, plotOutput(outputId="hist"), verbatimTextOutput("stats"))))

server <- function(input, output) {
  data <- eventReactive(input$go, {rnorm(input$num)})
  output$hist <- renderPlot({hist(data(), xlab=input$evidence, 
                                  ylab='Slider', main=input$titulo)})
  output$stats <- renderPrint({summary(data())})
  observeEvent(input$click, {print(as.numeric(input$click))})
}

shinyApp(ui = ui, server = server)