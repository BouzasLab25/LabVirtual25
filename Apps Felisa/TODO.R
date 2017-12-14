library(shiny)  
library(shinydashboard)

ui <- dashboardPage(skin = "purple",
                    dashboardHeader(disable = TRUE),
                    dashboardSidebar(
                      width = 150,
                      sidebarMenu(
                        menuItem("DefiniciÃ³n", tabName = "def"),
                        menuItem("La media", tabName = "mean"), 
                        menuItem("DesviaciÃ³n EstÃ¡ndar"),
                        menuItem("Propiedades")),
                    uiOutput("userpanel")),
                    dashboardBody(
                      tags$head(
                        tags$style(HTML('
                                        .main-header .logo {
                                        font-family: "Georgia", Times, "Times New Roman", serif;
                                        font-weight: bold;
                                        font-size: 24px;
                                        }
                                        .body{
                                        background-color:green;}'))),
                      
                      tabItems(
                        # First tab content
                        tabItem(tabName = "def",
                                  fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b>Distribución  Normal</b></h1>'),
                                           HTML('<p style="text-align:center;"><b>por Adriana F. Chvez</b></p>')), 
                                  
                                  fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')),
                                  
                                  fluidRow(column(width=5, offset = 1, background = 'yellow',
                                                  HTML('<h1 style="text-align:center; color:purple;">DefiniciÃ³n</h1>'),
                                                  HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                                                  tags$p("TambiÃ©n llamada Curva Normal o Campana de Gauss, una distribuciÃ³n de probabilidad Normal esta definida por los siguientes parÃ¡metros:"),
                                                  tags$br(),
                                                  wellPanel(sliderInput(inputId="mean", 
                                                                        label = "Media",
                                                                        value=0, min=-5, max=5),
                                                            sliderInput(inputId="dev", 
                                                                        label = "Desviación Estándar",
                                                                        value=3, min=1, max=5))),
                                           column(width=5, offset = 0, plotOutput(outputId="normal"), verbatimTextOutput("stats"))),
                                  fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')
                                           )),      
                        
                        # Second tab content
                        tabItem(tabName = "mean",
                                h2("Widgets tab content")
                        ))))

                      




server <- function(input, output) {
  distribucion <- reactive({dnorm(seq(-15,15,.05),input$mean,input$dev)})
  output$normal <- renderPlot({plot(seq(-15,15,.05), distribucion(), main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-15,15), col="purple")
    axis(1,at=c(-14,15, 10, 7, 5, 4, 3, 2, 1, -10, -7, -5, -4, -3, -2, -1),labels=c("-Infinito", "Infinito", "10", "7", "5", "4", "3", "2", "1", "-10", "-7", "-5", "-4", "-3", "-2", "-1"), font=2)
    text(0.72,(.2),"adios",cex=1.2,col='black',f=2)
    text(1.9,(.2),"Hola",cex=1.2,col='white',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  output$stats <- renderPrint({summary(distribucion())})
}

shinyApp(ui = ui, server = server)