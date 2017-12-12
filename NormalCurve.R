  library(shiny)  


ui <- fluidPage(
  fluidRow(HTML('<h1 style="text-align:center;"><b>Distribución  Normal</b></h1>'),
           HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')), 
  
  fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')),
  
  fluidRow(column(width=5, offset = 1, background = 'yellow',
                  HTML('<h1 style="text-align:center; color:green;">Definición</h1>'),
                  HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                  tags$p("También llamada Curva Normal o Campana de Gauss, una distribución de probabilidad Normal esta definida por los siguientes parámetros:"),
                  tags$br(),
                  wellPanel(sliderInput(inputId="mean", 
                    label = "Media",
                    value=0, min=-5, max=5),
                    sliderInput(inputId="dev", 
                    label = "Desviación Estándar",
                    value=3, min=1, max=10))),
            column(width=5, offset = 0, plotOutput(outputId="normal"), verbatimTextOutput("stats"))),
  fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')))

server <- function(input, output) {
  distribucion <- reactive({dnorm(seq(-15,15,.05),input$mean,input$dev)})
  output$normal <- renderPlot({plot(seq(-15,15,.05), distribucion(), xlab=input$evidence, 
                                  ylab='Probabilidad', main="Ejemplo", xlim=c(-15,15))})
  output$stats <- renderPrint({summary(distribucion())})
}

shinyApp(ui = ui, server = server)