library(shiny)  
library(shinydashboard)

ui <- dashboardPage(skin = "purple",
                    dashboardHeader(),
                    dashboardSidebar(
                      tags$head(tags$style(HTML('.shiny-server-account { display: none; }'))), # Custom CSS to hide the default logout panel
                      uiOutput("userpanel")), # The dynamically-generated user panel
                    dashboardBody(
                      tags$head(
                        tags$style(HTML('
                                        .main-header .logo {
                                        font-family: "Georgia", Times, "Times New Roman", serif;
                                        font-weight: bold;
                                        font-size: 24px;
                                        }'))),

                      fluidPage(
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
                        fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'))))
                        )





server <- function(input, output) {
  distribucion <- reactive({dnorm(seq(-15,15,.05),input$mean,input$dev)})
  output$normal <- renderPlot({plot(seq(-15,15,.05), distribucion(), main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-15,15))})
  output$stats <- renderPrint({summary(distribucion())})
}

shinyApp(ui = ui, server = server)