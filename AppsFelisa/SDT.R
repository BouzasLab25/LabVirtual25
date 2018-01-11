library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    disable = TRUE),
  dashboardSidebar(
    width = 190,
    sidebarMenu(
      menuItem("Introducción", tabName = "intro", icon = icon("book")),
      menuItem("Sobre el modelo", tabName = "about", icon = icon("star-o")),
      menuItem("Curvas ROC", tabName="roc", icon = icon("star-o")),
      menuItem("Análisis No Paramétrico", tabName="nop", icon = icon("book")),
      menuItem("Estimación Paramétrica", tabName="para", icon = icon("info")))),
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
      tabItem(tabName = "intro",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              #fluidRow(box(   
                              HTML('<h2 style="text-align:center; color:purple;"><b>Introducción</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La <b>Teoría de Detección de Señales</b> (<b>SDT</b>, por sus siglas en inglés), describe el problema de decisión al que se enfrentan los organismos cuando, en un entorno con incertidumbre, tienen que decidir si <i>algo</i> (la <b>señal</b>) está o no presente, para poder actuar en consecuencia.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El desarrollo de la SDT gira en torno a dos grandes supuestos: <b>1) Siempre hay algún grado de incertidumbre</b> al detectar algo, por tres grandes razones: 1.- Nuestros sistemas perceptuales son imperfectos, 2.- Toda señal a detectar se presenta en el mundo con cierta variabilidad y 3.- Las señales coexisten en el mundo con <b>ruido</b>: estímulos que sin ser la señal, pueden llegar a confundirse con esta; y  <b>2) Las consecuencias importan</b>, acertar en el juicio de detección paga, errar cuesta y ambas cosas ocurren en distinta magnitud.</h4>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos ponderan la información que poseen sobre la estructura de su entorno para compensar la incertidumbre contenida en la tarea (<i>representada gráficamente como el área de sobrelape entre las distribuciones de probabilidad que describen la presentación del Ruido y la Señal</i>), fijando un <b>criterio de elección</b> (<i>la línea vertical que corta ambas distribuciones a la altura de un valor (x)</i>) que va a fungir como punto de corte para determinar a partir de cuánta evidencia se juzgará la presencia de la señal.</h4>'),
                              HTML('<h4 style="text-align: justify;">En función a la correspondencia entre la presencia o asuencia de la señal en el mundo y el juicio de elección emitido por el organismo, podemos identificar dos grandes tipos de aciertos y errores: los <b>Hits</b> ("Sí" cuando sí) y los <b>Rechazos Correctos</b> ("No" cuando no); y las <b>Falsas Alarmas</b> ("Sí" cuando no) y <b>Omisiones</b> ("No" cuando sí). Y de acuerdo con la representación gráfica de la SDT, la probabilidad de cometer cada uno de estos aciertos y errores estará determinada por el área de las distribuciones de Ruido y Señal que caigan a cada lado del criterio de elección, según sea el caso.</h3>'),
                              tags$img(height=100, 
                                       width=100,
                                       src = "https://github.com/BouzasLab25/LabVirtual25/blob/Apps/AppsFelisa/SDT_Outcomes.jpg"),
                              wellPanel(sliderInput(inputId="mean", 
                                                    label = "Media",
                                                    value=0, min=1.60, max=1.80,
                                                    step= 0.05),
                                        sliderInput(inputId="dev", 
                                                    label = "DesviaciÃ³n EstÃ¡ndar",
                                                    value=3, min=.01, max=.1,
                                                    step=.02))),
                       column(width=5, offset = 0, 
                              HTML('<h2 style="text-align:center; color:purple;"><b>Por Ejemplo:</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Imagina el caso de una presa que, tras escuchar un ruido tras la maleza, tiene que decidir si se trata, o no, de una amenaza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por la experiencia que ha adquirido, esta presa sabe que 1) no siempre que un depredador se acerca, este hace el mismo ruido y 2)los depredadores no son lo único que causan ruido en la maleza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Si la presa decide que el ruido podría ser una amenaza y sale corriendo, pueden ocurrir dos cosas: si acierta, salva su vida y si se equivoca, habrá desperdiciado energía que pudiese haber utilizado en buscar alimento.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por otro lado, si la presa decide que el ruido no fue una amenaza y se queda en su lugar, puede ser el caso que no gane ni pierda nada, si acierta, o en el peor de los casos, si comete una omisión, muera devorado.</h4>'),
                              plotOutput(outputId="normal")))
              #box(plotOutput(outputId="normal"), verbatimTextOutput("stats")))
      ),
      
      # Second tab content
      tabItem(tabName = "media",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>TeorÃ�a de DetecciÃ³n de SeÃ±ales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. ChÃ¡vez</b></p>')),
              
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
                              HTML('<h4 style="text-align: justify;">La media funciona como una <b>medida de tendencia central</b> que permite describir en torno a quÃ© valor se distribuyen las observaciones de cierta variable.</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="media")))
      ),
      
      tabItem(tabName = "desv",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>TeorÃ�a de DetecciÃ³n de SeÃ±ales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. ChÃ¡vez</b></p>')),
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>La DesviaciÃ³n EstÃ¡ndar</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> La desviaciÃ³n estÃ¡ndar es una <b>medida de dispersiÃ³n</b> de los valores registrados, que nos informa quÃ© tanto se alejan estos de la <b>media</b>.</h3>'),
                              HTML('<h3 style="text-align:justify;"> La <b>desviaciÃ³n estÃ¡ndar</b> se define como <b>la raÃ�z cuadrada de la varianza</b>.</h3>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>La varianza</b>.</h2>'),
                              HTML('<h3 style="text-align:justify;"> La varianza estÃ¡ definida como <b>el promedio de las diferencias cuadradas entre cada valor individual, y la media</b> de la muestra Ã³ poblacion de donde se estrajo.</h3>'),
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
                              HTML('<h4 style="text-align: justify;">La media funciona como una <b>medida de tendencia central</b> que permite describir en torno a quÃ© valor se distribuyen las observaciones de cierta variable.</h3>'),
                              HTML('<h4 style="text-align: justify;">La DistribuciÃ³n Normal es muy utilizada en las ciencias sociales y naturles, pues permiten describir la forma en que los <b>valores</b> observados en ciertas <b>variables</b> se distribuyen al rededor de su <b>media</b> (<i>a.k.a. el promedio de las observaciones recopiladas</i>).</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="desviacion")))
              
      ),
      
      tabItem(tabName = "prop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>TeorÃ�a de DetecciÃ³n de SeÃ±ales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. ChÃ¡vez</b></p>')),
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>Propiedades</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> TambiÃ©n llamada <b>Curva Normal</b> o <b>Campana de Gauss</b>, una distribuciÃ³n de probabilidad Normal estÃ¡ definida por los siguientes parÃ¡metros:</h3>'),
                              HTML('<h4 style="text-align: justify;">Se trata de una <b>distribuciÃ³n de probabilidad continua</b> que describe la probabilidad de que se observe cierto <b>valor (x)</b> si extraigo <b>aleatoriamente</b> un elemento perteneciente a cierta <b>muestra</b> o <b>poblaciÃ³n</b>.</h3>'),
                              HTML('<h4 style="text-align: justify;">La DistribuciÃ³n Normal es muy utilizada en las ciencias sociales y naturles, pues permiten describir la forma en que los <b>valores</b> observados en ciertas <b>variables</b> se distribuyen al rededor de su <b>media</b> (<i>a.k.a. el promedio de las observaciones recopiladas</i>).</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="props")))
      ),
      
      tabItem(tabName = "Glos",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>G L O S A R I O</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>(checa aquÃ� los conceptos con los que no estÃ©s familiarizado)</b></p>')), 
              fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h4 style="text-align: justify;"><b>DistribuciÃ³n de probabilidad contÃ�nua:</b></h3>'),
                              HTML('<h4 style="text-align: justify;"><b>Muestra y PoblaciÃ³n:</b></h3>')),
                       column(width=5, offset = 0, 
                              HTML('<h4 style="text-align: justify;"><b>Muestra y PoblaciÃ³n:</b></h3>'))),
              fluidRow(HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"')
              )
      )
    )
      )
      )

server <- function(input, output) {
  distribucion <- reactive({dnorm(seq(0.7,2.4,.001),input$mean,input$dev)})
  output$normal <- renderPlot({plot(seq(0.7,2.4,.001), distribucion(), main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(1.25,2.1), col="purple")
    axis(1,at=c(1.5, 1.6, 1.7, 1.8, 1.9, 2),labels=c("1.5", "1.6", "1.7", "1.8", "1.9", "2"), font=2)
    abline(v=input$mean, lwd=2)       
    text(input$mean+.9,.05,expression(paste(mu)),cex=2.5,col='black',f=2)
    mtext("Estatura de las mujeres en mi familia",1,cex=1.3, line=3, f=2)})
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