library(shinydashboard)

ui <- dashboardPage(
          dashboardHeader(
                          disable = TRUE),
          dashboardSidebar(
            width = 190,
            sidebarMenu(
                menuItem("Definición", tabName = "defin", icon = icon("book")),
                menuItem("La media", tabName = "media", icon = icon("star-o")),
                menuItem("Desviación Estándar", tabName="desv", icon = icon("star-o")),
                menuItem("Propiedades", tabName="prop", icon = icon("book")),
                menuItem("Glosario", tabName="Glos", icon = icon("info")))),
  dashboardBody(
    tags$head(
      tags$style(HTML('.main-header .logo {
                      font-family: "Georgia", Times, "Times New Roman", serif;
                      font-weight: bold;
                      font-size: 24px;}
                      
                      .body{
                      background-color:green;}
                      .js-irs-0 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-0 .irs-bar-edge {
                      border-color#000000;}
                      .js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                      background: #AC58FA;}
                      .js-irs-1 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-1 .irs-bar-edge {
                      border-color: #000000;}
                      .js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {
                      background: #9F81F7;}'))),
    tabItems(
      # First tab content
      tabItem(tabName = "defin",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Distribución  Normal</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
              #fluidRow(box(   
                              HTML('<h1 style="text-align:center; color:purple;"><b>Definición</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> También llamada <b>Curva Normal</b> o <b>Campana de Gauss</b>, una distribución de probabilidad Normal está definida por los siguientes parámetros:</h3>'),
                              tags$br(),
                              tags$br(),
                              wellPanel(sliderInput(inputId="mean", 
                                                    label = "La media",
                                                    value=0, min=-5, max=5),
                                        sliderInput(inputId="dev", 
                                                    label = "Desviación Estándar",
                                                    value=3, min=1, max=5)),
                              HTML('<h4 style="text-align: justify;">Se trata de una <b>distribución de probabilidad continua</b> que describe la probabilidad de que se observe cierto <b>valor (x)</b> si extraigo <b>aleatoriamente</b> un elemento perteneciente a cierta <b>muestra</b> o <b>población</b>.</h3>'),
                              HTML('<h4 style="text-align: justify;">La Distribución Normal es muy utilizada en las ciencias sociales y naturles, pues permiten describir la forma en que los <b>valores</b> observados en ciertas <b>variables</b> se distribuyen al rededor de su <b>media</b> (<i>a.k.a. el promedio de las observaciones recopiladas</i>).</h3>')),
                       column(width=5, offset = 0, 
                              tags$br(),
                              tags$br(),
                              tags$br(),
                              tags$br(),
                              plotOutput(outputId="normal"), verbatimTextOutput("stats")))
                       #box(plotOutput(outputId="normal"), verbatimTextOutput("stats")))
              ),
      
      # Second tab content
      tabItem(tabName = "media",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Distribución  Normal</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>La Media</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> La media no es otra cosa que el <b>promedio</b> de los valores registrados para cierta variable.</h3>'),
                              tags$br(),
                              tags$br(),
                              fluidRow(column(width=2, offset=1,
                                              wellPanel(numericInput(inputId="val_1", 
                                                                     label = "Dato 1",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_2", 
                                                                     label = "Dato 2",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_3", 
                                                                     label = "Dato 3",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_4", 
                                                                     label = "Dato 4",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_5", 
                                                                     label = "Dato 5",
                                                                     value=1, min=0, max=10,
                                                                     width='150px')))),
                              HTML('<h4 style="text-align: justify;">La media funciona como una <b>medida de tendencia central</b> que permite describir en torno a qué valor se distribuyen las observaciones de cierta variable.</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="media")))
      ),
      
      tabItem(tabName = "desv",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Distribución  Normal</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>La Desviación Estándar</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> La desviación estándar es una <b>medida de dispersión</b> de los valores registrados, que nos informa qué tanto se alejan estos de la <b>media</b>.</h3>'),
                              HTML('<h3 style="text-align:justify;"> La <b>desviación estándar</b> se define como <b>la raíz cuadrada de la varianza</b>.</h3>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>La varianza</b>.</h2>'),
                              HTML('<h3 style="text-align:justify;"> La varianza está definida como <b>el promedio de las diferencias cuadradas entre cada valor individual, y la media</b> de la muestra ó poblacion de donde se estrajo.</h3>'),
                              fluidRow(column(width=2, offset=1,
                                              wellPanel(numericInput(inputId="val_1", 
                                                                     label = "Dato 1",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_2", 
                                                                     label = "Dato 2",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_3", 
                                                                     label = "Dato 3",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_4", 
                                                                     label = "Dato 4",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_5", 
                                                                     label = "Dato 5",
                                                                     value=1, min=0, max=10,
                                                                     width='150px')))),
                              HTML('<h4 style="text-align: justify;">La media funciona como una <b>medida de tendencia central</b> que permite describir en torno a qué valor se distribuyen las observaciones de cierta variable.</h3>'),
                              HTML('<h4 style="text-align: justify;">La Distribución Normal es muy utilizada en las ciencias sociales y naturles, pues permiten describir la forma en que los <b>valores</b> observados en ciertas <b>variables</b> se distribuyen al rededor de su <b>media</b> (<i>a.k.a. el promedio de las observaciones recopiladas</i>).</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="desviacion")))
            
      ),
      
      tabItem(tabName = "prop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Distribución  Normal</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>Propiedades</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> También llamada <b>Curva Normal</b> o <b>Campana de Gauss</b>, una distribución de probabilidad Normal está definida por los siguientes parámetros:</h3>'),
                              HTML('<h4 style="text-align: justify;">Se trata de una <b>distribución de probabilidad continua</b> que describe la probabilidad de que se observe cierto <b>valor (x)</b> si extraigo <b>aleatoriamente</b> un elemento perteneciente a cierta <b>muestra</b> o <b>población</b>.</h3>'),
                              HTML('<h4 style="text-align: justify;">La Distribución Normal es muy utilizada en las ciencias sociales y naturles, pues permiten describir la forma en que los <b>valores</b> observados en ciertas <b>variables</b> se distribuyen al rededor de su <b>media</b> (<i>a.k.a. el promedio de las observaciones recopiladas</i>).</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="props")))
      ),
      
      tabItem(tabName = "Glos",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>G L O S A R I O</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>(checa aquí los conceptos con los que no estés familiarizado)</b></p>')), 
              fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h4 style="text-align: justify;"><b>Distribución de probabilidad contínua:</b></h3>'),
                              HTML('<h4 style="text-align: justify;"><b>Muestra y Población:</b></h3>')),
                       column(width=5, offset = 0, 
                              HTML('<h4 style="text-align: justify;"><b>Muestra y Población:</b></h3>'))),
              fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')
              )
      )
    )
  )
)

server <- function(input, output) {
  distribucion <- reactive({dnorm(seq(-15,15,.05),input$mean,input$dev)})
  output$normal <- renderPlot({plot(seq(-15,15,.05), distribucion(), main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-15,15), col="purple")
    axis(1,at=c(-14,15, 10, 7, 5, 4, 3, 2, 1, 0, -10, -7, -5, -4, -3, -2, -1),labels=c("-Infinito", "Infinito", "10", "7", "5", "4", "3", "2", "1", "0", "-10", "-7", "-5", "-4", "-3", "-2", "-1"), font=2)
    abline(v=input$mean, lwd=2)       
    text(input$mean+.9,.05,expression(paste(mu)),cex=2.5,col='black',f=2)
    text(1.9,(.2),"Hola",cex=1.2,col='white',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  output$stats <- renderPrint({summary(distribucion())})
  
  valores <- reactive({c(input$val_1,input$val_2,input$val_3,input$val_4,input$val_5)})
  output$media <- renderPlot({plot(c(1:5),valores(), main="", xlab="", ylab="", pch=16,
                                   font.lab=2, axes = "FALSE", xlim= c(1,5), ylim= c(0,10), col="purple")
    axis(1,at=c(5, 4, 3, 2, 1),labels=c("Dato 5", "Dato 4", "Dato 3", "Dato 2", "Dato 1"), font=2)
    axis(2,at=c(5, 4, 3, 2, 1, 6, 7, 8, 9, 10),labels=c("5", "4", "3", "2", "1", "6", "7", "8", "9", "10"), font=2)
    lines(c(1,5),c(mean(valores()),mean(valores())), lwd=2, lty=1, col="deepskyblue3")    
    text(1,mean(valores())+1,expression(paste(mu)),cex=2.5,col='black',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  
  output$props <- renderPlot({plot(seq(-6,6,.05), dnorm(seq(-6,6,.05),0,1), main="", xlab="", ylab="",type='l',
                                   font.lab=2, axes = "FALSE", xlim= c(-4,4), col="black", lwd=2)
    axis(1,at=c(4, 3, 2, 1, 0, -4, -3, -2, -1),labels=c("4", "3", "2", "1", "0", "-4", "-3", "-2", "-1"), font=2)
    abline(v=0, lwd=2)       
    abline(v=input$mean, lwd=2)
    abline(v=input$mean, lwd=2)
    text(0.3,.05,expression(paste(mu)),cex=2.5,col='black',f=2)
    text(1.9,(.2),"Hola",cex=1.2,col='white',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  
  output$desviacion <- renderPlot({plot(c(1:5),valores(), main="", xlab="", ylab="", pch=16,
                                        font.lab=2, axes = "FALSE", xlim= c(1,5), ylim= c(0,10), col="purple")
    axis(1,at=c(5, 4, 3, 2, 1),labels=c("Dato 5", "Dato 4", "Dato 3", "Dato 2", "Dato 1"), font=2)
    axis(2,at=c(5, 4, 3, 2, 1, 6, 7, 8, 9, 10),labels=c("5", "4", "3", "2", "1", "6", "7", "8", "9", "10"), font=2)
    lines(c(1,5),c(mean(valores()),mean(valores())), lwd=2, lty=1, col="deepskyblue3")    
    text(1,mean(valores())+1,expression(paste(mu)),cex=2.5,col='black',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
}

shinyApp(ui, server)
